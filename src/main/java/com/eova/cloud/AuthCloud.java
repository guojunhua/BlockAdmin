package com.eova.cloud;

import com.eova.cloud.auth.Base64;
import com.eova.cloud.auth.EovaApp;
import com.eova.cloud.auth.RSAEncrypt;
import com.eova.common.utils.xx;
import com.jfinal.kit.LogKit;

public class AuthCloud {
	public static String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsH+a21jY5whyVZYJmsiIZwWW8efAYJH9nEHRqtJI5qsu5SkZqDOwGBu24ZZA1aRSo/yld1VgTOJK+fgStIcSYf+tnmyZfwhoxjUhQSnL+w60mYAq2sRypCPtHsZsGI4uUmWJhnpuj0CJ/VHEHAyztpHmXWu8abRpIzkK9vv9ivQIDAQAB";

	private static EovaApp app;

	public static boolean isAuthApp(String appId, String appSecret) {
		return getEovaApp().isAuth();
	}

	public static EovaApp getEovaApp() {
		
			if (app != null) {
				return app;
			}

			String appId = xx.getConfig("app_id");
			String appSecret = xx.getConfig("app_secret");
//
//			byte[] res = RSAEncrypt.decrypt(RSAEncrypt.loadPublicKeyByStr(publicKey), Base64.decode(appSecret));
//			String s = new String(res);
//			String[] ss = s.split(",");

			app = new EovaApp();
			app.setId(appId);
			app.setSecret(appSecret);
			app.setDomain(xx.getConfig("app_domain"));
			app.setLogo(xx.getConfig("app_logo"));
//			app.setName(ss[1]);
//			app.setCopyright(ss[2]);
//			if (appId.equalsIgnoreCase(ss[0])) {
//				app.setAuth(true);
//			}
			
			app.setName(xx.getConfig("app_name"));
			app.setCopyright(xx.getConfig("app_copyright"));
			
				app.setAuth(true);
			
			app.setKeywords(xx.getConfig("app_keywords",xx.getConfig("app_name")));
			app.setDescription(xx.getConfig("app_description",xx.getConfig("app_name")));
			
			return app;
		
	}

}