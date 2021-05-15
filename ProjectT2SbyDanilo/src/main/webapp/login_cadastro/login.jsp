<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="../valida��o/favicon.ico" />
<title>Login</title>
</head>
<body>
<div class="container">
<form action="../index.jsp"><button class="btn btn-dark" >Voltar</button></form>

<h3><%if(session.getAttribute("cadastrado") != null){
out.println("usu�rio cadastrado com sucesso!");
}%></h3>
<form action="../valida��o/loginV.jsp" method="POST">
	<div class="mb-3">
	    <label for="email" class="form-label">Endere�o de email</label>
	    <input type="email" required class="form-control" id="email" aria-describedby="emailHelp" name="username">
	    <div id="emailHelp" class="form-text"> entre com seu endere�o para acessar seus cont�ineres</div>
  </div>
  <div class="mb-3">
	    <label for="senha" class="form-label">Senha</label>
	    <input type="password" required class="form-control" id="senha" name="password">
  </div>
  <button type="submit" class="btn btn-primary" name="logar">Login</button>
</form>
<h3>n�o tem o cadastro? <a href="cadastro.jsp">Cadastre-se j�!</a></h3>
</div>
</body>
</html>

  