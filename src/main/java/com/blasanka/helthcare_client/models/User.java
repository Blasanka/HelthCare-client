package com.blasanka.helthcare_client.models;

import java.sql.Date;

public class User {

	private Long userId;
	private String email;
	private String username;
	private String password;
	private long roleId;
	private Date createdAt;
	
	public User() {
	}
	
	public User(Long userId, String email, String username, String password, long roleId, Date createdAt) {
		super();
		this.userId = userId;
		this.email = email;
		this.username = username;
		this.password = password;
		this.roleId = roleId;
		this.createdAt = createdAt;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

}
