/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

/**
 * 元字段配置
 * 
 * @author Jieven
 *
 */
public class MetaFieldConfig {
	
	// 文件保存路径
	private String filedir;
	//查找框 显示字段
	private String showField;
	//查找框 pk字段
	private String pk;
	//虚拟字段关联字段
	private String relationEn ;
	//查找框2 去查找路径
	private String findUrl;
	//查找框2 查找路径
	private String queryUrl;
	
	/*
	 * 文件控制属性
	 */
	private String fileTypes;//文件类型，逗号分隔
	private Integer maxLength;//文件最大长度 KB
	private Integer fileNum;//文件数量
	
	
	/**
	 * @return the pk
	 */
	public String getPk() {
		return pk;
	}

	/**
	 * @param pk the pk to set
	 */
	public void setPk(String pk) {
		this.pk = pk;
	}


	/**
	 * @return the showField
	 */
	public String getShowField() {
		return showField;
	}

	/**
	 * @param showField the showField to set
	 */
	public void setShowField(String showField) {
		this.showField = showField;
	}

	public String getFiledir() {
		return filedir;
	}

	public void setFiledir(String filedir) {
		this.filedir = filedir;
	}

	/**
	 * @return the findUrl
	 */
	public String getFindUrl() {
		return findUrl;
	}

	/**
	 * @param findUrl the findUrl to set
	 */
	public void setFindUrl(String findUrl) {
		this.findUrl = findUrl;
	}

	/**
	 * @return the queryUrl
	 */
	public String getQueryUrl() {
		return queryUrl;
	}

	/**
	 * @param queryUrl the queryUrl to set
	 */
	public void setQueryUrl(String queryUrl) {
		this.queryUrl = queryUrl;
	}

	/**
	 * @return the fileTypes
	 */
	public String getFileTypes() {
		return fileTypes;
	}

	/**
	 * @param fileTypes the fileTypes to set
	 */
	public void setFileTypes(String fileTypes) {
		this.fileTypes = fileTypes;
	}

	/**
	 * @return the maxLength
	 */
	public Integer getMaxLength() {
		return maxLength;
	}

	/**
	 * @param maxLength the maxLength to set
	 */
	public void setMaxLength(Integer maxLength) {
		this.maxLength = maxLength;
	}

	/**
	 * @return the fileNum
	 */
	public Integer getFileNum() {
		return fileNum;
	}

	/**
	 * @param fileNum the fileNum to set
	 */
	public void setFileNum(Integer fileNum) {
		this.fileNum = fileNum;
	}

	/**
	 * @return the relationEn
	 */
	public String getRelationEn() {
		return relationEn;
	}

	/**
	 * @param relationEn the relationEn to set
	 */
	public void setRelationEn(String relationEn) {
		this.relationEn = relationEn;
	}
	
}
