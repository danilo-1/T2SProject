<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="valida??o/favicon.ico" />
<title>Sobre n?s-BDT2S</title>
</head>
<body>
<div class="container">
<%@ include file="WEB-INF/lib/header.jspf" %>

<h1 id="titulo">sobre</h1>
<br>
<br>
<div>
	<h2>Hist?rico de Releases</h2>
	<br>
	<br>
	<div>
		<h3>V1.1- BDT2S</h3>
		<br>
		<h4>Descri??o da vers?o</h4>
		<br>
		<p>Corre??es de bugs e op??o de gerenciamento ? p?gina de movimenta??o, seguran?a atualizada<br>
		com um layout mais amig?vel e simples, para foco na gest?o.</p>
		<br>
		<h4>Implementa??es</h4>
		<br>
		<p>- "P?gina movimenta??es"<br>
		- P?gina de editar movimenta??es.<br>
		- layout modificado com recursos adicionais.</p>
	</div>
	<br>
	<br>
	<div>
		<h3>V1.0- BDT2S</h3>
		<br>
		<h4>Descri??o da vers?o</h4>
		<br>
		<p> Sistema conectado com o banco de dados e fixado com o github para o servidor,<br>
		acesso ao login e cadastro de usu?rio, p?gina simples definindo a pagina conteiner<br>
		como "home" de usu?rio </p>
		<br>
		<h4>Implementa??es</h4>
		<br>
		<p>- "P?gina principal"<br>
		- P?gina "Sobre" e Hist?rico de Releases<br>
		- Login e Cadastro configurado com o Banco de Dados <br>
		- p?gina dos cont?iners do usu?rio </p>
	</div>
</div>
</div>
<%@ include file="WEB-INF/lib/footer.jsp" %>
</body>
</html>