<%-- 
    Document   : register
    Created on : 6 Jul, 2017, 3:03:25 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BestStore || Register</title>
    <link href="css/boot.css" rel="stylesheet">
    <link href="css/font.css" rel="stylesheet">
    <link href="css/pretty.css" rel="stylesheet">
    <link href="css/price.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    
	<link href="css/c1.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/c2.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="qry/qr1.js"></script>
<!-- //js -->
<!-- cart -->
<script src="qry/qr2.js"></script>
<!-- cart -->
<link rel="stylesheet" type="text/css" href="css/c5.css">
<!-- for bootstrap working -->
<script type="text/javascript" src="qry/qr3.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- timer -->
<link rel="stylesheet" href="css/c3.css" />
<!-- //timer -->
<!-- animation-effect -->
<link href="css/c4.css" rel="stylesheet"> 
<script src="qry/qr4.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	#icon3
	{
		background-image:url(images/icon/email.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	
	}
	
	#icon2
	{
		background-image:url(images/icon/contact.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}
		
	#icon1
	{
		background-image:url(images/icon/user.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}	
	
	#icon4
	{
		background-image:url(images/icon/key.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}
	
	#icon5
	{
		background-image:url(images/icon/check.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}
	
	
	
</style>
	
	<script src="qry/jquery.js"></script>
	<script src="qry/boot.js"></script>
	<script src="qry/min.js"></script>
	<script src="qry/price.js"></script>
    <script src="qry/pretty.js"></script>
    <script src="qry/main.js"></script>
</head><!--/head-->

<body>
	
    <jsp:include flush="true" page="header.jsp" />

	<div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Register Here</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">New To Best Store.</p>
<!---728x90--->
			<div class="login-form-grids">
			<!--
				<h5 class="animated wow slideInUp" data-wow-delay=".5s">profile information</h5>
				<form class="animated wow slideInUp" data-wow-delay=".5s">
					<input id="icon1" name="name" type="text" placeholder="Name..." required=" " >
					<input id="icon2" name="contact" type="text" placeholder="Contact Number..." required=" " >
					<h3 align="center"> Register As</h3>
					<br/>
					<table align="center" width="36%">
						
													<tr>
							<td align="center">
								Customer
							</td>
							<td>
								<input type="radio" value="customer" name="user" checked="checked"/>
							</td>
						</tr>						<tr>
							<td align="center">
								Vendor
							</td>
							<td>
								<input type="radio" name="user" value="vendor"/>
							</td>
						</tr>
						</tr>
					</table>
					<br/>
					<table width="100%" align="center" border="1" style="border-color:transparent"  >
						
						<tr>
							<td align="center"><h5>Date Of Birth<h5></td>
							<td align="center"><h5><input type="date" name="dob" /></h5></td>
						</tr>
					</table>	
					<table  width="100%" align="center" border="1" style="border-color:transparent">
						<tr>
							<td align="center"><h5>Gender</h5></td>
							<td align="center"><h5>Male <input type="radio" name="gender" value="male" checked="checked" /> &nbsp; &nbsp; &nbsp; &nbsp; Female <input type="radio" name="gender" value="female" /></h5></td>
						</tr>
					</table>
					<table  width="100%" align="center" border="1" style="border-color:transparent">					
						<tr>
							<td align="center"><h5>City</h5></td>
							<td align="center"><h5><select name="city">
						<option value="delhi">Delhi</option>
						<option value="mumbai">Mumbai</option>
						<option value="chennai">Chennai</option>
						<option value="bengluru">Bengluru</option>
						<option value="kota">Kota</option>
						<option value="kochi">kochi</option>
						<option value="hyderabad">Hyderabad</option>
						<option value="jaipur">Jaipur</option>
						<option value="ajmer">Ajmer</option>
						<option value="chandigarh">Chandigarh</option>
						<option value="kolkata">Kolkata</option>
						<option value="lucknow">Lucknow</option>
						<option value="kanpur">Kanpur</option>
						<option value="jammu">Jammu</option>
						<option value="rourkela">Rourkela</option>
						<option value="rajkot">Rajkot</option>
						<option value="kanchipuram">Kanchipuram</option>
						<option value="guwahati">Guwahati</option>
						<option value="ghaziabad">Ghaziabad</option>
						<option value="hamirpur" selcted >Hamirpur</option>
						<option value="manglore">Manglore</option>
						<option value="thane">Thane</option>
						<option value="mysore">Mysore</option>
						<option value="jamshedpur">Jamshedpur</option>
						<option value="dehradun">Dehradun</option>
						<option value="jabalpur">Jabalpur</option>
						<option value="udaipur" >Udaipur</option>
						<option value="shimla">Shimla</option>
						<option value="allahabad">Allahabad</option>
						<option value="amritsar">Amritsar</option>
						<option value="noida">Noida</option>
						<option value="ludhiana">Ludhiana</option>
						<option value="raipur">Raipur</option>
						<option value="agra">Agra</option>
						<option value="ranchi">Ranchi</option>
						<option value="bhubaneswar">Bhubaneswar</option>
						<option value="nagpur">Nagpur</option>
						<option value="varanasi">Varanasi</option>
						<option value="bhopal">Bhopal</option>
						<option value="indore">Indore</option>
						<option value="sikkim">Sikkim</option>
						<option value="patna">Patna</option>
						<option value="gwalior">Gwalior</option>
						<option value="pune">Pune</option>
						<option value="gurugram">Gurugram</option>
						<option value="ahemdabad">Ahemdabad</option>
						<option value="surat">Surat</option>
						</select></h5></td>
						</tr></table>	
					<table  width="100%" align="center" border="1" style="border-color:transparent">	
					<tr>
							<td align="center"><h5>State</h5></td>
							<td align="center"><h5><select name="state">
							
							</select></h5>
							</td>
						</tr>
					</table>
				</form>-->
<!---728x90--->
				<h6 class="animated wow slideInUp" data-wow-delay=".5s">Sigin information</h6>
                                <form id="sub" class="animated wow slideInUp" data-wow-delay=".5s" action="registerservlet.jsp" method="post">
					<input id="icon1" name="name" type="text" placeholder="Name..." required=" " >
					<input id="icon2"  name="contact" type="text" placeholder="Contact Number..." required=" " >
					<input id="icon3" name="mail" type="email" placeholder="Email Address" required=" " >
					<input id="icon4" id="pwd" name="pwd" type="password" placeholder="Create a Password" required=" " >
					<input id="icon5" id="password" type="password" placeholder="Password Confirmation" required=" " >
					<br/>
					<div class="register-check-box">
						<div class="check">
							<h3 align="center">Register As</h3>
					<br/>
					<table align="center" width="36%">
													<tr>
							<td align="center">
								Customer
							</td>
							<td>
								<input type="radio" value="customer" name="user" checked="checked"/>
							</td>
						</tr>						<tr>
							<td align="center">
								Vendor
							</td>
							<td>
								<input type="radio" name="user" value="vendor"/>
							</td>
						</tr>
						</tr>
					</table>
					
						</div>
					</div>
					<input type="submit" value="Register">
				</form>
			</div>
			<div class="register-home animated wow slideInUp" data-wow-delay=".5s">
				<a href="index.jsp">Home</a>
			</div>
		</div>
	</div>
<!-- //register -->


<jsp:include flush="true" page="footer.jsp" />

	
</body>
</html>	