package com.blasanka.helthcare_client.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blasanka.helthcare_client.models.Appointment;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.MultivaluedHashMap;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;

/**
 * Servlet implementation class AppointmentServlet
 */
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Client client = ClientBuilder.newClient();
		
		MultivaluedMap<String, Object> headers = new MultivaluedHashMap<>();
		headers.add("username", "BLA");
		headers.add("Content-Type", "application/json");

		GenericType<List<Appointment>> genericType = new GenericType<List<Appointment>>(){};
	    WebTarget target = client.target("http://localhost:8084/helthcare/appointments");
	    List<Appointment> appointments = target.request().headers(headers).get(genericType);
	    
		if (appointments.size() > 0) {
			HttpSession session = request.getSession();
	        session.setAttribute("currentUser", appointments.get(0).getUser());
	        session.setAttribute("currentPatient", appointments.get(0).getPatient());
			
			for (Appointment app : appointments) {
				response.getWriter().append(app.getAppointId()+"");
			}
			request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
