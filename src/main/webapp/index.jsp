<%@page import="java.util.ArrayList"%>
<%@page import="com.blasanka.helthcare_client.models.Appointment"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Health care Management System</title>
	<link rel="stylesheet" href="bootstrap.min.css" />
	<link rel="stylesheet" href="font-awesome.min.css">
	<style type="text/css">
		.fa {
		  color: black;
		}
	</style>
</head>
<body>
    <h2>Appointments</h2>
    <div class='container'>
    <%   
		ArrayList<Appointment> list = (ArrayList<Appointment>) request.getAttribute("appointments");
		
	    if (list != null) {
			for(Appointment appoint : list) {
				%>	
				<div class="card mb-2 mr-sm-2" style="width: 18rem;">
			    	<div class="card-body">
					    <h5 class="card-title">Appointment Number is: <% appoint.getAppointId(); %></h5>
					    <h6 class="card-subtitle mb-2 text-muted">time is: <% appoint.getDate(); %></h6>
					    <p class="card-text">Doctor name: <% appoint.getDoctor().getName(); %></p>
					    <p class="card-text">Hospital name: <% appoint.getHospital().getName(); %></p>
					    <a href="#" class="card-link">Change <i class="fa fa-pencil" aria-hidden="true"></i></a>
					    <a href="#" class="card-link">Cancel <i class="fa fa-ban" aria-hidden="true"></i></a>
				  	</div>
				</div>
				<%
			}
	    } else {
		    out.println("<center>No appointments found!</center>");
	    }
	%>
	</div>
</body>
</html>
