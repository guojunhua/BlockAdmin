package com.oss.demo;

import com.jfinal.core.Controller;

/**
* @Description:列表
* @author 作者:Administrator
* @createDate 创建时间：2020年1月19日 下午9:39:04
* @version 1.0     
*/
public class DemoTableController extends Controller {
	
	public void search() {
        this.render("/ui_h/demo/table/search.html");
    }
	public void footer() {
        this.render("/ui_h/demo/table/footer.html");
    }
	public void groupHeader() {
        this.render("/ui_h/demo/table/groupHeader.html");
    }
	public void export() {
        this.render("/ui_h/demo/table/export.html");
    }
	public void remember() {
        this.render("/ui_h/demo/table/remember.html");
    }
	public void pageGo() {
        this.render("/ui_h/demo/table/pageGo.html");
    }
	public void params() {
        this.render("/ui_h/demo/table/params.html");
    }
	public void multi() {
        this.render("/ui_h/demo/table/multi.html");
    }
	public void button() {
        this.render("/ui_h/demo/table/button.html");
    }
	public void fixedColumns() {
        this.render("/ui_h/demo/table/fixedColumns.html");
    }
	public void event() {
        this.render("/ui_h/demo/table/event.html");
    }
	public void detail() {
        this.render("/ui_h/demo/table/detail.html");
    }
	public void child() {
        this.render("/ui_h/demo/table/child.html");
    }
	public void image() {
        this.render("/ui_h/demo/table/image.html");
    }
	public void curd() {
        this.render("/ui_h/demo/table/curd.html");
    }
	public void reorder() {
        this.render("/ui_h/demo/table/reorder.html");
    }
	public void editable() {
        this.render("/ui_h/demo/table/editable.html");
    }
	public void other() {
        this.render("/ui_h/demo/table/other.html");
    }
	
	
}
