package com.eova.common.install;


import com.eova.common.utils.xx;
import com.eova.common.utils.db.JdbcUtil;
import com.eova.service.InstallService;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;

import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

@Slf4j
public class InstallUtil {


    public static boolean createBBJdbcPropertiesFile(InstallService main,InstallService bb) {
    	File propertieFile = new File(PathKit.getRootClassPath(), "jdbc.config");

        Properties p = propertieFile.exists()
                ? PropKit.use("jdbc.config").getProperties()
                : new Properties();

        
        p.put("main_url", main.getDbExecuter().getJdbcUrl());
        p.put("main_user", main.getDbExecuter().getDbUser());
        p.put("main_pwd", xx.isEmpty(main.getDbExecuter().getDbPassword())?"":main.getDbExecuter().getDbPassword() );
        
        p.put("eova_url", bb.getDbExecuter().getJdbcUrl());
        p.put("eova_user", bb.getDbExecuter().getDbUser());
        p.put("eova_pwd", xx.isEmpty(bb.getDbExecuter().getDbPassword())?"":bb.getDbExecuter().getDbPassword() );
        	
        return savePropertie(p, propertieFile);
    }

    private static boolean putPropertie(Properties p, String key, String value) {
        Object v = p.get(key);
        if (v == null) {
            p.put(key, value);
            return true;
        }

        return false;
    }


    private static boolean savePropertie(Properties p, File pFile) {
        try (FileOutputStream fos  = new FileOutputStream(pFile) ){
            p.store(fos, "Auto create by BB");
        } catch (Exception e) {
            log.warn(e.toString(), e);
            return false;
        }
        return true;
    }
}
