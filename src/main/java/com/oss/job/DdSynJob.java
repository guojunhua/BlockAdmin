package com.oss.job;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;

import com.eova.common.utils.util.HttpClientUtil;
import com.eova.service.ServiceManager;

/**
* @Description:钉钉数据同步定时器（目前按小时执行把）
* @author 作者:jzhao
* @createDate 创建时间：2020年5月7日 上午10:33:22
* @version 1.0     
*/
public class DdSynJob extends AbsJob {
	private static final Logger log = LogManager.getLogger(DdSynJob.class);
	@Override
	protected void process(JobExecutionContext context) {
		// TODO Auto-generated method stub
		log.info("开始同步钉钉");
		
		synDepart();
		
		synRole();
		
		synUsers();
		
		log.info("开始同步钉钉结束");
	}
	
	private void synDepart() {
		try {
			ServiceManager.oaService.synDepart();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void synRole() {
		try {
			ServiceManager.oaService.synRole();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void synUsers() {
		try {
			ServiceManager.oaService.synUsers();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
