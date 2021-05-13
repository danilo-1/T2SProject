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
	<form form action="cadcon.jsp">
            <label>Número do conteiner:</label>
            <br>
            <input type="text" id="numCon" name="conteinerId" maxlength="11" value="<%= request.getParameter("nume") %>" size="25" pattern="[A-Za-z]{4}-[0-9]{7}{11}" required>
            <br>
            <label>Tipo do conteiner:</label>
            <br>
            <select name="conteinerTp" required>
                <option value="<%= request.getParameter("tipo") %>" selected><%= request.getParameter("tipo") %></option>
                <option value="20">20</option>
                <option value="40">40</option>
            </select>
            <br>
            <label>Status do conteiner:</label>
            <br>
            <select name="conteinerSt" required>
                <option value="<%= request.getParameter("status") %>" selected><%= request.getParameter("status") %></option>
                <option value="Cheio">Cheio</option>
                <option value="Vazio">Vazio</option>
            </select>
            <br>
            <label>Categoria do conteiner:</label>
            <br>
            <select name="conteinerCate" required>
                <option value="<%= request.getParameter("cate") %>" selected><%= request.getParameter("cate") %></option>
                <option value="Exportação">Exportação</option>
                <option value="Importação">Importação</option>
            </select>
            <br>
            <input  type="number" name="num" hidden value="<%=request.getParameter("editar")%>">
            <br>
            <input type="submit" name="fazer" value="editar">
        </form>

</div>
</body>
</html>
