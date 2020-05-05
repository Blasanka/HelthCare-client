package com.blasanka.helthcare_client.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Hospital {

	private long hospitalId;
	private String name;
	private String address;
	private String type;
	private String location;
	
	public Hospital() {
	}

	public Hospital(long hospitalId, String name, String address, String type, String location) {
		super();
		this.hospitalId = hospitalId;
		this.name = name;
		this.address = address;
		this.type = type;
		this.location = location;
	}

	public long getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(long hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int compareTo(Hospital hospital) {
	  return Long.compare(hospitalId, hospital.getHospitalId());
	}

}
