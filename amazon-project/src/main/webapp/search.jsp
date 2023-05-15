<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="dao.ConnectWithDb"%>
<%@ page import="entity.Address"%>
<%@ page import="products.Product"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="products.Mobile"%>
<%@ page import="products.Laptop"%>
<%@ page import="products.MakeUp"%>
<%@ page import="products.Product"%>
<link rel="stylesheet" href="productStyle.css">
<!DOCTYPE html>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="mainPage.jsp" %>
<%
ArrayList<Product> products=new ArrayList<Product>();
String search=request.getParameter("search");
int i=0;
querry="select * from Product where productName=? or type=?";
connection=ConnectWithDb.getConnection();
try {
	pst = connection.prepareStatement(querry);
	pst.setString(1, search);
	pst.setString(2, search);
    ResultSet rs=pst.executeQuery();
while(rs.next()){
	Product p=new Product(rs.getString("productName"),rs.getString("type"),rs.getInt("price"),rs.getString("imageAddress"),rs.getString("productInfo"));
	products.add(p);
}
i=0;
}
catch(Exception e){
	System.out.println(e);
}
i=0;
while(i<products.size()){
%>
<div class="card">
<div class="product-image">
  <img src="<%=products.get(i).getImageSrc().toString()%>">
</div>
  <h1><%=products.get(i).getName().toString()%></h1>
  <p class="price">₹ <%=products.get(i).getPrice()%></p>
  <p><%=products.get(i).getProductInfo()%></p>
  <p><form method="post" action="AddToCartServlet">
  <input type="hidden" name="type" value="<%=products.get(i).getClass().getSimpleName()%>"/>
  <input type="hidden" name="name" value="<%=products.get(i).getName()%>"/>
  <input type="hidden" name="price" value="<%=products.get(i).getPrice()%>"/>
  <input type="hidden" name="mobile" value="<%=session.getAttribute("mobile")%>"/>
   <input type="hidden" name="imageAddress" value="<%=products.get(i).getImageSrc()%>"/>
  <button >Add to Cart</button>
  </form></p>
</div>
<%i++;} %>
</div>
</body>
</html>