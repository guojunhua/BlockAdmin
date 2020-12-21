package com.eova.common.utils.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
* @Description:TODO
* @author 作者:jin
* @createDate 创建时间：2020年4月18日 下午3:45:09
* @version 1.0     
*/
public class JacksonUtil {
	private static ObjectMapper mapper = new ObjectMapper();

    public static String bean2Json(Object obj) {
        try {
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static <T> T json2Bean(String jsonStr, Class<T> objClass) {
        try {
            return mapper.readValue(jsonStr, objClass);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
