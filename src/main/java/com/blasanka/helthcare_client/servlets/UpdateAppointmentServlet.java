package com.blasanka.helthcare_client.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blasanka.helthcare_client.models.Appointment;
import com.blasanka.helthcare_client.models.Patient;
import com.blasanka.helthcare_client.models.User;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MultivaluedHashMap;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;

/**
 * Servlet implementation class UpdateAppointmentServlet
 */
public class UpdateAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPut(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * @see HttpServlet#doPut(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String appointmentId = request.getParameter("appointId");
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

    	HttpSession session = request.getSession(false);
    	User user = (User) session.getAttribute("currentUser");
    	Patient patient = (Patient) session.getAttribute("currentPatient");
	    
		Client client = ClientBuilder.newClient();

		MultivaluedMap<String, Object> headers = new MultivaluedHashMap<>();
		headers.add("Content-Type", "application/json");
		headers.add("username", "BLA");
		headers.add("userId", user.getUserId());
		headers.add("patientId", patient.getPatientId());

	    WebTarget target = client.target("http://localhost:8084/helthcare/appointments/" + appointmentId);
	    Response res = target.request().headers(headers).put(Entity.json(appointment));

//	    System.out.println("http://localhost:8084/helthcare/appointments/" + appointmentId);
	    if (res.getStatus() == 204) {
	    	session.setAttribute("success", "Successfully updated!");
	    } else {
	    	session.setAttribute("error", "Could not update appointment!");
	    }
	    
	    response.sendRedirect(String.format("%s%s", request.getContextPath(), "/"));
	}
}
