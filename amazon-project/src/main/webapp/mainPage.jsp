<html>
<head>
<link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2048px-Amazon_icon.svg.png"/>
<link rel="stylesheet" href="mainStyle.css">
<script src="https://kit.fontawesome.com/ce32f97ca4.js" crossorigin="anonymous"></script>
<title>Online Shopping Site in India</title>
</head>
<body>
		<header class="header">
		
		<div class="container container-header">
		<!--  ********************************************* Logo ************************************************************** -->
		<div class="logo-container border-white">
		<div class="logo"></div>
		<span class="dotin">.in</span>
		</div>
		<!--  ********************************************* Address ************************************************************** -->
		<%if(request.getSession().getAttribute("name")!=null)	{	%>
		<div class="address-container border-white">
		<p class="first-line" >&nbsp Deliver to &nbsp<%= request.getSession().getAttribute("name")%></p>
		<div class="icon-address">
		&nbsp<i class="fa-solid fa-location-dot icon-location"></i>
		<!-- <p class="second-line link-decoration"><a href="addAddress.jsp">Select your address &nbsp</a></p> -->
		</div>
		</div>
		
		<%} else { %>
		<div class="address-container border-white">
		<p class="first-line" >&nbsp Hello</p>
		<div class="icon-address">
		&nbsp<i class="fa-solid fa-location-dot icon-location"></i>
		<p class="second-line link-decoration"><a href="addAddress.jsp">Select your address &nbsp</a></p>
		</div>
		</div>
		<%} %>
		<!--  ********************************************* Search ************************************************************** -->
		<div class="search-container">
		<div class="drop-down">
		  <button class="drop-down-button">All</button>
		  <div id="my-drop-down" class="drop-down-content">
		    <a href="products.jsp">All</a>
		  <!--   <a href="#">Link 2</a>
		    <a href="#">Link 3</a> -->
		  </div><form action="search.jsp">
		</div><form action=search.jsp>
		<input name="search" type="text" class="search-input" placeholder="Search Amazon.in"/>
		<div class="search-icon">
		<button class="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button></form>
		</div>
		</div>
		<!--  ********************************************* Language ************************************************************** -->
		<div class="language-container border-white">
		<p>English</p>
		<div class="language-image">
		<img src="https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg">
		</div>
		</div>
		<!--  ********************************************* Login ************************************************************** -->
		<%if(request.getSession().getAttribute("name")!=null)	{	%>
		<div class="login-container border-white">
		<p class="first-line">Hello,<span><%= request.getSession().getAttribute("name") %></span></p>
		<p class="second-line link-decoration"><a href="createNewAccount.jsp">New Account &nbsp</a></p>
		</div>
		<%}else{ %>
		<div class="login-container border-white">
		<p class="first-line link-decoration">Hello,<span><a href="signIn.jsp">Sign In</a></span></p>
		<p class="second-line link-decoration"><a href="createNewAccount.jsp">New Account &nbsp</a></p>
		</div>
		<%} %>
		<!--  ********************************************* Returns and Orders ************************************************************** -->
		<div class="returns-and-order-container border-white">
		<p class="first-line link-color">Returns</p>
		<p class="second-line link-decoration"><a href="yourOrders.jsp">& Orders</a></p>
		</div>
		<!--  ********************************************* Cart ************************************************************** -->
		<div class="cart-count-container border-white">
		<div class="link-decoration" id="count"><i class="fa-solid fa-cart-shopping"></i><a href="cart1.jsp">&nbsp Cart</a></div>
		</div> 
		
		</div>
		
		</div>
		
		</header>
<!--  ********************************************* Second Header ************************************************************** -->
    <nav class="nav">
        <div class="container container-nav">
            <ul>
                <li class="border-white-h2" id="open-nav-sidebar">
                    <span class="open-nav-slider">
                        <i class="fa-solid fa-bars"></i>
                        All
                    </span>
                </li>
                <li class="border-white-h2"><a href="#">Best Sellers</a></li>
                <li class="border-white-h2"><a href="#">Today's Deals</a></li>
                <li class="border-white-h2"><a href="#">Mobiles</a></li>
                <li class="border-white-h2"><a href="#">Customer Service</a></li>
                <li class="border-white-h2"><a href="#">Electronic</a></li>
                <li class="border-white-h2"><a href="#">Home & Kitchen</a></li>
                <li class="border-white-h2"><a href="#">Fashion</a></li>
                <li class="border-white-h2"><a href="#">Book</a></li>
                <li class="border-white-h2 prime-image-hover">
                    <a href="#">Prime</a>
                    <div class="prime-image">
                        <img
                            src="https://m.media-amazon.com/images/G/31/prime/NavFlyout/TryPrime/2018/Apr/IN-Prime-PIN-TryPrime-MultiBen-Apr18-400x400._CB442254244_.jpg" />
                    </div>

                </li>
            </ul>
            <div class="nav-right-image-amazon-prime">
                <img
                    src="https://m.media-amazon.com/images/G/31/img17/Home/AmazonTV/Ravina/Desktop/Watch-Entertainment-for-FREE_400-x39._CB605460886_.jpg" />
            </div>
        </div>
    </nav>

    <!--sidebar navigation-->
<!--     <div class="sidebar-container-navigation" id="sidebar-container-navigation-id">
        <div class="sidebar-left-part">
            <div class="sidebar-top">
                <i class="fa-solid fa-circle-user"></i>
                <h2>Hello, <span>sign in</span></h2>
            </div>
            <div class="sidebar-wrap">
                <div class="sidebar-item">
                    <h2>Trending</h2>
                    <p>Best Sellers</p>
                    <p>New Releases</p>
                    <p>Movers and Shakers</p>
                </div>
                <div class="sidebar-item">
                    <h2>Digital Content And Devices</h2>
                    <p>Echo & Alexa</p>
                    <p>Fire TV</p>
                    <p>Kindle E-Readers & eBooks</p>
                    <p>Audible Audiobooks</p>
                    <p>Amazon Prime Video</p>
                    <p>Amazon Prime Music</p>
                </div>
                <div class="sidebar-item">
                    <h2>Shop By Category</h2>
                    <p>Mobiles, Computes</p>
                    <p>TV, Appliances, Electronic</p>
                    <p>Men's Fashion</p>
                    <p>Women's Fashion</p>
                    <p>See All</p>
                </div>
                <div class="sidebar-item">
                    <h2>Programs & Features</h2>
                    <p>Gift Cards & Mobile Recharges</p>
                    <p>Flight Tickets</p>
                    <p>#Foundlt-OnAmazon</p>
                    <p>Clearance store</p>
                </div>
                <div class="sidebar-item">
                    <h2>Help & Settings</h2>
                    <p>Your Account</p>
                    <p>Customer Service</p>
                    <p>Sign in</p>
                </div>
            </div>
        </div>
        <button id="sidebar-navigation-close">
            <i class="fa-solid fa-xmark"></i>
        </button>
    </div> -->
</body>
</html>

