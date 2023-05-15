<%-- <%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String querry="delete from OrderT where id=?";
Connection connection=ConnectWithDb.getConnection();
try {
	PreparedStatement pst = connection.prepareStatement(querry);

	pst.setInt(1, Integer.parseInt(request.getParameter("oNo")));
    pst.executeUpdate();
}catch(Exception e){
	System.out.println(e);
}
%>
<%@ include file="yourOrders.jsp" %>
</body>
</html> --%>