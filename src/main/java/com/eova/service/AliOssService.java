/**
 * 
 */
package com.eova.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.eova.common.base.BaseService;
import com.eova.common.utils.AliOSSUtil;
import com.eova.common.utils.xx;
import com.eova.common.utils.io.FileUtil;
import com.eova.common.utils.util.StringUtils;
import com.eova.widget.upload.UploadQiniuController;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * ali oss服务
 * @author jin
 *
 */
public class AliOssService extends BaseService {
	//用户新建

	OSSClient ossClient = null;
	String defaultBucketName = null;
	//String endpoint = null;//上传地址
	String url = null;//访问地址
	public AliOssService(){
		//AliOssService, String secretKey
//		auth=Auth.create("gkmv2ZdnnWbmKHTh0HUugMp9M_n4USkqz3_KY2xf", "Ago_-Qfc9ISI5hE04IXeSIG6amOAOkz5zA1nr6ch");
		
		
		this.defaultBucketName = xx.getConfig("alioss_bucket_name");
		String endpoint = "http://"+ xx.getConfig("alioss_endpoint");
		url = "http://"+defaultBucketName+"."+ xx.getConfig("alioss_url");
		
		
		ossClient = AliOSSUtil.getOSSClient(endpoint, xx.getConfig("alioss_access_key"), xx.getConfig("alioss_secret_key"));
	}
	
	/**
	 * 尽量上传至阿里云（入库即使失败可以后台服务继续处理）
	 * @param status
	 */
	public void upload(UploadQiniuController.FileStatus status){
		String key = StringUtils.getUUID32();//目前调整为直接用uuid吧，因为文件名其他地方另存了
		
		if(status.getSrcName().indexOf(".") != -1){
//			key = status.getSrcName().substring(0,status.getSrcName().lastIndexOf(".")-1) +"_"+ System.currentTimeMillis() //是不是可以搞短点，以及检测文件名是否非法（非法字符）
//					+status.getSrcName().substring(status.getSrcName().lastIndexOf("."));
			key += status.getSrcName().substring(status.getSrcName().lastIndexOf("."));
		}
		key= status.getFileName();
//		else
//			key = status.getSrcName() +"_"+ System.currentTimeMillis();
		//进一步处理，上传至7牛云，并重新组织（入库并可以后期补救）
		String thislocalFileSrc = status.getBaseDir()+status.getFileName();
		//
		boolean result = uploadFile(ossClient,defaultBucketName,key, thislocalFileSrc);
		//数据保存业务暂时未实现，
		//Db.use(xx.DS_EOVA).save(tableName, record);
		if(result){ //如果配置了 云服务器文件上传  并且上传成功 会进入到此方法
//			status.setFileName(key);
			status.setFileName(url+"/"+key);
			status.setDomain(url);
			status.setTransStatus(true);
			
			//文件上传到云服务  数据库字段也是记录的云服务路径  所以 本地文件没有用了  删除
			FileUtil.delete(thislocalFileSrc);
			LogKit.info("图片回收");
		}else{//失败则直接使用本地，返回
			
		}
	}
	
	
	private boolean uploadFile(OSSClient client, String bucketName, String key, String filePath) {
		if(key.indexOf("/") == 0) {
			key = key.substring(1);
		}
        int MAX_TRY = 3;
        int downloadTurn = 0;
        boolean uploadSuccess = false;
        while (downloadTurn < MAX_TRY) {
            try {
                File file = new File(filePath);
                if ((!file.exists()) || file.length() == 0) {
                    uploadSuccess = false;
                    break;
                }
                LogKit.info(filePath + "上传开始!");
                ObjectMetadata objectMeta = new ObjectMetadata();
                objectMeta.setContentLength(file.length());
                if (!client.doesObjectExist(bucketName, key)) {
                    InputStream input = new FileInputStream(file);
                    client.putObject(bucketName, key, input, objectMeta);
                    LogKit.info(filePath + "上传成功!");
                    uploadSuccess = true;
                    break;
                } else {
                    uploadSuccess = true;
                    break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            downloadTurn++;
        }
        return uploadSuccess;
    }
	
	
	
}
