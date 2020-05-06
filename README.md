<h2>HelthCare-client</h2>

HelthCare is a Hospital Management System developing for Y3S2 PAF project. This is the client for web services implemented using Jersey 
JAX-RS implementation(repository: https://github.com/Blasanka/HelthCare-api).


•	A clickable link to the repository: https://github.com/Blasanka/helthcare-client

•	My function is Appointment.

•	A war file is added to the repository.

•	Also when providing the API forgot to add SQL backup to the repo and in this repo it is added.

•	And few more details are also included in the repository.

•	I used the build API for this web client using Jersey Client.

•	The API repository is https://github.com/Blasanka/healthcare-api and that repository contains few branches because I have done Appointment and User functions. Also a branch for monolithic integration and tried micro services integration using maven.

•	The master branch only contains Appointment service which is not contain x-authorization implementation but it is there in otherTo  branches.


#### To run this project:

* Up and running MySQL server.
* Up and running helthcare-api(link is mentioned above) on Apache tomcat server(This repo 100% compatible with master branch).

* URL mapping with the hosted server:
	- Read: http://localhost:8084/helthcare_client/
	- Create: http://localhost:8084/helthcare_client/appointment/add
	- Update: http://localhost:8084/helthcare_client/appointment/change?id=+22+
	- Delete: http://localhost:8084/helthcare_client/appointment/cancel
	
<italic>Please kindly notice that sometimes if 500 server error appear when navigating in that case need to go back, refresh and come back
:neutral_face: that because of some problem in url mapping. Did not had much time to fix it.</italic>

#### Read

<img src="https://raw.githubusercontent.com/Blasanka/helthcare-client/master/screenshots/appointment_read_ui.jpg" alt="appointment_read_ui.jpg" />

#### Create

<img src="https://raw.githubusercontent.com/Blasanka/helthcare-client/master/screenshots/add%20new%20appointment%20ui.jpg" alt="add new appointment ui.jpg" />

#### Update
 
<img src="https://raw.githubusercontent.com/Blasanka/helthcare-client/master/screenshots/update%20an%20appointment.jpg" alt="update an appointment.jpg" />

#### Delete
 
<img src="https://raw.githubusercontent.com/Blasanka/helthcare-client/master/screenshots/delete-alert-appointment-ui.jpg" alt="delete-alert-appointment-ui.jpg" />

<img src="https://raw.githubusercontent.com/Blasanka/helthcare-client/master/screenshots/delete-appointment-ui-alert.jpg" alt="delete-appointment-ui-alert.jpg" />

Implementation done by using Jersey web client to access Jersey JAX-RS API resource:

`Client client = ClientBuilder.newClient();`
 
##### Best Regards!
