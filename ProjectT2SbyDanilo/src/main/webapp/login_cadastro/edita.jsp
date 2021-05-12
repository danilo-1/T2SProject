<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<title>Login</title>
</head>
<body>
<div class="container">
<h3><a href="../database.jsp">Voltar</a></h3>
	<form action="cadcon.jsp"><style>ca{text-transform: uppercase !important;}</style>
		<input type="text" id="ca" placeholder="AAAA1234567" name="conteinerId">
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
		<input  type="number" name="num" hidden value="<%=request.getParameter("editar")%>">
		<input type="submit" name="fazer" value="editar">
	</form>	

</div>
</body>
</html>