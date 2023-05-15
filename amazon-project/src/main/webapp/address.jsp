<body>
<head>
  <link rel="stylesheet" href="loginStyle.css">
</head>
<div class="login">
<img class="login_logo" src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" class="image" width="100" height="100">

<div class="login_container">

			<form method="post" action="AddAddressServlet" >
			<h1>Create Address</h1><br>
			
			<h5>Your name</h5>
			<input type="text"  value="<%=session.getAttribute("name")%>" readonly="readonly">
			
			<h5>Mobile number</h5>
			<input type="text" value="<%=session.getAttribute("mobile")%>" readonly="readonly">
			
			<h5>Country</h5>
			<input type="text" name="country" required="required">
			
			<h5>State</h5>
			<input type="text" name="state" required="required">
			
			<h5>City</h5>
			<input type="text" name="city" required="required">	
			
			<h5>LandMark</h5>
			<input type="text" name="landMark" required="required">
			
			<h5>Area</h5>
			<input type="text" name="area" required="required">					
										
			<button class="login_signInButton" type="submit">Create Address</button>	
			
			<p><small>Select already presented address! <a href="selectAddress.jsp">Select address</a></small></p>
			</form>

</div>
</div>		
</body>
