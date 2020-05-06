<%@page import="jakarta.ws.rs.core.Response"%>
<%@page import="java.util.Date"%>
<%@page import="jakarta.ws.rs.client.WebTarget"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.ws.rs.core.GenericType"%>
<%@page import="jakarta.ws.rs.core.MultivaluedMap"%>
<%@page import="jakarta.ws.rs.core.MultivaluedHashMap"%>
<%@page import="jakarta.ws.rs.client.ClientBuilder"%>
<%@page import="jakarta.ws.rs.client.Client"%>
<%@page import="com.blasanka.helthcare_client.models.Patient"%>
<%@page import="com.blasanka.helthcare_client.models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blasanka.helthcare_client.models.Appointment"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Health care Management System</title>
	<link rel="stylesheet" href="../assets/bootstrap.min.css" />
	<link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.csss">
	<style type="text/css">
		.fa {
		  color: black;
		}
	</style>
</head>
<body>
    <div class='container'>
    	<div class="col-12 mt-2 mb-4 mr-ms-4">
    		<div class="row"><h2 class='mr-4'>Update an Appointments</h2></div>
    		<div class="row">
			    <% 
			    	User user = (User) request.getSession().getAttribute("currentUser");
		    		Patient patient = (Patient) request.getSession().getAttribute("currentPatient");
		    		
		    		Client client = ClientBuilder.newClient();
		    		
		    		MultivaluedMap<String, Object> headers = new MultivaluedHashMap<>();
		    		headers.add("username", "BLA");
		    		headers.add("Content-Type", "application/json");

		    		String url = "http://localhost:8084/helthcare/appointments/"+request.getParameter("id");
		    		
		    	    WebTarget target = client.target(url.replaceAll(" ", ""));
		    	    Response res = target.request().headers(headers).get(Response.class);

		    	    Appointment appointment = new Appointment();
		    	    
		    	    java.sql.Date date = null;
		    	    java.sql.Date time = null;
		    		
		    	    if (res.getStatus() == 200) {
		    			appointment = res.readEntity(Appointment.class);
		    			if (appointment != null) {
			    			date = appointment.getDate();
			    			time = appointment.getTime();
			    		}
		    		}
			    %>
	    		<a href="/helthcare_client/" class="mt-2 mr-4 card-link"><i class="fa fa-chevron-left" aria-hidden="true"></i> Go Back</a>
			    <p class="mt-2 mr-ms-4">User: <%= user.getUsername() %></p>
    		</div>
    	</div>
    	<div class='row'>
	    	<form id="submitForm" name="submitForm" method="POST" action="${pageContext.request.contextPath}/appointment/edit">
				<div class="form-group" hidden>
					<input type="appointId" class="form-control" id="appointId" name="appointId" aria-describedby="patientIdHelp" value="<%= appointment.getAppointId() %>" hidden>
				    <input type="patientId" class="form-control" id="patientId" name="patientId" aria-describedby="patientIdHelp" value="<%= patient.getPatientId() %>" hidden>
				    <input type="userId" class="form-control" id="userId" name="userId" aria-describedby="userIdHelp" value="<%= user.getUserId() %>" hidden>
				</div>
				<div class="form-group form-check">
				    <label class="form-check-label" for="hospitalId">Doctor Name</label>
					<select class="form-control" id="doctorId" name="doctorId">
					  	<%   
			    		if (appointment.getAppointId() != 0) {
			    			out.print("<option value="+appointment.getDoctor()
								.getDoctorId()+">"+ appointment.getDoctor().getName() +"</option>");
			    		} else {
			    			out.println("<option>No doctors found!</option>");
			    		}
						%>
					</select>
				</div>
				<div class="form-group form-check">
				    <label class="form-check-label" for="hospitalId">Hospital Name</label>
					<select class="form-control" id="hospitalId" name="hospitalId">
					  	<%
					  	if (appointment.getAppointId() != 0) {
							out.print("<option value="+appointment.getHospital()
								.getHospitalId()+">"+ appointment.getHospital().getName() +"</option>");
			    		} else {
			    			out.println("<option>No hospitals found!</option>");
			    		}
						%>
					</select>
				</div>
				<div class="form-group form-check">
			    	<label class="form-check-label" for="exampleCheck1">Select Date</label>
			    	<input type="date" class="form-control" id="date" name="date" value="<%= (date != null) ? date : "" %>" />
				</div>
				<div class="form-group form-check">
			    	<label class="form-check-label" for="exampleCheck1">Select Time</label>
			    	<input type="time" class="form-control" id="time" name="time" value="<%= (time != null) ? date : "" %>" />
				</div>
				<div class="form-group">
			  		<button type="clear" class="btn btn-default">Clear</button>
			  		<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
	<% if (appointment.getAppointId() == 0) { %>
	   	<script>
	   		var myDate = document.getElementById("date");
		  	var today = new Date();
		  	myDate.value = today.toISOString().substr(0, 10);
		  	
	   		var myTime = document.getElementById("time");
		  	myTime.value = newDate(new Date().getTime() + 4*60*60*1000).toLocaleTimeString();
	   	</script>
   	<% } %>
</body>
</html>