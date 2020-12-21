package com.oss.demo;

import com.jfinal.core.Controller;

/**
* @Description:icon图标相关
* @author 作者:Administrator
* @createDate 创建时间：2020年1月19日 下午9:40:27
* @version 1.0     
*/
public class DemoIconController extends Controller {
	
	public void fontawesome() {
        this.render("/ui_h/demo/icon/fontawesome.html");
    }
	public void glyphicons() {
        this.render("/ui_h/demo/icon/glyphicons.html");
    }
}
