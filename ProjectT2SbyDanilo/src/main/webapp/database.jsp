<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%> 


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<meta charset="utf-8">
<title>Database-BDT2S</title>
</head>
<%if(session.getAttribute("usuario logado") != null){%>
	<body>
	<div class="container">
	<%@include file="WEB-INF/lib/header.jspf" %>
	<h1>Database usuário</h1>
	<%
	String b = (String)session.getAttribute("email");
	String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
	String username = "postgres";  
	String password = "root";  
	try{
	   Connection con = DriverManager.getConnection( url, username, password );
		out.println("Conexao iniciada...<br />"); 
		
	PreparedStatement stmt = con.prepareStatement("SELECT * FROM conteiner where email = ? ");
	stmt.setString(1, b);
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
	out.println(rs.getString("id_conteiner") + " | " + rs.getString("nm_cliente")+" | "+ rs.getString("num_conteiner")+" | "+ rs.getString("tipo_conteiner")+" | "+ rs.getString("status_conteiner")+" | "+ rs.getString("categoria")+ "<br/>");
	}
	rs.close(); stmt.close(); con.close(); 
 }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }%>
 	<a href="login_cadastro/cadcon.jsp">add conteiner</a>
	</div>
	</body>
	</html>
<%}
if(session.getAttribute("usuario logado") == null){
	%> <div class="container"><%
		out.println("ACESSO NEGADO: por favor, entre com um login ou cadastre-se para ter acesso ao conteúdo da página");
	%></div><%
}
%>
	