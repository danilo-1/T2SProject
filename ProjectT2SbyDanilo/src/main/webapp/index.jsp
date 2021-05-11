<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<title>HOME-BDT2S</title>
</head>
<body >
<div class="container">

<%@ include file="WEB-INF/lib/header.jspf" %>

<div id="app"><h1>{{ inicio }}</h1></div>
<br>
<br>
<div >
	<h2>Bem vindo à BDT2S!</h2>
	<p> comece ainda hoje movimentando seu conteiner, acesse o login ou cadastre-se!</p>
</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="implementacao.js"></script>
</body>
</html>