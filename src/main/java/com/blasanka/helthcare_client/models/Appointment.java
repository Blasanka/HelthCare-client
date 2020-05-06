package com.blasanka.helthcare_client.models;

import java.sql.Date;

import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Appointment {

	private long appointId;
	private long userId;
	private long patientId;
	private long doctorId;
	private long hospitalId;
	private Date date;
	private Date time;
	private Date createdAt;
	private Doctor doctor;
	private Patient patient;
	private Hospital hospital;
	private User user;

	public Appointment() {
		super();
	}
	
	public Appointment(long appointId, long userId, long patientId, long doctorId, long hospitalId, Date date,
			Date time, Date createdAt) {
		super();
		this.appointId = appointId;
		this.userId = userId;
		this.patientId = patientId;
		this.doctorId = doctorId;
		this.hospitalId = hospitalId;
		this.date = date;
		this.time = time;
		this.createdAt = createdAt;
	}

	public Appointment(long appointId, Date date,
			Date time, Date createdAt, Doctor doctor, Patient patient, Hospital hospital, User user) {
		super();
		this.appointId = appointId;
		this.date = date;
		this.time = time;
		this.createdAt = createdAt;
		this.doctor = doctor;
		this.patient = patient;
		this.hospital = hospital;
		this.user = user;
	}
	
	public Appointment(long userId, long patientId, long doctorId, long hospitalId, Date date,
			Date time) {
		super();
		this.userId = userId;
		this.patientId = patientId;
		this.doctorId = doctorId;
		this.hospitalId = hospitalId;
		this.date = date;
		this.time = time;
	}

	public long getAppointId() {
		return appointId;
	}

	public void setAppointId(long appointId) {
		this.appointId = appointId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	public long getPatientId() {
		return patientId;
	}

	public void setPatientId(long patientId) {
		this.patientId = patientId;
	}
	
	public long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(long doctorId) {
		this.doctorId = doctorId;
	}
	
	public long getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(long hospitalId) {
		this.hospitalId = hospitalId;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
