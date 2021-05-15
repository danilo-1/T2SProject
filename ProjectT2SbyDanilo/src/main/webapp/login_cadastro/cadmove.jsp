<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="../validação/favicon.ico" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css">
            
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
            <script type="text/Javascript" language="javascript">
                $(document).ready(function () {
                        $('#conteiner').DataTable({
                             "language": {
                                 "lengthMenu": "Mostrando _MENU_ registros por página",
                                 "zeroRecords": "Nada encontrado",
                                 "info": "Mostrando página _PAGE_ de _PAGES_",
                                 "infoEmpty": "Nenhum registro disponível",
                                 "infoFiltered": "(filtrado de from _MAX_ registros no total)"
                            }
                      });
                   });                  
            </script>
<title>Relatório de Movimentação</title>
</head>
<body>


<%
 String c = (String)session.getAttribute("email");
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
				
				PreparedStatement stmt = con.prepareStatement("INSERT INTO movimentacao VALUES (?, ?, ?, ?, ?)");
				stmt.setString(1, tip);
				stmt.setString(2, conteiner);
				stmt.setTimestamp(3, Timestamp.valueOf(ti + " " + ti2 + ":00"));
				stmt.setTimestamp(4, Timestamp.valueOf( tf + " " + tf2 + ":00"));
				stmt.setString(5, c);
				
				
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
			if(request.getParameter("relatorio") != null){
				
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM movimentacao where email = ? ");
				stmt.setString(1, c);
				ResultSet rs = stmt.executeQuery();
				%><form action="../database.jsp"><button class="btn btn-dark" >Voltar</button></form>
				<table id="conteiner" class="table table-striped table-sm" >
					<thead>
						<tr>
							<th>ID</th>
							<th>N° contêiner</th>
							<th>Movimentação</th>
							<th>Data inicio</th>
							<th>Data fim</th>
						</tr>
					</thead>
					<tbody>
					<%
							
					while(rs.next()){
						%><tr>
						
							<td><%out.println(rs.getString("id_movimentacao"));%></td>
							<td><%out.println(rs.getString("num_conteiner"));%></td><%
							%><td><%out.println(rs.getString("type_movimentacao"));%></td><%
							%><td><%out.println(rs.getString("dt_inicio"));%></td><%
							%><td><%out.println(rs.getString("dt_fim"));%></td>
						</tr>
			<%}%></tbody><% 
				stmt.close(); con.close(); 	  
			} }
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
</body>
</html>