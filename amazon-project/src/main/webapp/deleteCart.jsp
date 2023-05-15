<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="dao.ConnectWithDb"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String querry="TRUNCATE TABLE Cart";
Connection connection=ConnectWithDb.getConnection();
try {
	PreparedStatement pst = connection.prepareStatement(querry);
    pst.executeUpdate();
}catch(Exception e){
	System.out.println(e);
}
%>
<%@ include file="cart1.jsp" %>
</body>
</html>