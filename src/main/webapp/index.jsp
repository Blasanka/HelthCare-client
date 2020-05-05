<%@page import="java.util.ArrayList"%>
<%@page import="com.blasanka.helthcare_client.models.Appointment"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Health care Management System</title>
	<link rel="stylesheet" href="styles/bootstrap.min.css" />
	<link rel="stylesheet" href="styles/font-awesome/css/font-awesome.min.css">
	<style type="text/css">
	
	</style>
</head>
<body>
    <div class='container'>
    	<div class='row col-12 mt-2 mb-4 mr-ms-4'>
    		<h2 class='mr-4'>Appointments</h2>
    		<a href="new-appointment.jsp" class="btn btn-success">Make an appointment</a>
    	</div>
    	<div class='row'>
    	<%   
		ArrayList<Appointment> list = (ArrayList<Appointment>) request.getAttribute("appointments");
		
	    if (list != null) {
			for(int i = 0; i < list.size(); i++) {
				Appointment appoint = list.get(i);
				
				out.print("<div class='col-md-6 col-sm-12 col-lg-4'>");
				out.print("<div class='card mb-2 mr-sm-2' style='width: 18rem;'><div class='card-body'>");
				out.print("<h5 class='card-title'>Appointment Number is: " + appoint.getAppointId() + " </h5>");
				out.print("<h6 class='card-subtitle mb-2'><span class='text-muted'>time is:  </span>" + appoint.getDate() + " </h6>");
				out.print("<p class='card-subtitle'><span class='text-muted'>Doctor name: </span>"+ appoint.getDoctor().getName() +"</p>");
				out.print("<p class='card-text'><span class='text-muted'>Hospital name:  </span>"+ appoint.getHospital().getName() +"</p>");
				out.print("<a href='/helthcare_client/update-appointment.jsp' class='card-link'>Change <i class='fa fa-pencil' aria-hidden='true'></i></a>");
				out.print("<a href='/helthcare_client/' class='card-link'>Cancel <i class='fa fa-ban' aria-hidden='true'></i></a>");
				out.print("</div></div></div>");
			}
	    } else {
		    out.println("<center>No appointments found!</center>");
	    }
		%>
		</div>
	</div>
</body>

<%-- <div class="card mb-2 mr-sm-2" style="width: 18rem;">

	if ((i+1) % 2 == 0) out.print("<div class='w-100'></div>");
	
   	<div class="card-body">
	    <h5 class="card-title">Appointment Number is: <% appoint.getAppointId(); %></h5>
	    <h6 class="card-subtitle mb-2 text-muted">time is: <% appoint.getDate(); %></h6>
	    <p class="card-text">Doctor name: <% appoint.getDoctor().getName(); %></p>
	    <p class="card-text">Hospital name: <% appoint.getHospital().getName(); %></p>
	    <a href="#" class="card-link">Change <i class="fab fa-pencil" aria-hidden="true"></i></a>
	    <a href="#" class="card-link">Cancel <i class="fab fa-ban" aria-hidden="true"></i></a>
  	</div>
</div> --%>
</html>
