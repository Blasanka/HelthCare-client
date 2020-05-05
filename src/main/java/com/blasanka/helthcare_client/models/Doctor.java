package com.blasanka.helthcare_client.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Doctor extends Person {

	private long doctorId;
	private String specialization;
	
	public Doctor() {
		super();
	}

	public Doctor(long doctorId, String name, int age, String gender, String address, String specialization, 
			long userId) {
		super(name, gender, address, age, userId);
		this.doctorId = doctorId;
		this.specialization = specialization;
	}

	public long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(long doctorId) {
		this.doctorId = doctorId;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public int compareTo(Doctor doctor) {
		return Long.compare(doctorId, doctor.getDoctorId());
	}
}
