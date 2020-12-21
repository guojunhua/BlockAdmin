package com.oss.job;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;

import com.eova.common.utils.xx;
import com.eova.common.utils.util.StringUtils;

/**
* @Description:每天凌晨4点重启帆软BI（免费版本天天不能用），只能linux跑
* @author 作者:jzhao
* @createDate 创建时间：2020年5月10日 上午11:21:45
* @version 1.0     
*/
public class EveryDayRestartFinebiJob extends AbsJob {
	private static final Logger log = LogManager.getLogger(EveryDayRestartFinebiJob.class);
	
	private static final String CMD_GETPID = "pgrep -f finebi";
	 
	@Override
	protected void process(JobExecutionContext context) {
		log.info("开始尝试重启finbi");
		//runEovaInit();
		
		String finbiCMD = xx.getConfig("finebi_cmd", "nohup /opt/FineBI5.1/bin/finebi &");
		
		try {
			String result = runCMD(CMD_GETPID);
			
			if(!xx.isEmpty(result) && StringUtils.isNumeric(result)) {
				
				
				String killCMD = "kill "+result;//如果嫌弃这个慢，可以直接“kill -9 xxx”
				runCMD(killCMD);
			}
			
			runCMD(finbiCMD);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			log.error("尝试重启finbi 失败："+e.getMessage());
		} 
		
		log.info("尝试重启finbi 完成！");
	}
	
	
	
	public static String runCMD(String cmd) throws IOException, InterruptedException {
        final String METHOD_NAME = "runCMD";
        log.info( "#CMD: " + cmd);
        // Process p = Runtime.getRuntime().exec("cmd.exe /C " + cmd);
        Process p = Runtime.getRuntime().exec(cmd);
        BufferedReader br = null;
        try {
            // br = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            br = new BufferedReader(new InputStreamReader(p.getInputStream()));
           // String readLine = br.readLine();
            StringBuilder builder = new StringBuilder();
            String readLine = null;
            while ((readLine=br.readLine()) != null) {
               // readLine = br.readLine();
                builder.append(readLine);
            }
            log.info( "#readLine: " + builder.toString());

            p.waitFor();
            int i = p.exitValue();
            log.info(METHOD_NAME + "#exitValue = " + i);
         
            return builder.toString();
        } catch (IOException e) {
            log.error(METHOD_NAME + "#ErrMsg=" + e.getMessage());
            e.printStackTrace();
            throw e;
        } finally {
            if (br != null) {
                br.close();
            }
        }
    }
}
