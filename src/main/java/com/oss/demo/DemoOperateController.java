package com.oss.demo;

import com.jfinal.core.Controller;

/**
* @Description:操作demo
* @author 作者:Administrator
* @createDate 创建时间：2020年1月19日 下午9:40:05
* @version 1.0     
*/
public class DemoOperateController extends Controller {
	
	public void table() {
        this.render("/ui_h/demo/operate/table.html");
    }
	
	public void other() {
        this.render("/ui_h/demo/operate/other.html");
    }
}
