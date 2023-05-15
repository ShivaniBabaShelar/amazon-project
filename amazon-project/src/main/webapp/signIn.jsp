<body>
<head>
  <link rel="stylesheet" href="loginStyle.css">
</head>
<div class="login">
<img class="login_logo" src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" class="image" width="100" height="100">

<div class="login_container">
			<form action="SignInServlet" method="post">
			<h1>Sign in</h1><br>
			
			<h5>Mobile phone number</h5>
			<input type="tel" name="mobile" pattern="[0-9]{10}" maxlength="10" required>
										
										
			<h5>Password</h5>
			<!-- <span class="right"><a href="#">Forgot your password?</a></span> -->
			<input type="password" name="password" maxlength="25" required>
										
										
			<button class="login_signInButton" type="submit">Sign In</button>	
			
			<p><small>By signing in you are agreeing to our <a href="#">Terms of Use</a> and our <a href="#">Privacy Policy</a></small>.</p>
			
			
			</form>

<div class="footer">
<span><hr style="float:left; width: 30%"/><small style="color:grey;">&nbsp &nbsp New to Amazon?</small><hr style="float:right; width: 30%"/></span>

<a href="createNewAccount.jsp"><button class="login_registerButton" type="submit">Create Your Amazon Account</button></a>
</div>

</div>
</div>		
</body>
