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
    		<div class="row"><h2 class='mr-4'>Add an Appointments</h2></div>
    		<div class="row">
			    <% 
			    	User user = (User) request.getSession().getAttribute("currentUser");
		    		Patient patient = (Patient) request.getSession().getAttribute("currentPatient");
		    		
		    		Client client = ClientBuilder.newClient();
		    		
		    		MultivaluedMap<String, Object> headers = new MultivaluedHashMap<>();
		    		headers.add("username", "BLA");
		    		headers.add("Content-Type", "application/json");

		    		GenericType<List<Appointment>> genericType = new GenericType<List<Appointment>>(){};
		    	    WebTarget target = client.target("http://localhost:8084/helthcare/appointments");
		    	    List<Appointment> appointments = target.request().headers(headers).get(genericType);
			    %>
	    		<a href="/helthcare_client/" class="mt-2 mr-4 card-link"><i class="fa fa-chevron-left" aria-hidden="true"></i> Go Back</a>
			    <p class="mt-2 mr-ms-4">User: <%= user.getUsername() %></p>
    		</div>
    	</div>
    	<div class='row'>
	    	<form id="submitForm" name="submitForm" method="POST" action="${pageContext.request.contextPath}/appointment/add/new">
				<div class="form-group" hidden>
				    <input type="patientId" class="form-control" id="patientId" name="patientId" aria-describedby="patientIdHelp" value="<%= patient.getPatientId() %>" hidden>
				    <input type="userId" class="form-control" id="userId" name="userId" aria-describedby="userIdHelp" value="<%= user.getUserId() %>" hidden>
				</div>
				<div class="form-group form-check">
				    <label class="form-check-label" for="hospitalId">Doctor Name</label>
					<select class="form-control" id="doctorId" name="doctorId">
					  	<%   
			    		if (appointments.size() > 0) {
			    			for(Appointment appoint : appointments) {
								out.print("<option value="+appoint.getDoctor()
									.getDoctorId()+">"+ appoint.getDoctor().getName() +"</option>");
							}
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
			    		if (appointments.size() > 0) {
			    			for(Appointment appoint : appointments) {
								out.print("<option value="+appoint.getHospital()
									.getHospitalId()+">"+ appoint.getHospital().getName() +"</option>");
							}
			    		} else {
			    			out.println("<option>No doctors found!</option>");
			    		}
						%>
					</select>
				</div>
				<div class="form-group form-check">
			    	<label class="form-check-label" for="exampleCheck1">Select Date</label>
			    	<input type="date" class="form-control" id="date" name="date" value="01/01/2000" />
				</div>
				<div class="form-group form-check">
			    	<label class="form-check-label" for="exampleCheck1">Select Time</label>
			    	<input type="time" class="form-control" id="time" name="time" value="12:00 AM" />
				</div>
				<div class="form-group">
			  		<button type="clear" class="btn btn-default">Clear</button>
			  		<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
   	<script>
   		var myDate = document.getElementById("date");
	  	var today = new Date();
	  	myDate.value = today.toISOString().substr(0, 10);
	  	
   		var myTime = document.getElementById("time");
	  	myTime.value = new Date(new Date().getTime() + 4*60*60*1000).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
   	</script>
</body>
</html>

<%-- <c:forEach items="${appointments}" var="appointment">
						<option value="${appointment.getDoctor().getDoctorId()}">
							${appointment.getDoctor().getName()}</option>
					</c:forEach> --%>