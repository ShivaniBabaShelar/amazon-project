<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="dao.ConnectWithDb"%>
<html>
 <%! 
 int price=0,total=0,quantity,itemCount=0,inc,dec;
 ResultSet addressResultSet,cartResultSet;
 Connection connection;
 PreparedStatement pst;
 String querry;
 %>
 <%!
          public void add() {
               inc=inc+1;
         }
%>
 <%!
          public void sub() {
            dec=dec+1;    
         }
%>


<head>
	<title>Cart</title>
	<link rel="stylesheet" type="text/css" href="./cartStyle.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
</head>
<body>
   <div class="CartContainer">
   	   <div class="Header">
   	   	<h3 class="Heading">Shopping Cart</h3>
   	   	<h5 class="Action"><a href=deleteCart.jsp>Remove all</a></h5> 
   	   </div>
<%
int count=0;
String mobile=(String)session.getAttribute("mobile");
querry="select * from Cart where mobile=?";
connection=ConnectWithDb.getConnection();
try {
	pst = connection.prepareStatement(querry);
	pst.setString(1, mobile);
    cartResultSet=pst.executeQuery();
	while(cartResultSet.next()){
		count++;
%>
   	   <div class="Cart-Items">
   	   	  <div class="image-box">
   	   	  	<img src="<%=cartResultSet.getString("imageAddress")%>" style={{ height="120px" }} />
   	   	  </div>
   	   	  <div class="about">
   	   	  	<h1 class="title"><%=cartResultSet.getString("productName")%></h1>
   	   	  	<h3 class="subtitle"><%=cartResultSet.getString("type")%></h3>
   	   	  	<%-- <select name="quantity" style={{ width="120px" }}>
   	   	  	  <optgroup label="Quantity">
	           <option value="1">1</option>
	           <option value="2">2</option>
	           <option value="3">3</option>
	           <option value="2">4</option>
	           <option value="3">5</option>
	           </optgroup>
	  		</select>
	  		<%if(request.getParameter("quantity")!=null)
	  			quantity=Integer.parseInt(request.getParameter("quantity"));
	  		else
	  			quantity=1;
	  		%> --%>
   	   	  </div>
   	   	 <%--  <div class="counter">
   	   	 <form><div class="btn"><a href="#" class=”button-solid”>+</a></div></form>
   	   	  	<div class="count"><%=session.getAttribute("productCount")%></div>
   	   	  <form><div class="btn"><a href="#" class=”button-solid”>-</a></div></form>
   	   	  <div class="custom-select" style="width:500px;">
   	   	   
  		  </div>
   	   	  </div> --%>
   	   	  <div class="prices">
   	   	  <%
   	   	  	price=Integer.parseInt(cartResultSet.getString("price"));
   	   	    total=total+price;
   	   	    itemCount=itemCount+1;
   	   	  %>
   	   	  	<div class="amount">RS.<%=price%></div>
   	   	  	<!-- <div class="save"><u>Save for later</u></div>
   	   	  	<div class="remove"><u>Remove</u></div> -->
   	   	  </div>
</div>
<hr>
<%}%>

   	 <div class="checkout">
   	 <div class="total">
   	 	<div>
   	 		<div class="Subtotal">Sub-Total</div>
   	 		<div class="items"><%=itemCount%> products</div>
   	 	</div>
   	 	<div class="total-amount">RS.<%=total%></div>
   	 	
   	 
   	 </div>
   	 <div>
   	<%--  <input type="text" name=address value="<%=session.getAttribute("address") %>" readonly="readonly">--%>	 
   	 	<FORM action="yourOrders.jsp">    	
   	 <button class="button">BUY NOW</button></div>
   	 </FORM>
   	 </div>
   	 <%
		   	querry="select * from Address where mobile=?";
		   	 connection=ConnectWithDb.getConnection();
		 
		   	try {
		   		pst = connection.prepareStatement(querry);
		   		pst.setString(1, "9420290311");
		   		addressResultSet=pst.executeQuery();
		   		
		   		session.setAttribute("cartResultSet", cartResultSet);
	   			session.setAttribute("addressResultSet", addressResultSet);
	   			
		   		/* if (addressResultSet.next() == false) 
		   			response.sendRedirect("address.jsp");
		   		
		   		else 
		   			response.sendRedirect("selectAddress.jsp");	
	   			*/
		   	}
		   	catch (SQLException e) {
		   		// TODO Auto-generated catch block
		   		e.printStackTrace();
		   	}
	 %>
   	 
   	 	<%itemCount=0;total=0;%>
   </div>
</div>
<%	
	}
catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

   	 
</body>
</html>