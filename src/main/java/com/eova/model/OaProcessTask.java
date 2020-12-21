package com.eova.model;

import java.util.List;
import java.util.Optional;

import com.eova.common.base.BaseModel;

/**
* @Description:工作流主表 子任务表（子任务的文件暂时未存储）
* @author 作者:jzhao
* @createDate 创建时间：2020年5月11日 下午10:40:49
* @version 1.0     
*/
public class OaProcessTask extends BaseModel<OaProcessTask> {
	public static final OaProcessTask dao = new OaProcessTask();
	
	public OaProcessTask getTheOaProcessTask(int pocessId,String taskId) {
		
//		OaProcessTask task = this.findFirstByCache(this.getClass().getSimpleName()
//				, pocessId+"_"+taskId
//				, "select * from bb_oa_process_task where process_id = ? and task_id=? limit 1",pocessId,taskId);
//		return task;
		
		List<OaProcessTask> tasks = getTheOaProcessTasks(pocessId);
		Optional<OaProcessTask>	task = tasks.stream().filter(t->t.getStr("task_id").equalsIgnoreCase(taskId)).findFirst();
	
		
		return task.orElse(null);
	}
	
	public List<OaProcessTask> getTheOaProcessTasks(int pocessId) {
		
		List<OaProcessTask> tasks = this.findByCache(this.getClass().getSimpleName()
				, pocessId
				, "select * from bb_oa_process_task where process_id = ? order by id asc",pocessId);//按照任务顺序
		return tasks;
	}
}
