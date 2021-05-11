<%@ page language="java" contentType="text/html"%>
 <%@page import="java.sql.*"%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<title>Database-BDT2S</title>
</head>
<%if(session.getAttribute("usuario logado") != null){%>
	<body>
	<div class="container">
	<%@include file="WEB-INF/lib/header.jspf" %>
	<h1>Contêiners do <%= session.getAttribute("username") %></h1>
	<a href="login_cadastro/cadcon.jsp">add conteiner</a>
	<%
	String b = (String)session.getAttribute("email");
	String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
	String username = "postgres";  
	String password = "root";  
	try{
	   Connection con = DriverManager.getConnection( url, username, password );
		
		
	PreparedStatement stmt = con.prepareStatement("SELECT * FROM conteiner where email = ? ");
	stmt.setString(1, b);
	ResultSet rs = stmt.executeQuery();
	%><div class="table-responsive">
	<table class="table table-striped table-sm"><%
	while(rs.next()){
	%><tr><% 
				%><td><%out.println(rs.getString("nm_cliente"));%></td><%
				%><td><%out.println(rs.getString("num_conteiner"));%></td><%
				%><td><%out.println(rs.getString("tipo_conteiner"));%></td><%
				%><td><%out.println(rs.getString("status_conteiner"));%></td><%
				%><td><%out.println(rs.getString("categoria"));%></td><%
	%></tr><%} 
	%></table></div><%
	rs.close(); stmt.close(); con.close(); 
 }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }%>
 	
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="implementacao.js"></script>
</body>
</html>
<%}
if(session.getAttribute("usuario logado") == null){
	%> <div class="container"><%
		out.println("ACESSO NEGADO: por favor, entre com um login ou cadastre-se para ter acesso ao conteúdo da página");
	
	%></div><%
}
%>
	