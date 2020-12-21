package com.eova.oa.config;

/**
 * 项目中的常量定义类
 */
public class Constant {
    /**
     * 企业corpid, 需要修改成开发者所在企业
     */
    public static final String CORP_ID = "dinge9d959624f41152bbc961a6cb783455b";
    /**
     * 应用的AppKey，登录开发者后台，点击应用管理，进入应用详情可见
     */
    public static final String APPKEY = "dinghevmsqhtf0n8zngl";
    /**
     * 应用的AppSecret，登录开发者后台，点击应用管理，进入应用详情可见 （SuiteSecret）
     */
    public static final String APPSECRET = "JRIOAPNaipp99JglZUkoTg_KwvoYn5JGM9CxA_TmbKJ8X4aA4kc5IF9c3v43piPl";

    /**
     * 数据加密密钥。用于回调数据的加密，长度固定为43个字符，从a-z, A-Z, 0-9共62个字符中选取,您可以随机生成
     */
    public static final String ENCODING_AES_KEY = "BbBbBbBbBb0ea3914b090db11eabb370242ac130002";//

 
    
    /**
     * 加解密需要用到的token，企业可以随机填写。如 "12345"
     */
    public static final String TOKEN = "bb_first";

    /**
     * 应用的agentdId，登录开发者后台可查看
     */
    public static final Long AGENTID = 111L;

    /**
     * 审批模板唯一标识，可以在审批管理后台找到
     */
    public static final String PROCESS_CODE = "PROC-0BC478AF-63D5-4B50-ABA7-9A6CBDEEB1FA";//通知的审批

    /**
     * 回调host
     */
    public static final String CALLBACK_URL_HOST = "***";
}
