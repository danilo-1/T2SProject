<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="validação/favicon.ico" />
<title>Cadastro</title>
</head>
<body class="container">
<div class="container">
<h3><a href="../index.jsp">Voltar</a></h3>
<form action="../validação/cadastroV.jsp" method="post">
<div class="mb-3">
    <label for="name" class="form-label">Nome do usuário</label>
    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name">
    <div id="emailHelp" class="form-text"> Por favor, insira seu primeiro nome</div>
  </div>
  <div class="mb-3">
    <label for="email" class="form-label">Endereço de email</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="username">
    <div id="emailHelp" class="form-text"> Adicione seu cadastro usando um email, exemplo: Email@example.com</div>
  </div>
  <div class="mb-3">
    <label for="senha" class="form-label">Senha</label>
    <input type="password" class="form-control" id="senha" name="password">
  </div>
  
  <button type="submit" class="btn btn-primary" name="cadastrar">Cadastrar</button>
</form>
</div>
</body>
</html>


