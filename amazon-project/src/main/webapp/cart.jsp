<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="dao.ConnectWithDb"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="productStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="mainPage.jsp" %>
<%
int count=0;
String mobile=(String)session.getAttribute("mobile");
String querry="select * from Cart where mobile=?";
Connection connection=ConnectWithDb.getConnection();
PreparedStatement pst;
try {
	pst = connection.prepareStatement(querry);
	pst.setString(1, mobile);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		count++;
%>
<div class="card">
<div class="product-image">
  <img src="<%=rs.getString("imageAddress")%>">
</div>
  <h1><%=rs.getString("productName")%></h1>
  <p class="price">₹ <%=rs.getString("price")%></p>
  <%-- <p><form method="post" action="AddToCartServlet">
  <input type="hidden" name="type" value="<%=products.get(i).getClass().getSimpleName()%>"/>
  <input type="hidden" name="name" value="<%=products.get(i).getName()%>"/>
  <input type="hidden" name="price" value="<%=products.get(i).getPrice()%>"/>
  <input type="hidden" name="mobile" value="<%=session.getAttribute("mobile")%>"/>
   <input type="hidden" name="imageAddress" value="<%=products.get(i).getImageSrc()%>"/> --%>
  <button >Add to Cart</button>
  </form></p>
</div>
<%} session.setAttribute("count",count);%>
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