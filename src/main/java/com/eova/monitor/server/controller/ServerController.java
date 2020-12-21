package com.eova.monitor.server.controller;

import com.eova.monitor.server.domain.Server;
import com.jfinal.core.Controller;

/**
 * 服务器监控
 * 
 * @author ruoyi
 */
public class ServerController extends Controller
{

    public void info() throws Exception
    {
        Server server = new Server();
        server.copyTo();
        setAttr("server", server);

		render("/eova/monitor/server.html");  
    }
}
