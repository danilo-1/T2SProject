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
<h3><a href="../index.jsp">Voltar</a></h3>
<h3><%if(session.getAttribute("cadastrado") != null){
out.println("usuário cadastrado com sucesso!");
}%></h3>
<form action="../validação/loginV.jsp">
	<div class="mb-3">
	    <label for="email" class="form-label">Endereço de email</label>
	    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="username">
	    <div id="emailHelp" class="form-text"> entre com seu endereço para acessar seus contêineres</div>
  </div>
  <div class="mb-3">
	    <label for="senha" class="form-label">Senha</label>
	    <input type="password" class="form-control" id="senha" name="password">
  </div>
  <button type="submit" class="btn btn-primary" name="logar">Login</button>
</form>
<h3>não tem o cadastro? <a href="cadastro.jsp">Cadastre-se já!</a></h3>
</div>
</body>
</html>

  