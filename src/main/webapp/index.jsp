<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blasanka.helthcare_client.models.Appointment"%>
<%@page import="com.blasanka.helthcare_client.models.User"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Health care Management System</title>
	<link rel="stylesheet" href="assets/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
	<style type="text/css">
		.warn {
			color: red;
		}
	</style>
</head>
<body>
    <div class='container'>
    	<div class='row col-12 mt-2 mb-4 mr-ms-4'>
		    <% User user = (User) request.getSession().getAttribute("currentUser"); %>
    		<h4 class='mr-4' id="username">Appointments of <%= user.getUsername() %></h4>
    		<a href='/helthcare_client/appointment/add' class="btn btn-success">Make an appointment</a>
    	</div>
    	<div class='row'>
    	<%   
		ArrayList<Appointment> list = (ArrayList<Appointment>) request.getAttribute("appointments");
		
	    if (list != null) {
			for(int i = 0; i < list.size(); i++) {
				Appointment appoint = list.get(i);
				
				SimpleDateFormat df2 = new SimpleDateFormat("dd/MM/yy hh:mm a");
		        String dateText = df2.format(appoint.getTime().getTime());
				
				out.print("<div class='col-md-6 col-sm-12 col-lg-4'>");
				out.print("<div class='card mb-2 mr-sm-2' style='width: 18rem;'><div class='card-body'>");
				out.print("<h5 class='card-title' id='appointId'>Appointment Number is: " + appoint.getAppointId() + " </h5>");
				out.print("<h6 class='card-subtitle mb-2'><span class='text-muted'>time is:  </span>" + dateText + " </h6>");
				out.print("<p class='card-subtitle'><span class='text-muted'>Doctor name: </span>"+ appoint.getDoctor().getName() +"</p>");
				out.print("<p class='card-text'><span class='text-muted'>Hospital name:  </span>"+ appoint.getHospital().getName() +"</p>");
				out.print("<a href='/helthcare_client/appointment/change' class='card-link'>Change <i class='fa fa-pencil' aria-hidden='true'></i></a>");
				out.print("<a href='' onClick='setId("+appoint.getAppointId()+")' id='warn' class='card-link warn' data-toggle='modal' data-target='#warningModal'>Cancel <i class='fa fa-ban' aria-hidden='true'></i></a>");
				out.print("</div></div></div>");
			}
	    } else {
		    out.println("<center>No appointments found!</center>");
	    }
		%>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="warningModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Are you sure you want to delete?</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        This action cannot be undone
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
	        <form action="${pageContext.request.contextPath}/appointment/cancel" method="post">
			    <input type="hidden" name="deleteId" id="deleteId" />
			    <input class="btn btn-danger" type="submit" value="Yes" />
			</form>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="assets/jquery-min.js"></script>
	<script type="text/javascript" src="assets/bootstrap.js"></script>
	<script>
		function setId(id) {
			document.getElementById('deleteId').value = id;
		}
	</script>
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
<script>
/* window.addEventListener('load', function () {
	console.log(document.getElementById('username').value);
	$(document).on("click", ".card", function () {
	     var myBookId = $(this).data('username');
	 	console.log(document.getElementById('appointId').value);
	     $("#deleteId").val( myBookId );
		  alert('You selected: ', document.getElementById('deleteId').value);
	});
	 window.addEventListener('load', function () {
		document.getElementById('warn').addEventListener('click', function() {
			  alert('You selected: ', document.getElementById('warn').text);
		});
	}); */
</script>
</html>
