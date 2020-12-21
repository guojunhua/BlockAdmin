https://www.bilibili.com/video/av412959709# 积木(building block 简称BB)


#### 项目介绍
像积木一样搭建运营管理平台。
积木采用的是引擎模式 支持单表、一对多表、视图等。
设计分为 控件、组件、业务三层，组件由控件组装成，业务由组件构成，每层均可自由定制。理论上每种控件，每种组件，后续直接复用。
（结尾附软件操作视频）

### 环境准备
- 软件环境
1. jdk8
2. maven3.5（推荐），仓库选用阿里云仓库，参考https://blog.csdn.net/flower_CSDN/article/details/79946008
3. eclipse 或者其他自己熟悉的IDE（含git客户端）
4. mysql5.7以及以上版本
5. mysql客户端，如：SQLyog 等自己熟悉的工具

### 项目运行
- __eclipse运行项目__
1. git同步项目至eclipse(普通项目)，记得选择“dev_h+”分支，此为最新版本
2. 项目右键 Configure 选则 convert to maven（前提是eclipse已经配置好maven）
3. 设置Java build path 为 main 以及 test下的各个文件夹（**尤其提醒下需要main下override文件夹**）
4. 右键运行：com.RunEovaOSS
没有大问题应该是启动失败，/resources/dev/jdbc.config 配置是本地mysql
想运行起项目有2个方案：1、执行下面的 数据库重建，2、/resources/default/jdbc.config中的配置copy至/resources/dev/jdbc.config (default下是演示环境的数据库)
5. 启动成功访问：http://127.0.0.1:801 
6. 记得配置下dev/domain.config下得redis信息，否则访问将失败，要么屏蔽要么修改至正确得Redis信息（修改自20200418）

- __IDEA运行项目__
1.  项目运行
1.  File->new->Project from Version Control ,输入项目git  url地址，点击Clone拉取项目(记得选择“dev_h+”分支，此为最新版本)
2.  File->Project Structure,设置jdk版本
3.  View->Tool Windows->Maven,运行maven install
4.  如果出错，重新加载下jar包，项目右键Maven->Reimport
5.  新建jetty启动类,Edit Configurations->+->Application
   main class:com.RunEovaOSS
   use classpath of module:选择自己的项目
   jre:jdk1.8
保存后，运行
6.  访问地址：http://127.0.0.1:801/
7.  记得配置下dev/domain.config下得redis信息，否则访问将失败，要么屏蔽要么修改至正确得Redis信息（修改自20200418）

### 数据库重建
- mysql(目前经过测试)
1. 创建数据库：bb_h 和 bb_h_demo ,编码：uft8mb4
2. 使用工具分别导入 /mysql/下最新文件夹的sql脚本，切记bb_h.sql导入bb_h数据库，bb_h_demo.sql导入bb_h_demo数据库
3. 修改项目中:/resources/dev/jdbc.config 中2个db连接新至正确，可再尝试右键运行。


#### 详细操作说明
https://www.showdoc.cc/771180572609582?page_id=4279235753210245


#### 开发群
积木交流群：818129789



#### 急速开发效果如下
![列表视图](http://h.bblocks.cn/ui/images/template/single_grid.png)
![树表](http://h.bblocks.cn/ui/images/template/tree_grid.png)
![树](http://h.bblocks.cn/ui/images/template/single_tree.png)
![Office](http://h.bblocks.cn/ui/images/template/office.png)
![表单1](http://resh.bblocks.cn/doc/form/form_easy.png)
![表单2](http://resh.bblocks.cn/doc/form/form2.png)

以上的视图基本不需要开发，除了需要补充一些业务代码。
其他视图模式陆续新增中~~

以上功能只要做以下几种配置即可完成~_~
![设计表](http://resh.bblocks.cn/demo/img/table.png)
![导入元数据](http://resh.bblocks.cn/demo/img/import.png)
![编辑元素](http://resh.bblocks.cn/demo/img/detail.png)
![添加菜单](http://resh.bblocks.cn/demo/img/new_menu.png)
打完收工，F5刷新查看配置结果。
滚动说明图：<br>
http://h.bblocks.cn/ui_h/use_banner.htm


演示视频：<br>
https://www.bilibili.com/video/av412959709


#### 缺失功能
1. 控件和视图是一直需要补充的
2. 部分ui效果待完善
3. 移动端适配待完善



