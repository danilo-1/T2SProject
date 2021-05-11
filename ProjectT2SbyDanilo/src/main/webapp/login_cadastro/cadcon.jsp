<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%> 

<%if(request.getParameter("criar") != null){
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
	
	
	int rs = stmt.executeUpdate();
    if( rs > 0) {
        response.sendRedirect("../database.jsp");
    }
	 stmt.close(); con.close(); 
 }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }
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

	
<body>
	<div class="container">
		<form>
			<input type="text" placeholder="AAAA1234567" name="conteinerId">
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
		
	</div>
</body>
</html>

