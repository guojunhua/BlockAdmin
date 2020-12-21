package com.oss.demo;

import com.jfinal.core.Controller;

/**
* @Description:弹框
* @author 作者:Administrator
* @createDate 创建时间：2020年1月19日 下午9:39:18
* @version 1.0     
*/
public class DemoModalController extends Controller {
	public void dialog() {
        this.render("/ui_h/demo/modal/dialog.html");
    }
	public void layer() {
        this.render("/ui_h/demo/modal/layer.html");
    }
	public void table() {
        this.render("/ui_h/demo/modal/table.html");
    }
}
