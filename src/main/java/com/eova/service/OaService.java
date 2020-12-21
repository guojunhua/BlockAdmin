package com.eova.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.dingtalk.api.response.OapiRoleListResponse.PageVo;
import com.dingtalk.api.response.OapiUserGetResponse.Roles;
import com.alibaba.fastjson.JSONObject;
import com.dingtalk.api.request.OapiProcessinstanceCreateRequest.FormComponentValueVo;
import com.dingtalk.api.response.OapiProcessinstanceCreateResponse;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.eova.common.base.BaseService;
import com.eova.common.utils.EncryptUtil;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.JacksonUtil;
import com.eova.config.EovaConfig;
import com.eova.core.object.config.MetaObjectConfig;
import com.eova.exception.BusinessException;
import com.eova.model.Button;
import com.eova.model.DdCfg;
import com.eova.model.MetaObject;
import com.eova.model.OaProcess;
import com.eova.model.OaProcessTask;
import com.eova.model.Role;
import com.eova.model.User;
import com.eova.model.UserInfo;
import com.eova.widget.WidgetManager;
import com.google.common.base.Joiner;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oss.job.DdSynJob;
import com.taobao.api.ApiException;

/**
* @Description:OA相关操作都在此
* 原则：1、部门同步的，如果有同名的可更新（需没有外部ID）
* 2、用户同步的，根据手机，否则新增,用户如果无角色则根据用户信息新增角色
* 3、角色同步的（根据名称），如无则新建一个无权限角色
* @author 作者:jzhao
* @createDate 创建时间：2020年5月6日 下午9:49:03
* @version 1.0     
*/
public class OaService extends BaseService{
	private static final Logger log = LogManager.getLogger(OaService.class);
	
	//MetaObject object
	

	/**
	 * 发起申请
	 * @param object
	 * @param record 转义记录（如有特别要输出得可以放入此）
	 * @param params 根据record转义，如果有diy需求可以独立放入
	 * @param user 发起人，原则上为当前用户
	 */
	public OaProcess approve(MetaObject object,Record record,List<FormComponentValueVo> params,User user) throws BusinessException{
		MetaObjectConfig cfg = object.getConfig();
		Map oaCfg = (Map)cfg.getConfig().get("bb_oa");
		//启用oa
		List<Map> fields =(List) oaCfg.get("field");
		//fields
		
		if(params == null)
			params = new ArrayList();
		
		for(Map f:fields) {
			String keyField = f.keySet().iterator().next().toString();
			String valueField =(String) f.get(keyField);
			
			Optional<FormComponentValueVo> voOpt  = params.stream().filter(v->v.getName().equalsIgnoreCase(valueField)).findFirst();
			if(voOpt.isPresent())
				continue;
			
			FormComponentValueVo vo = new FormComponentValueVo();
			vo.setName(valueField);
			
			Object value = record.get(keyField);
			if(value != null)
				vo.setValue(value.toString());
			else
				vo.setValue("-");
			params.add(vo);
		}
		
		
		String viewField = (String)oaCfg.get("bb_view_url");
		if(!xx.isEmpty(viewField)) {
			Optional<FormComponentValueVo> voOpt  = params.stream().filter(v->v.getName().equalsIgnoreCase(viewField)).findFirst();
			if(!voOpt.isPresent()) {
			
				FormComponentValueVo vo = new FormComponentValueVo();
				vo.setName(viewField);
				
				
				//http://127.0.0.1:801/form/detail/hotel-16?template=h
				String timestemp = String.valueOf(System.currentTimeMillis());
				String viewUrl = xx.getConfig("app_domain")+"/form/detailAuthView/"+object.getCode()+"-"+record.get(object.getPk())+"?template="+xx.getConfig("app_template_ui","h")+"&timestemp="+timestemp;
				
				String sign = EncryptUtil.getSM32(object.getCode()+record.get(object.getPk())+timestemp);
				viewUrl = viewUrl +"&sign="+sign;
				vo.setValue("[查看详情](dingtalk://dingtalkclient/page/link?pc_slide=true&url="+viewUrl+")");
				
				params.add(vo);
			}
		}
		
		
			String process_instance_id = ServiceManager.oaService.processCreate(user,record,params);
			
			OaProcess process =	OaProcess.dao.getTheOaProcess(object.getCode(), record.getNumber(object.getPk()));//走了缓存，否则还是批量IN查询
			if(process == null) {
				process = new OaProcess();
				
				process.set("object_code",object.getCode());
				process.set("object_row_id",record.getNumber(object.getPk()));
				process.set("org_id",user.getNumber("org_id"));
				process.set("originator_third_userid",user.getStr("third_id"));
				process.set("originator_userid",user.getNumber("id"));
				
				process.set("status",0);
				process.set("process_id",process_instance_id);
				process.set("result",-1);
				process.save();
			}else {
				process.set("status",0);
				process.set("process_id",process_instance_id);
				process.update();
			}

			
			process.removeByKey(object.getCode()+"_"+record.get(object.getPk()).toString());
			return process;
		
	}
	
	public String processCreate(User user,Record record,List<FormComponentValueVo> params) throws BusinessException{
		Integer orgId= user.getUserInfo().getInt("org_id");
		if(orgId == null) {
			log.error("用户:"+user.getStr("login_id")+"无组织，发起OA失败");
			throw new BusinessException("用户:"+user.getStr("login_id")+"无组织，发起OA失败");
		}
		Integer depId = user.getUserInfo().getInt("dep_id");
		if(depId == null) {
			log.error("用户:"+user.getStr("login_id")+"无部门，发起OA失败");
			throw new BusinessException("用户:"+user.getStr("login_id")+"无部门，发起OA失败");
		}
		
		DdCfg cfg = DdCfg.dao.queryTheCfg(orgId);
		
		Record depart = Db.use(xx.DS_MAIN).findById("t_department", depId);
		if(depart == null || depart.get("third_id") == null || xx.isEmpty(user.getStr("third_id"))) {
			log.error("用户:"+user.getStr("login_id")+"非钉钉合法用户,发起审批失败");
			throw new BusinessException("用户:"+user.getStr("login_id")+"非钉钉合法用户,发起审批失败");
		}
		
		try {
			
			OapiProcessinstanceCreateResponse response = ServiceManager.dingdingService.processCreate(cfg, user.getStr("third_id"), Long.parseLong(depart.getStr("third_id")) , params);
			
			if (response.isSuccess()) {
//				
				return response.getProcessInstanceId();
			}else {
				log.error("用户:"+user.getStr("login_id")+"发起OA失败，"+response.getErrmsg()+"("+record.get("id")+")");
				throw new BusinessException("系统故障稍后再试");
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e.getMessage());
			throw new BusinessException("系统故障稍后再试");
		}
		
	}
	
	public void synDepart() {
		List<DdCfg> cfgs = DdCfg.dao.queryAllCfgs();
		
		cfgs.forEach(c->{
			Integer orgId = c.getInt("org_id");
			List<Department> ds;
			try {
				ds = ServiceManager.dingdingService.getAllDepartments(c);
			} catch (ApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return;//继续咯
			}
			List<Record> currentDs = Db.use(xx.DS_MAIN).find("select * from t_department where customer_id=? and state=1", orgId);
			
			ds.forEach(rd->{
				Long id = rd.getId();
				String name = rd.getName();
				Optional<Record> theDepOpt = currentDs.stream().filter(d-> !xx.isEmpty(d.get("third_id")) && d.get("third_id").equals(id.toString())).findFirst();
				if(theDepOpt.isPresent()) {
					//theDep.
					saveDepart(theDepOpt.get(),rd,orgId);
					return;
				}
				theDepOpt = currentDs.stream().filter(d-> xx.isEmpty(d.get("third_id"))  && !xx.isEmpty(d.get("department")) && d.get("department").equals(name)).findFirst();
				if(theDepOpt.isPresent()) {
					//theDep.
					saveDepart(theDepOpt.get(),rd,orgId);
					return;
				}
				//新建部门
				saveDepart(null,rd,orgId);
			});
			
			//再次查询下本地数据(确认父亲节点)
			initParent(ds,orgId);
			
			//删除不存在的部门
			currentDs.forEach(cd->{
				String third_id = cd.get("third_id");
				
				if(!xx.isEmpty(third_id)) {
					Optional<Department> theDepOpt = ds.stream().filter(rd->rd.getId().toString().equals(third_id)).findFirst();
					if(!theDepOpt.isPresent()) {
						cd.set("state", 0);
						Db.use(xx.DS_MAIN).update("t_department",cd);
					}
				}
				
			});
		});
		
	}
	
	
	
	public void synRole() {
		//蛋疼的目前角色非saas的，根据名称来把（原则上只支持一家）
		List<DdCfg> cfgs = DdCfg.dao.queryAllCfgs();
		
		List<Role> roles = Role.dao.allRoles();
		
		cfgs.forEach(c->{
			Integer orgId = c.getInt("org_id");
			PageVo rolePage;
			try {
				rolePage = ServiceManager.dingdingService.getRoles(c);
			} catch (ApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return;//继续咯
			}
			
			rolePage.getList().forEach(g->{
				g.getRoles().forEach(r->{
					String roleName = r.getName();
					Optional<Role> localRoleOpt = roles.stream().filter(localr->localr.get("name").equals(roleName)).findFirst();
					if(!localRoleOpt.isPresent()) {
						//创建一个新的
						Role localRole = new Role();
						localRole.set("name", roleName);
						localRole.set("info", roleName);
						localRole.set("lv", 100);//先给默认值100
						localRole.save();
					}
				});
			});
			
		});
		
		
		Role.dao.removeAllCache();
	}
	
	//用户是同步的，根据手机，否则新增,用户如果无角色则根据用户信息新增角色
	public void synUsers() {
		List<DdCfg> cfgs = DdCfg.dao.queryAllCfgs();
		
		cfgs.forEach(c->{
			Integer orgId = c.getInt("org_id");
			List<Department> ds;
			try {
				ds = ServiceManager.dingdingService.getAllDepartments(c);
			} catch (ApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return;//继续咯
			}
			
			ds.forEach(rd->{
				log.info("同步部门：" + rd.getName());
				Long departId = rd.getId();
				Record currentDepart = Db.use(xx.DS_MAIN).findFirst("select * from t_department where customer_id=? and third_id=? and state=1", orgId,departId.toString());
				List<Userlist> userSimpleList;
				try {
					userSimpleList = ServiceManager.dingdingService.getDepartmentUserSimples(c,departId);
				} catch (ApiException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					return;//
				}
				
				userSimpleList.stream().forEach(su->{
					String userId = su.getUserid();
					OapiUserGetResponse userInfo;
					try {
						userInfo = ServiceManager.dingdingService.getTheUserInfo(c, userId);
					} catch (ApiException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return;
					}
					//一堆信息，有则更新（id，其次手机号） 无则添加
					
					saveUser(userInfo,currentDepart,orgId);
				});
				
				
				
				//有thridID，但是不在部门内的人应该移除
				List<UserInfo> departUsers = UserInfo.dao.find("select * from t_user where dep_id=? and third_id is not null", currentDepart.getInt("id"));
				
				departUsers.forEach(bbu->{
					String thirdId = bbu.get("third_id");
					Optional<Userlist> userSimpleOpt = userSimpleList.stream().filter(us->us.getUserid().equals(thirdId)).findFirst();
					if(!userSimpleOpt.isPresent()) {//移除出部门
						bbu.set("dep_id", null);//目前不删除，只把部门ID清除掉
						bbu.update();
					}
				});
				 
				
			});
			
			
			
		});
	}
	
	public void initCfgs() {
		List<DdCfg> cfgs = DdCfg.dao.queryAllCfgs();
		cfgs.forEach(c->{
			ServiceManager.dingdingService.initDD(c);
		});
	}
	
	public void processEvent(JSONObject obj) {
		String eventType = obj.getString("EventType"); 
		String processInstanceId = obj.getString("processInstanceId");
		
		OaProcess process = OaProcess.dao.getTheOaProcessByProcessId(processInstanceId);
		if(process == null
				 ) {//为空或者已完成，直接返回
			
			log.info("审批号："+processInstanceId+ " 为空或者已完成");
			return;
			
		}
		
		int processId = process.getNumber("id").intValue();
		
		
		if("bpms_task_change".equalsIgnoreCase(eventType)) {//bpms_task_change 审批任务开始，结束，转交（每次审批任务：开始、结束、转交）
			log.info("bpms_task_change:"+obj.toJSONString());
			String taskId = obj.getString("taskId");
			
			String type = obj.getString("type");
			if("start".equalsIgnoreCase(type)) {			
				OaProcessTask task = new OaProcessTask();
				task.set("process_id", process.get("id"));
				task.set("task_id",taskId );
				task.set("status", 0);
				task.set("result", 3);//暂无
				task.set("create_time", new Date(obj.getLong("createTime")));
				String thirdId = obj.getString("staffId");
				User user = User.dao.getByThirdId(thirdId);
				if(user != null) {
					task.set("user_id", user.getNumber("id"));
				}
				task.set("third_id", thirdId);
				
	
				task.save();
				
			}else if("finish".equalsIgnoreCase(type)) {//"result": "redirect", 和 "result": "refuse", 以及 agree
				
				OaProcessTask task = OaProcessTask.dao.getTheOaProcessTask(processId,taskId);
				
				
				if(task != null) {
					process.set("last_userid",task.get("user_id") );
				}else {
					String staffId = obj.getString("staffId");
					User user = User.dao.getByThirdId(staffId);
					if(user != null) {
						task.set("user_id", user.getNumber("id"));
					}
				}
				
				
				String remark = obj.getString("remark");
				
				//if(!xx.isEmpty(remark))
				process.set("remark", remark);//不管怎么都设置，覆盖之前的备注
				
				//审批结果:1=同意,0=拒绝,2=转交,3=无
				String result = obj.getString("result");
				if("redirect".equalsIgnoreCase(result)) {
					process.set("last_result", 2);
				}else if("refuse".equalsIgnoreCase(result)) {
					process.set("last_result", 0);
				}else if("agree".equalsIgnoreCase(result)) {
					process.set("last_result", 1);
				}
				process.update();
				
				
				if(task != null) {
					Long finishTime = obj.getLong("finishTime");
					if(!xx.isEmpty(remark))
						task.set("remark", remark);
					if(finishTime != null)
						task.set("finish_time", new Date(finishTime));
					
					task.set("status",1 );
					task.set("result",process.get("last_result") );
					task.update();
				}
				
				syn2src(process);
			}
			
			OaProcessTask.dao.removeByKey(String.valueOf(processId));
			//暂时不操作把，可以记录下个操作人以及上次操作人，不过可以通过点击详情查看吧
		}else if("bpms_instance_change".equalsIgnoreCase(eventType)) {//bpms_instance_change 审批实例开始，结束
			log.info("bpms_instance_change:"+obj.toJSONString());
			if(process.getNumber("result")!= null ) {//为空或者已完成，直接返回
				
				log.info("审批号："+processInstanceId+ " 已完成，不需要后续处理");
				return;
			}
			
			//要么开始了，要么结束并且给结果
			String type = obj.getString("type");
			if("start".equalsIgnoreCase(type)) {
				//审批状态:0=创建,1=运行中,2=被终止,3=完成
				
				process.set("status", 1);
			}else if("finish".equalsIgnoreCase(type)) {//审批正常结束
				String result = obj.getString("result");//agree，拒绝时result为refuse
				//String remark = obj.getString("remark");//拒绝/同意理由
				
				if(result.equalsIgnoreCase("agree")) {
					process.set("result", 1);
				}else if(result.equalsIgnoreCase("refuse")) {
					process.set("result", 0);
				}
				process.set("status", 3);
				
				//process.set("remark", remark);
			}else if("terminate".equalsIgnoreCase(type)) {//终止是啥情况？
				process.set("result", 2);
				
				process.set("status", 2);
			}
			Long finishTime = obj.getLong("finishTime");
			if(finishTime != null) {
				process.set("finish_time", new Date(finishTime));
			}
			
			
			process.update();
			syn2src(process);
		}
		
		
		OaProcess.dao.removeByKey(process.getStr("object_code")+"_"+process.getNumber("object_row_id").toString());
	}
	
	
	/**
	 * 同步到源表（视图需要指定同步表，表可以不指定）
	 */
	private void syn2src(OaProcess process) {
		String objectCode = process.getStr("object_code");
		Object rowId = process.get("object_row_id");
		
		MetaObject object = MetaObject.dao.getByCode(objectCode);
		String tableName = object.getStr("table_name");
		Map sysFields = null;
		
		MetaObjectConfig cfg = object.getConfig();
		if(cfg != null) {
			//Map config.getConfig().get("bb_oa");
			
			Map oaCfg = (Map)cfg.getConfig().get("bb_oa");
    		if(oaCfg != null) {
    			String syn_table = (String)oaCfg.get("syn_table");
    			if(!xx.isEmpty(syn_table))
    				tableName = syn_table;
    		}
    		
    		sysFields = (Map)oaCfg.get("syn_field");
		
		}
		
		
		if(!xx.isEmpty(tableName) && sysFields != null) {//才需要同步,同时还需要字段映射至少存在一个
			//update tableName set a=?,b=? where c=?
			StringBuilder sb = new StringBuilder("update "+tableName+" set ");
			List params = new ArrayList();
			int i =0;
			
			for(Object key : sysFields.keySet()){
			    String value = (String)sysFields.get(key);
				if(!xx.isEmpty(key)&&!xx.isEmpty(value)) {
					if(i++ == 0)
						sb.append((String)value+"=? ");
					else	
						sb.append(","+(String)value+"=? ");

					params.add(process.get((String)key));
				}
			}
			
			
			
			if(i>0) {
				sb.append(" where "+object.getPk()+"=?");
				params.add(rowId);
				
				log.info("sql:"+sb.toString());
				
				Object[] pams = new Object[params.size()];
				params.toArray(pams);
				Db.use(object.getDs()).update(sb.toString(), pams);
				
			}else {
				log.info("未配置合适的同步字段，退出。");
			}
		}
		
		
	}
	
	
	
	
	
	private void saveUser(OapiUserGetResponse userInfo,Record currentDepart,Integer orgId) {
		//为了测试安全，手机号去掉最后一位(正式环境去掉)
		String env = EovaConfig.getProps().get("env");
		if(!"PRD".equalsIgnoreCase(env) ){
			log.error("非正式环境，同步的手机号："+userInfo.getMobile()+" 将把最后两位调整为00");
			userInfo.setMobile(userInfo.getMobile().substring(0, userInfo.getMobile().length()-2)+"00");
		}
		
		
		//一堆信息，有则更新（id，其次手机号） 无则添加
		User user = User.dao.getByThirdId(userInfo.getUserid());//有没有可能第三方ID重复？未确认
		if(user == null)
			user = User.dao.getByLoginId(userInfo.getMobile());//登录ID即为手机号
		
		UserInfo uInfo = null;
		if(user == null) {
			uInfo = new UserInfo();
			user = new User();
		}else
			uInfo = UserInfo.dao.findById(user.get("id"));
		
		uInfo.set("status", "1");
		uInfo.set("login_id", userInfo.getMobile());
		uInfo.set("nickname", userInfo.getName());
		uInfo.set("reg_time", new Date());
		uInfo.set("info", "来源钉钉");
		
		uInfo.set("is_delete", 0);
		
		//uInfo.set("avatar", );
		uInfo.set("email", userInfo.getEmail());
		uInfo.set("mobile", userInfo.getMobile());
		uInfo.set("sexy", 1);
		uInfo.set("third_id", userInfo.getUserid());
		uInfo.set("org_id", orgId);
		
		
		//设置部门
		List<Long> departIds = userInfo.getDepartment();//多部门，目前系统只支持一个，只取第一个
		//Long departId = departIds.get(0);
		uInfo.set("dep_id", currentDepart.get("id"));
		
		//设置角色
		List<Role> bbRoles = Role.dao.allRoles();
		List<Roles> ddRoles = userInfo.getRoles();
		
		List<Long> ddRoleIds = new ArrayList();
		
		if(ddRoles != null) {
			ddRoles.forEach(ddr->{
	
				Optional<Role> bbRoleOpt = bbRoles.stream().filter(bbr->bbr.get("name").equals(ddr.getName())).findFirst();
				if(bbRoleOpt.isPresent()) {
					ddRoleIds.add(bbRoleOpt.get().getLong("id"));
				}
			});
		}
		if(!ddRoleIds.isEmpty()) {
			uInfo.set("rid", ddRoleIds.get(0));//
			uInfo.set("rids", Joiner.on(",").join(ddRoleIds));//
		}
		
		boolean isAdd = true;
		if(uInfo.get("id") == null) 
			uInfo.save();
		else {
			isAdd = false;
			uInfo.update();
		}
			
		
		//同步到User
		if(user.get("id") == null) {
			user.set("login_id", uInfo.get("login_id"));
			user.set("id", uInfo.get("id"));
			
			String psw = xx.getConfig("user_df_psw", "000000");
			user.set("login_pwd", EncryptUtil.getSM32(psw));
		}
		
		user.set("rid", uInfo.get("rid"));
		user.set("rids", uInfo.get("rids"));
		user.set("third_id", userInfo.getUserid());
		user.set("login_id", userInfo.getMobile());
		
		if(isAdd)
			user.save();
		else
			user.update();
	}
	
	private Record saveDepart(Record localDepart,Department depart,Integer orgId) {
		if(localDepart == null) {
			localDepart = new Record();
		}
		localDepart.set("department", depart.getName());
		localDepart.set("state", 1);
		localDepart.set("customer_id", orgId);
		localDepart.set("third_id", depart.getId().toString());
		
		if(depart.getId().equals(1L)) {//根节点
			localDepart.set("p_id", 0);
		}
		
		if(localDepart.get("id") == null)
			Db.use(xx.DS_MAIN).save("t_department", localDepart);
		else
			Db.use(xx.DS_MAIN).update("t_department", localDepart);
		
		
		return localDepart;
	}
	
	//再次查询下本地数据(确认父亲节点)
	private void initParent(List<Department> ds,Integer orgId) {
			//再次查询下本地数据(确认父亲节点)
			List<Record> currentDs = Db.use(xx.DS_MAIN).find("select * from t_department where customer_id=? and state=1 and third_id is not null", orgId);
			currentDs.forEach(cd->{
				if(cd.get("p_id")!= null && cd.getInt("p_id") == 0 ) {//根节点不需要执行
					return;
				}
				String third_id = cd.get("third_id");
				if(!xx.isEmpty(third_id)) {
					Optional<Department> dOpt = ds.stream().filter(rd->rd.getId().toString().equals(third_id)).findFirst();
					dOpt.get().getParentid();
					
					log.info(JacksonUtil.bean2Json(dOpt.get()) );
					
					Optional<Record> parentOpt =  currentDs.stream().filter(cd2->cd2.get("third_id").equals(dOpt.get().getParentid().toString())).findFirst();
					;
					cd.set("p_id", parentOpt.get().get("id"));//设置父节点ID
					Db.use(xx.DS_MAIN).update("t_department", cd);
				}
			});
		}
		
		
}
