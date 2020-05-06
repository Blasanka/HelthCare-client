package com.blasanka.helthcare_client.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blasanka.helthcare_client.models.Appointment;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MultivaluedHashMap;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;

/**
 * Servlet implementation class AddAppointmentServlet
 */
public class AddAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Client client = ClientBuilder.newClient();
//		
//		MultivaluedMap<String, Object> headers = new MultivaluedHashMap<>();
//		headers.add("username", "BLA");
//		headers.add("Content-Type", "application/json");
//
//		GenericType<List<Appointment>> genericType = new GenericType<List<Appointment>>(){};
//	    WebTarget target = client.target("http://localhost:8084/helthcare/appointments");
//	    List<Appointment> appointments = target.request().headers(headers).get(genericType);
//	    
//		if (appointments.size() > 0) {
//			request.setAttribute("appointments", appointments);
//            request.getRequestDispatcher("/new-appointment.jsp").forward(request, response);
//		} else {
//			
//		}
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
	    String patientId = request.getParameter("patientId");
	    String doctorId = request.getParameter("doctorId");
	    String hospitalId = request.getParameter("hospitalId");
	    String date = request.getParameter("date");
	    String time = request.getParameter("time");

	    Appointment appointment = new Appointment();
	    
	    try {
	    	String[] splittedDate = date.split("[-/]");
	    	int year = Integer.parseInt(splittedDate[2]);
	    	int month = Integer.parseInt(splittedDate[0]);
	    	int day = Integer.parseInt(splittedDate[1]);

//			System.out.println(date + " " +time);
//		    SimpleDateFormat sdfDate = new SimpleDateFormat("mm/dd/yyyy");
//		    SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm a");
//			String dateFormatted = sdfDate.format(date);
//			String timeFormatted = sdfTime.format(time);
//			System.out.println(dateFormatted + " " +timeFormatted);
//			Date parsedDate = sdfDate.parse(date);
//			Date parsedTime = sdfTime.parse(time);
    	    
			appointment = new Appointment(Long.parseLong(userId), Long.parseLong(patientId), Long.parseLong(doctorId),
		    		Long.parseLong(hospitalId), new java.sql.Date(year, month, day), new java.sql.Date(System.currentTimeMillis()));
		} catch (Exception e) {
			System.out.println("parse error probably!");
			e.printStackTrace();
		}
	    
		Client client = ClientBuilder.newClient();

		MultivaluedMap<String, Object> headers = new MultivaluedHashMap<>();
		headers.add("Content-Type", "application/json");

	    WebTarget target = client.target("http://localhost:8084/helthcare/appointments");
	    Response res = target.request().headers(headers).post(Entity.json(appointment));
	    response.getWriter().append(res.getStatus()+"");
	    response.sendRedirect(String.format("%s%s", request.getContextPath(), "/"));
	}

}
