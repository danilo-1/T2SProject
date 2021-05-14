<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="validação/favicon.ico" />
<title>Login</title>
</head>
<body>
<div class="container">

<%if (request.getParameter("editar") != null){ %>
<h3><a href="../database.jsp">Voltar</a></h3>
	<form form action="cadcon.jsp" method="POST">
            <div class="mb-3"><label>Número do conteiner:</label>
            <br>
            <input type="text" id="numCon" name="conteinerId" maxlength="11" value="<%= request.getParameter("nume") %>" size="25" pattern="[A-Za-z]{4}-[0-9]{7}{11}" required></div>
            <br>
            <div class="mb-3"><label>Tipo do conteiner:</label>
            <br>
            <select name="conteinerTp" required>
                <option value="<%= request.getParameter("tipo") %>" selected><%= request.getParameter("tipo") %></option>
                <option value="20">20</option>
                <option value="40">40</option>
            </select></div>
            <br>
            <div class="mb-3"><label>Status do conteiner:</label>
            <br>
            <select name="conteinerSt" required>
                <option value="<%= request.getParameter("status") %>" selected><%= request.getParameter("status") %></option>
                <option value="Cheio">Cheio</option>
                <option value="Vazio">Vazio</option>
            </select></div>
            <br>
            <div class="mb-3"><label>Categoria do conteiner:</label>
            <br>
            <select name="conteinerCate" required>
                <option value="<%= request.getParameter("cate") %>" selected><%= request.getParameter("cate") %></option>
                <option value="Exportação">Exportação</option>
                <option value="Importação">Importação</option>
            </select></div>
            <br>
            <input  type="number" name="num" hidden value="<%=request.getParameter("editar")%>">
            <br>
            <input type="submit" name="fazer" value="editar" class="btn btn-dark">
        </form>
<%}
if (request.getParameter("moved") != null){%>
<h3><a href="../movimentacao.jsp">Voltar</a></h3>
	<form action="cadmove.jsp" method="POST">
		<input type="number" name="id2" value="<%= request.getParameter("id3") %>" hidden >
		<div class="mb-3"><label>Selecione o tipo de movimentação:</label>
			<select name="moviTp" >
				<option value="<%= request.getParameter("moviTp") %>"> <%= request.getParameter("moviTp") %> </option>
				<option value="Embarque">Embarque</option>
				<option value="Descarga">Descarga</option>
				<option value="Gate In">Gate In</option>
				<option value="Gate Out">Gate Out</option>
				<option value="Posicionamento Pilha">Posicionamento Pilha</option>
				<option value="Pesagem">Pesagem</option>
				<option value="Scanner">Scanner</option>
			</select></div>
			<div class="mb-3"><label>Data e hora do inicio:</label>
				<input type="date" name="timein">
				<input type="time" name="timein2"></div>
			<div class="mb-3"><label>Data e hora do fim:</label>
				<input type="date" name="timeout">
				<input type="time" name="timeout2"></div>
		<input type="text" name="conteiner" value="<%= request.getParameter("conteiner") %>" hidden>
		<input type="submit" name="movedit" class="btn btn-dark">
	</form>
<%} %>
</div>
</body>
</html>
