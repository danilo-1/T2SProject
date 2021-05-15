
<%@ page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>

<%  if(session.getAttribute("conteinere") != null){
String b = (String)session.getAttribute("conteinere");
String nomezin = (String)session.getAttribute("usunome");
%>

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
<title>Movimentação do conteiner</title>
</head>
<%
	
	%>
<body>
<div class="container">
<form action="database.jsp" id="titulo"><button class="btn btn-dark" >Voltar</button></form>
				<div  class="form-floating mb-3">
					<form action="login_cadastro/cadmove.jsp" method="POST">
						
						<label class="form-label">Selecione o tipo de movimentação:</label>
							<select name="moviTp" required class="form-select" aria-label="Default select example" >
								<option value="Embarque">Embarque</option>
								<option value="Descarga">Descarga</option>
								<option value="GateIn">Gate In</option>
								<option value="GateOut">Gate Out</option>
								<option value="Posicionamento Pilha">Posicionamento Pilha</option>
								<option value="Pesagem">Pesagem</option>
								<option value="Scanner">Scanner</option>
							</select>
						<label class="form-label">Data e hora do inicio:</label>
						<input type="date" required class="form-select" name="timein">
						<input type="time" required class="form-select" name="timein2">
						
						<label class="form-label">Data e hora do fim:</label>
						<input type="date" required class="form-select" name="timeout">
						<input type="time" required class="form-select" name="timeout2">
						<input type="text" name="conteiner" value="<%= b %>" hidden>
						<input type="number" name="idcon" hidden>
						
						<input type="submit" name="criar" value="criar" class="btn btn-dark">
					</form>
				</div>
			<%
			
			
			String url = "jdbc:postgresql://172.31.6.157:5432/DBT2SProject"; 
			String username = "postgres";  
			String password = "root";  
	 		try{
			   Connection con = DriverManager.getConnection( url, username, password );
				
				
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM movimentacao where num_conteiner = ? ");
			stmt.setString(1, b);
			ResultSet rs = stmt.executeQuery();
			%><table id="conteiner" class="table table-striped table-sm" >
			<thead><tr>
				<th>Nome do conteiner</th>
				<th>ID</th>
				<th>Movimentação</th>
				<th>Data inicio</th>
				<th>Data fim</th>
				<th></th>
				<th></th>
				</tr>
			</thead>
			<tbody>
			<%
					
			while(rs.next()){
				%><tr>
				<td><%out.println(nomezin);%></td>
				<td><%out.println(rs.getString("id_movimentacao"));%></td><%
				%><td><%out.println(rs.getString("type_movimentacao"));%></td><%
				%><td><%out.println(rs.getString("dt_inicio"));%></td><%
				%><td><%out.println(rs.getString("dt_fim"));%></td>
				
				<%int id = rs.getInt("id_movimentacao");%>
				<%String tp = rs.getString("type_movimentacao"); %>
				<%String ti = rs.getString("dt_inicio"); %>
				<%String tf = rs.getString("dt_fim"); %>
				<%String conte = rs.getString("num_conteiner"); %>
				
				<td><form action="login_cadastro/edita.jsp" method="POST">
				
				<input type="number" name="id3" value="<%= id%>" hidden>
				<input type="text" name="moviTp" value="<%= tp %>" hidden>
				<input type="text" name="conteiner" value="<%= conte %>" hidden>
				<button type="submit" name="moved" class="btn btn-primary">Editar</button>		
				</form></td>
				<td><form action="login_cadastro/cadmove.jsp">
				<button type="submit" name="remove" value="<%= id %>" class="btn btn-primary">Remover</button>
				</form></td></tr><%}%>
				</tbody>
				</table>
				<br>
				<br>
				
				
				<%
			rs.close(); stmt.close(); con.close(); 
	 		}
			 catch(SQLException e){
				 out.println("Erro em conectar o Database: " + e);
				 e.printStackTrace();
			 }
			%>
</div>
<%@ include file="WEB-INF/lib/footer.jsp" %>
</body>
<%} %>
</html>