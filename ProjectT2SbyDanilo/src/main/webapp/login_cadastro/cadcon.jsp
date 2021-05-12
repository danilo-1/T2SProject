<%@ page language="java" contentType="text/html"%>
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
					
			if(request.getParameter("criar") != null){
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
			if(request.getParameter("fazer") != null){
				int num = Integer.parseInt(request.getParameter("num"));
				PreparedStatement stmt = con.prepareStatement("UPDATE conteiner SET num_conteiner = ?, tipo_conteiner=?, status_conteiner=?, categoria=? WHERE id_conteiner=?;");
				stmt.setString(1, id);
				stmt.setString(2, tp);
				stmt.setString(3, st);
				stmt.setString(4, cate);
				stmt.setInt(5, num);
					
			 
				//String sql = "SELECT * FROM contato where email = " + user;
				
				
				int rs = stmt.executeUpdate();
			    if( rs > 0) {
			        response.sendRedirect("../database.jsp");
			    }
				 stmt.close(); con.close(); 
			 }
			if(request.getParameter("remove")!= null){
				out.println(" entrou caralho ");
				int idc = Integer.parseInt(request.getParameter("remove"));
				PreparedStatement stmt = con.prepareStatement("DELETE FROM conteiner WHERE id_conteiner = ?;");
				stmt.setInt(1, idc);
				
				int rs = stmt.executeUpdate();
			    if( rs > 0) {
			        response.sendRedirect("../database.jsp");
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
