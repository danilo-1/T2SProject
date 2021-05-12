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
			<h1>Contêineres <%= session.getAttribute("username") %></h1>
			<a href="login_cadastro/cadcon.jsp">add conteiner</a>
			<button v-on:click="exibirFormulario">adicionar um novo conteiner</button>
					<form action="login_cadastro/cadcon.jsp" v-show="v1"><style>ca{text-transform: uppercase !important;}</style>
						<input type="text" id="ca" placeholder="AAAA1234567" name="conteinerId">
						<select name="conteinerTp">
							<option value="20">20</option>
							<option value="40">40</option>
						</select>
						<select name="conteinerSt">
							<option value="cheio">cheio</option>
							<option value="vazio">vazio</option>
						</select>
						<select name="conteinerCate">
							<option value="importacao">importação</option>
							<option value="exportacao">exportação</option>
						</select>
						
						<input type="submit" name="criar" value="criar">
					</form>
					
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
						%><td><%out.println(rs.getString("id_conteiner"));%></td>
						<%int idC2 = rs.getInt("id_conteiner");%>
					
						
					<td>
					<form action="login_cadastro/edita.jsp" method="GET">
					<button type="submit" name="editar" value="<%= idC2%>">editar</button></form>
					<form action="login_cadastro/cadcon.jsp" method="GET">
					
					<button type="submit" name="remove" value="<%= idC2%>">remove</button></form></td>	
					</tr><%} 
				%></table>
			</div><%
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
	