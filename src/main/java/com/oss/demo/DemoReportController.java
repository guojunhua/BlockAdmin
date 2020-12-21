package com.oss.demo;

import com.jfinal.core.Controller;

/**
* @Description:报表相关
* @author 作者:Administrator
* @createDate 创建时间：2020年1月19日 下午9:41:01
* @version 1.0     
*/
public class DemoReportController extends Controller {
	
	public void echarts() {
        this.render("/ui_h/demo/report/echarts.html");
    }
	public void peity() {
        this.render("/ui_h/demo/report/peity.html");
    }
	public void sparkline() {
        this.render("/ui_h/demo/report/sparkline.html");
    }
	public void metrics() {
        this.render("/ui_h/demo/report/metrics.html");
    }
	
}
