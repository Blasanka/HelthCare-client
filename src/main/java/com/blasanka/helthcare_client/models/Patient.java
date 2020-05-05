package com.blasanka.helthcare_client.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Patient extends Person {

	private long patientId;
	private String disease;
	private long hospitalId;
	
	public Patient() {
		super();
	}

	public Patient(long patientId, String name, int age, String gender, String address,  String disease, long hospitalId, long userId) {
		super(name, gender, address, age, userId);
		this.patientId = patientId;
		this.disease = disease;
		this.hospitalId = hospitalId;
	}

	public long getPatientId() {
		return patientId;
	}

	public void setPatientId(long patientId) {
		this.patientId = patientId;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public long getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(long hospitalId) {
		this.hospitalId = hospitalId;
	}

}
