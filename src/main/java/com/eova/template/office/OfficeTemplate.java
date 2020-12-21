package com.eova.template.office;


import com.eova.model.Button;
import com.eova.template.Template;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.common.util.TemplateUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @Description:TODO
* @author 作者:Administrator
* @createDate 创建时间：2020年4月16日 下午1:10:51
* @version 1.0     
*/

public class OfficeTemplate
  implements Template
{
  public String name()
  {
    return "Office";
  }
  
  public String code()
  {
    return TemplateConfig.OFFICE;
  }
  
  public Map<Integer, List<Button>> getBtnMap()
  {
    Map<Integer, List<Button>> btnMap = new HashMap();
    

    List<Button> btns = new ArrayList();
    btns.add(TemplateUtil.getQueryButton());
    btnMap.put(Integer.valueOf(0), btns);
    btns.add(new Button("下载文件", "/eova/template/office/btn/download.html", false));
	btns.add(new Button("在线打印", "/eova/template/office/btn/print.html", false));
	

	
    return btnMap;
  }
}
