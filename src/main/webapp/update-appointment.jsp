<%@page import="java.util.ArrayList"%>
<%@page import="com.blasanka.helthcare_client.models.Appointment"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Health care Management System</title>
	<link rel="stylesheet" href="styles/bootstrap.min.css" />
	<link rel="stylesheet" href="styles/font-awesome/css/font-awesome.min.csss">
	<style type="text/css">
		.fa {
		  color: black;
		}
	</style>
</head>
<body>
    <div class='container'>
    	<div class='row col-12 mt-2 mb-4 mr-ms-4'>
    		<h2 class='mr-4'>Update this Appointments</h2>
    		<a href="/helthcare_client/" class="btn btn-default"><i class="fa fa-arrow-left" aria-hidden="true"></i> Go Back</a>
    	</div>
    	<div class='row'>
	    	<form>
				<div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				</div>
				<div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword1">
				</div>
				<div class="form-group form-check">
			    	<input type="checkbox" class="form-check-input" id="exampleCheck1">
			    <label class="form-check-label" for="exampleCheck1">Check me out</label>
				</div>
				<select class="form-control">
				  	<option>Default select</option>
				</select>
				<div class="form-group form-check">
			    	<input type="date" class="form-control" id="exampleCheck1">
			    <label class="form-check-label" for="exampleCheck1">Check me out</label>
				</div>
			  	<button type="submit" class="btn btn-primary">Update</button>
			</form>
		</div>
	</div>
</body>
</html>
