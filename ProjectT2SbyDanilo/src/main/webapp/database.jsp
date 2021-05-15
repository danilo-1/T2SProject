<%@ page language="java" contentType="text/html"%>
 <%@page import="java.sql.*"%> 



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="validação/favicon.ico" />
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
<title>Database-BDT2S</title>
</head>
<%if(session.getAttribute("usuario logado") != null){
	
%>
	<body>
		<div class="container">
			<%@include file="WEB-INF/lib/header.jspf" %>
			<h1 ID="titulo">Contêineres <%= session.getAttribute("username") %></h1>
				<div  class="form-floating mb-3">
					<form action="login_cadastro/cadcon.jsp" id="app" method="POST">
						<label class="form-label">Nome do Contêiner</label><br><input type="text" required class="form-control" name="oco"><br>
						<label class="form-label">N° do Contêiner</label><br><input type="text" required class="form-control" placeholder="AAAA1234567" name="conteinerId" maxlength="11" style="text-transform: uppercase !important;"><br>
						<label class="form-label">Tipo</label><br><select name="conteinerTp" required class="form-select" aria-label="Default select example">
							<option value="20">20</option>
							<option value="40">40</option>
						</select>
						<label class="form-label">Status</label><br><select name="conteinerSt" required class="form-select" aria-label="Default select example">
							<option value="cheio">cheio</option>
							<option value="vazio">vazio</option>
						</select>
						<label class="form-label">Categoria</label><br><select name="conteinerCate" required class="form-select" aria-label="Default select example">
							<option value="importacao">importação</option>
							<option value="exportacao">exportação</option>
						</select>
						<br>
						<input type="submit" name="criar" value="criar" class="btn btn-dark">
					</form>
				</div>	
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
				<table id="conteiner" class="table table-striped table-sm">
					<thead><tr>
					<th>Nome do contêiner</th>
					<th>N° do contêiner</th>
					<th>Tipo</th>
					<th>Status</th>
					<th>Categoria</th>
					<th>ID</th>
					<th></th>
					<th></th>
					<th></th>
					</tr>
					</thead>
					<tbody>
					<%
				while(rs.next()){
					%><tr><% 
						%><td><%out.println(rs.getString("nm_cliente"));%></td><%
						%><td><%out.println(rs.getString("num_conteiner"));%></td><%
						%><td><%out.println(rs.getString("tipo_conteiner"));%></td><%
						%><td><%out.println(rs.getString("status_conteiner"));%></td><%
						%><td><%out.println(rs.getString("categoria"));%></td><%
						%><td><%out.println(rs.getString("id_conteiner"));%></td>
						<%int idC2 = rs.getInt("id_conteiner");%>
						<%String num = rs.getString("num_conteiner"); %>
						<%String tipo = rs.getString("tipo_conteiner"); %>
						<%String status = rs.getString("status_conteiner"); %>
						<%String cate = rs.getString("categoria"); %>
						<%String nome = rs.getString("nm_cliente"); %>
						
					<div class="btn-group" role="group" aria-label="Basic example">	
						
					
					<td><form action="validação/loginV.jsp" method="POST">
					
					<input type="text" name="nume" hidden value="<%= num %>">
					<input type="text" name="noconter" hidden value="<%= nome %>">
					<button type="submit" name="movi" class="btn btn-primary">acessar</button></form></td>				
					<td>
					<form action="login_cadastro/edita.jsp" method="POST">
					<input type="text" name="nm" value="<%= nome%>" hidden>
					<input type="text" name="nume" hidden value="<%= num %>">
					<input type="text" name="tipo" hidden value="<%= tipo %>">
					<input type="text" name="status" hidden value="<%= status %>">
					<input type="text" name="cate" hidden value="<%= cate %>">
					<button type="submit" name="editar" value="<%= idC2%>" class="btn btn-primary">editar</button></form></td>
					<td><form action="login_cadastro/cadcon.jsp" method="POST">
					
					<button type="submit" name="remove" value="<%= idC2%>" class="btn btn-primary">remove</button></form>
					</div>	</td>
					</tr><%} %></tbody></table>
					<form action="login_cadastro/cadmove.jsp">
					
				<button type="submit" name="relatorio" class="btn btn-primary">Gerar relatório</button> 
				</form>
			</div><%
			rs.close(); stmt.close(); con.close(); 
			 }
			 catch(SQLException e){
				 out.println("Erro em conectar o Database: " + e);
				 e.printStackTrace();
			 }%>
			 	
		</div>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<%@ include file="WEB-INF/lib/footer.jsp" %>
	</body>
	</html>
<%}
if(session.getAttribute("usuario logado") == null){
	%> <div class="container">
	<h3><a href="index.jsp">Voltar</a></h3>
	<%
		
		out.println("ACESSO NEGADO: por favor, entre com um login ou cadastre-se para ter acesso ao conteúdo da página");
	
	%></div><%
}
%>

	