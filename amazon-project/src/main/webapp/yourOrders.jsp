<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="dao.ConnectWithDb"%>
<%@ page import="entity.Address"%>
<%@ page import="entity.Order"%>
<html>
 <%! 
 int price=0,total=0,quantity,itemCount=0,inc,dec;
 ResultSet addressResultSet,cartResultSet;
 Connection connection;
 PreparedStatement pst;
 String querry;
 int size =0;
 %>
<head>

<style>
body {
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}
.card {

  border: 2px solid White;
  padding-left: 25px;
  padding-right: 25px;
  padding-top: 10px;
  border-radius: 5px;
  width:40%;
  margin:50px;
  margin-left:350px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  border-radius: 5px;
  border-color:"Black";
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
.button{
font-size: 14px;
 display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  width:30%;
  background-color:#fbdb04;
}
img {
  border-radius: 5px 5px 0 0;
}
h4 {
color: #8B0000;
}
h5 {
font-size: 15px;
}

.container {
  padding: 2px 16px;
}
</style>
	<title>Your Orders</title>
	<link rel="stylesheet" type="text/css" href="./cartStyle.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
</head>
<body>
   <div class="CartContainer">
<%
/* Address address=(Address)session.getAttribute("address"); */
Address address=new Address("Shivani Shelar","9420290311","India","Pune","Maharashtra","Bus Depo","Shewalewadi");
String mobile=(String)session.getAttribute("mobile");

cartResultSet=(ResultSet)session.getAttribute("cartResultSet");
/* insert order to get id */
querry="insert into OrderT(mobile,address) values(?,?)";
connection=ConnectWithDb.getConnection();
try {
	pst = connection.prepareStatement(querry);
	pst.setString(1, mobile);
	pst.setString(2, address.toString());	
    pst.executeUpdate();
	}
catch(Exception e){
	System.out.println(e);
}
/* get all orders to get last id */
querry="select * from OrderT";
connection=ConnectWithDb.getConnection();
try {
	pst = connection.prepareStatement(querry);	
    ResultSet rsOrder=pst.executeQuery();
    while(rsOrder.next()) 
    {
      size = size+1; // get row id 
    }
	}
catch(Exception e){
	System.out.println(e);
}
/* insert order and product details in Order_Product table */
querry="select * from Cart where mobile=?";
connection=ConnectWithDb.getConnection();
	pst = connection.prepareStatement(querry);
	pst.setString(1, mobile);
    cartResultSet=pst.executeQuery();
while(cartResultSet.next()){
querry="insert into Product_Order values(?,?,?)";
connection=ConnectWithDb.getConnection();
try {
	pst = connection.prepareStatement(querry);
	pst.setString(1, cartResultSet.getString("productName"));
	pst.setInt(2, size);	
	pst.setInt(3, cartResultSet.getInt("price"));
    pst.executeUpdate();
}
catch(Exception e){
	System.out.println(e);
}
}%>
<H1 align="CENTER">YOUR ORDERS</H1>
<% 
/* select all products of specific order until current order */
ArrayList<Order> orders=new ArrayList<Order>();
int total=0;
int price=0;
int i=1;
System.out.println(size);
while(i<=size){
querry="select Product.productName,Product.price from Product,OrderT,Product_Order where Product.productName=Product_Order.productName AND Product_Order.id=OrderT.id  AND OrderT.id=? AND OrderT.mobile=?";
connection=ConnectWithDb.getConnection();
try {
	pst = connection.prepareStatement(querry);
	pst.setInt(1, i);
	pst.setString(2, mobile);
    ResultSet finalRs=pst.executeQuery();
    while(finalRs.next()){
    	price=finalRs.getInt(2);
    	total=total+price;
    	Order order= new Order(i,finalRs.getString(1),price);
    	orders.add(order);
    	/* out.println(finalRs.getString(1));
    	out.println(finalRs.getInt(2));
    	out.println(i+"th order................."); */
    }
    if(orders.size()>0){
    %>
    <div class="card">  
    			<%
  				int j=0;
    			
				while(j<orders.size()){
				%>
				<form>
				<div class="cardItem">
				<h4> <p><%=orders.get(j).getName().toString()%><span>
				  Price=<%=orders.get(j).getPrice()%></span></p></h4>				 
				</div>
				<%j++;} %>
				<h3>Total=<%=total%></h3>
				<button class="button" >DONE</button> 		
				 </form></p>				
    </div>    
    <% 
    }
    i++;
    price=0;
    total=0;
    orders.clear();
	}
catch(Exception e){
	System.out.println(e);
}

}
size=0;
/* session.setAttribute("orders",orders);
response.sendRedirect("order.jsp"); */

%>


</body>
</html>