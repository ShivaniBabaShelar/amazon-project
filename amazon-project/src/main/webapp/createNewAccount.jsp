<body>
<head>
  <link rel="stylesheet" href="loginStyle.css">
</head>
<div class="login">
<img class="login_logo" src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" class="image" width="100" height="100">

<div class="login_container">

			<form method="POST" action="CreateAccountServlet" >
			<h1>Create account</h1><br>
			
			<h5>Your name</h5>
			<input type="text" placeholder="First and last name" name="name" required="required">
			
			<h5>Mobile number</h5>
			<input type="tel" name="mobile" pattern="[0-9]{10}" maxlength="10" required="required">
			
			<h5>Email</h5>
			<input type="email" name="email" required="required">
										
										
			<h5>Password</h5>
			<!-- <span class="right"><a href="#">Forgot your password?</a></span> -->
			<input type="password" maxlength="25" placeholder="At least 6 characters" name="password" required="required">
										
			<!-- <h5>Re-enter password</h5>
			<input type="password" maxlength="25" placeholder="At least 6 characters" name="reEnterPassword"> -->								
			
			<p><small>By creating account you are agreeing to our <a href="#">Terms of Use</a> and our <a href="#">Privacy Policy</a></small></p>
			
			<button class="login_signInButton" type="submit">Create Account</button>	
			
			<p><small>Already have an account? <a href="signIn.jsp">Sign In</a></small></p>
			</form>

</div>
</div>		
</body>
