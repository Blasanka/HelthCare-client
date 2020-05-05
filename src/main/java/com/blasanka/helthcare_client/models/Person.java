package com.blasanka.helthcare_client.models;

public class Person {

	private String name;
	private String gender;
	private String address;
	private int age;
	private long userId;
	
	public Person() {
	}

	public Person(String name, String gender, String address, int age, long userId) {
		super();
		this.name = name;
		this.gender = gender;
		this.address = address;
		this.age = age;
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public long getUser_id() {
		return userId;
	}

	public void setUser_id(long userId) {
		this.userId = userId;
	}
		
}
