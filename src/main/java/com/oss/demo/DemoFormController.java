package com.oss.demo;

import com.eova.common.utils.xx;
import com.jfinal.core.Controller;

/**
* @Description:demo/form/** 表单
* @author 作者:Administrator
* @createDate 创建时间：2020年1月19日 下午9:19:17
* @version 1.0     
*/
public class DemoFormController extends Controller {
	
	public void button() {
        this.render("/ui_h/demo/form/button.html");
    }
	
	public void grid() {
        this.render("/ui_h/demo/form/grid.html");
    }
	public void select() {
        this.render("/ui_h/demo/form/select.html");
    }
	public void timeline() {
        this.render("/ui_h/demo/form/timeline.html");
    }
	public void basic() {
        this.render("/ui_h/demo/form/basic.html");
    }
	public void cards() {
        this.render("/ui_h/demo/form/cards.html");
    }
	public void jasny() {
        this.render("/ui_h/demo/form/jasny.html");
    }
	public void sortable() {
        this.render("/ui_h/demo/form/sortable.html");
    }
	public void tabs_panels() {
        this.render("/ui_h/demo/form/tabs_panels.html");
    }
	public void validate() {
        this.render("/ui_h/demo/form/validate.html");
    }
	public void wizard() {
        this.render("/ui_h/demo/form/wizard.html");
    }
	public void upload() {
        this.render("/ui_h/demo/form/upload.html");
    }
	public void datetime() {
        this.render("/ui_h/demo/form/datetime.html");
    }
	public void summernote() {
        this.render("/ui_h/demo/form/summernote.html");
    }
	public void duallistbox() {
        this.render("/ui_h/demo/form/duallistbox.html");
    }
	public void autocomplete() {
        this.render("/ui_h/demo/form/autocomplete.html");
    }
	public void layoutit() {
        this.render("/ui_h/demo/form/layoutit/index.html");
    }
}



