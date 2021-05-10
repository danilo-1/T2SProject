<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%> 

<%
String a = (String)session.getAttribute("username");

String id = request.getParameter("conteinerId");
String tp = request.getParameter("conteinerTp");
String st = request.getParameter("conteinerSt");
String cate = request.getParameter("conteinerCate");
String name = request.getParameter("name");
String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
String username = "postgres";  
String password = "root";  
//Não precisa chamar o método newInstance, basta assim como coloquei.


try{
	   Connection con = DriverManager.getConnection( url, username, password );
		out.println("Conexao iniciada...<br />"); 
// Passo 3. Criar um objeto Statement 
	PreparedStatement stmt = con.prepareStatement("INSERT INTO conteiner VALUES (?, ?, ?, ?, ?, ?)");
stmt.setString(1, a);
stmt.setString(2, id);
stmt.setString(3, tp);
stmt.setString(4, st);
stmt.setString(5, cate);
stmt.setString(6, (String)session.getAttribute("email"));
 
	//String sql = "SELECT * FROM contato where email = " + user;
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
	if(rs.getString(1) != null){
		
		response.sendRedirect("../database.jsp");
	 
	 
	}}
	rs.close(); stmt.close(); con.close(); 
 }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }
 %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<meta charset="utf-8">
<title>Inserir contêiner </title>
</head>
<% if(request.getParameter("new") != null){
	
%>
<body>
	<div class="container">
		<form>
			<input type="text" placeholder="AAAA1234567" value="conteinerId">
			<select name="conteinerTp">
				<option value="valort1">20</option>
				<option value="valort2">40</option>
			</select>
			<select name="conteinerSt">
				<option value="valors1">cheio</option>
				<option value="valors2">vazio</option>
			</select>
			<select name="conteinerCate">
				<option value="valorc1">importação</option>
				<option value="valorc2">exportação</option>
			</select>
			<input type="submit" name="criar" value="criar">
		</form>
		
	</div>
</body>
</html>
<%}
else{
	%> <div class="container"><%
		out.println("ACESSO NEGADO: por favor, entre com um login ou cadastre-se para ter acesso ao conteúdo da página");
	%></div><%
}
%>
