package com.tera.sys.model;

import java.io.Serializable;

/**
 * 
 * <br>
 * <b>功能：</b>UserDao<br>
 * <b>作者：</b>CodeGenerater<br>
 * <b>日期：</b>2014-05-23 10:47:00<br>
 * <b>版权所有：<b>天瑞兴隆<br>
 */
public class User  implements Serializable{
	
	
	//add bywangyongliang 20150623
	private int roleId;//角色id
	private String orgId;//机构id
	
	private String roleLevel; // 所属层次
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getRoleLevel() {
		return roleLevel;
	}
	public void setRoleLevel(String roleLevel) {
		this.roleLevel = roleLevel;
	}
}
