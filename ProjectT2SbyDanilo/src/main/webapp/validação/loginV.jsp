<%@ page language="java" contentType="text/html"%>
    
 <%@page import="java.sql.*"%> 

<%
String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
String username = "postgres";  
String password = "root";  
//Não precisa chamar o método newInstance, basta assim como coloquei.

	String user = request.getParameter("username");
String userpass = request.getParameter("password");
try{
	   Connection con = DriverManager.getConnection( url, username, password );
	   %><h3><a href="../login_cadastro/login.jsp">Voltar</a></h3><%
		out.println("<h2>ERRO DE LOGIN: por favor, inicie um cadastro ou insira o login corretamente</h2> <br />"); 
// Passo 3. Criar um objeto Statement 
	PreparedStatement stmt = con.prepareStatement("select * from contato where email = ? and senha = ?");

stmt.setString(1, user);
stmt.setString(2, userpass);
 
	//String sql = "SELECT * FROM contato where email = " + user;
	ResultSet rs = stmt.executeQuery();
	while(rs.next()){
		out.println(rs.getString(1) + "|" + rs.getString(2));

	   String a = rs.getString(3);
	   String b = rs.getString(1);
	if(rs != null){
		out.println("você está conectado");
		session.setAttribute("usuario logado", "true");
	    session.setAttribute("username", String.valueOf(a));
	    session.setAttribute("email", String.valueOf(b));
	    response.sendRedirect("../database.jsp");
	}}
rs.close(); stmt.close(); con.close(); 
 }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }
 %>
