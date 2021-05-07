<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>

<%@page import="java.sql.*"%> 

<%@ page pageEncoding="UTF-8" %>
<h1>projeto</h1>
<%  
  String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; //Informe a porta de conexão. Assim você garante todas as informações de conexão.
  String username = "postgres";  
  String password = "root";  
 //Não precisa chamar o método newInstance, basta assim como coloquei.

	 
 
   Connection con = DriverManager.getConnection( url, username, password );
	out.println("Conexao iniciada...<br />");
	
	// Passo 3. Criar um objeto Statement 
	Statement s = con.createStatement();
      
              out.println("entrada 01"); %><br /><%
              String sql = "SELECT * FROM conteiner" ;
	ResultSet rs = s.executeQuery(sql);
        while (rs.next()) { 
        out.println( rs.getString(1) + " | " + rs.getString(2) +" | "+ rs.getString(3) +" | " + rs.getString(4) +" | " + rs.getString(5) +"<br />"); }
        rs.close(); s.close(); con.close();
      
       
          	
	
	

	

%>




