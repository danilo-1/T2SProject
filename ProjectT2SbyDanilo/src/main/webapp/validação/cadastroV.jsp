<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%> 

<%
String user = request.getParameter("username");
String userpass = request.getParameter("password");
String name = request.getParameter("name");
String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
String username = "postgres";  
String password = "root";  
//Não precisa chamar o método newInstance, basta assim como coloquei.


try{
	   Connection con = DriverManager.getConnection( url, username, password );
		out.println("Conexao iniciada...<br />"); 
		%> <h3><a href="../login_cadastro/login.jsp">Voltar</a></h3>
		<h2><% out.println("usuário não encontrado, por favor, insira os dados nomavente"); %></h2><%
// Passo 3. Criar um objeto Statement 
	PreparedStatement stmt = con.prepareStatement("INSERT INTO contato VALUES (?, ?, ?)");

stmt.setString(1, user);
stmt.setString(2, userpass);
stmt.setString(3, name);
 
	//String sql = "SELECT * FROM contato where email = " + user;
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
	if(rs.getString(1) != null){
		out.println("configurado");
	
	    session.setAttribute("cadastrado", "true");
	    response.sendRedirect("../login_cadastro/login.jsp");
	}}
	rs.close(); stmt.close(); con.close(); 
 }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }
 %>