<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%> 

<%

String tip = request.getParameter("moviTp");
String ti = request.getParameter("timein");
String ti2 = request.getParameter("timein2");
String tf = request.getParameter("timeout");
String tf2 = request.getParameter("timeout2");
String conteiner = request.getParameter("conteiner");
String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
String username = "postgres";  
String password = "root";  
//Não precisa chamar o método newInstance, basta assim como coloquei.


try{
	
			Connection con = DriverManager.getConnection( url, username, password );
					
			if(request.getParameter("criar") != null){
				
				PreparedStatement stmt = con.prepareStatement("INSERT INTO movimentacao VALUES (?, ?, ?, ?)");
				stmt.setString(1, tip);
				stmt.setString(2, conteiner);
				stmt.setTimestamp(3, Timestamp.valueOf(ti + " " + ti2 + ":00"));
				stmt.setTimestamp(4, Timestamp.valueOf( tf + " " + tf2 + ":00"));
				
				
				
				//String sql = "SELECT * FROM contato where email = " + user;
				
				
				int rs = stmt.executeUpdate();
			    if( rs > 0) {
			        response.sendRedirect("../movimentacao.jsp");
			    }
				 stmt.close(); con.close(); 
			 }
			if(request.getParameter("movedit") != null){
				
				PreparedStatement stmt = con.prepareStatement("UPDATE movimentacao SET type_movimentacao= ?, dt_inicio= ?, dt_fim= ? WHERE num_conteiner= ?;");
				
				stmt.setString(1, tip);
				stmt.setTimestamp(2, Timestamp.valueOf(ti + " " + ti2 + ":00"));
				stmt.setTimestamp(3, Timestamp.valueOf( tf + " " + tf2 + ":00"));
				stmt.setString(4, conteiner);
					
			 
				//String sql = "SELECT * FROM contato where email = " + user;
				
				
				int rs = stmt.executeUpdate();
			    if( rs > 0) {
			    	
			        response.sendRedirect("../movimentacao.jsp");
			    }
				 stmt.close(); con.close(); 
			 }
			if(request.getParameter("remove")!= null){
				int idc = Integer.parseInt(request.getParameter("remove"));
				PreparedStatement stmt = con.prepareStatement("DELETE FROM movimentacao WHERE id_movimentacao = ?;");
				stmt.setInt(1, idc);
				
				int rs = stmt.executeUpdate();
			    if( rs > 0) {
			        response.sendRedirect("../movimentacao.jsp");
			    }
				 stmt.close(); con.close(); 
			 }
				  
	   }
 catch(SQLException e){
	 out.println("Erro em conectar o Database: " + e);
	 e.printStackTrace();
 }



if(session.getAttribute("usuario logado") == null){
	%> <div class="container"><%
		response.sendRedirect("../index.jsp");
	%></div><%
}
%>
