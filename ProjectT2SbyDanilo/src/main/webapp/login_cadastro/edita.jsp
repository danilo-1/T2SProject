<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="shortcut icon" href="../valida??o/favicon.ico" />
<title>Login</title>
</head>
<body>

<div class="container">

<%if (request.getParameter("editar") != null){ %>
<form action="../database.jsp"><button class="btn btn-dark" >Voltar</button></form>
<h4 id="titulo">inserir os valores</h4>
<div class="form-floating mb-3">
		<form form action="cadcon.jsp" method="POST">
	
		<label class="form-label">Nome do conteiner:</label>
            
            <input type="text" class="form-control" name="oco" value="<%= request.getParameter("nm") %>" >
        <label class="form-label">N?mero do conteiner:</label><br>
            <input type="text" required id="numCon" class="form-control" name="conteinerId" maxlength="11" value="<%= request.getParameter("nume") %>" size="25" pattern="[A-Za-z]{4}-[0-9]{7}{11}" required>
           
        <label class="form-label">Tipo do conteiner:</label><br>
            <select name="conteinerTp" required class="form-select" aria-label="Default select example">
                <option value="<%= request.getParameter("tipo") %>" selected><%= request.getParameter("tipo") %></option>
                <option value="20">20</option>
                <option value="40">40</option>
            </select>
      
        <label class="form-label">Status do conteiner:</label><br>
            <select name="conteinerSt" required class="form-select" aria-label="Default select example">
                <option value="<%= request.getParameter("status") %>" selected><%= request.getParameter("status") %></option>
                <option value="Cheio">Cheio</option>
                <option value="Vazio">Vazio</option>
            </select>
     
        <label class="form-label">Categoria do conteiner:</label><br>
            <select name="conteinerCate" required class="form-select" aria-label="Default select example">
                <option value="<%= request.getParameter("cate") %>" selected><%= request.getParameter("cate") %></option>
                <option value="Exporta??o">Exporta??o</option>
                <option value="Importa??o">Importa??o</option>
            </select>
     
            <input  type="number" name="num" hidden value="<%=request.getParameter("editar")%>">
         
            <input type="submit" name="fazer" value="editar" class="btn btn-dark">
        </form>
</div>
<%}
if (request.getParameter("moved") != null){%>
<form action="../movimentacao.jsp"><button class="btn btn-dark" >Voltar</button></form>
<h4 id="titulo">inserir os valores</h4>
	<form action="cadmove.jsp" method="POST">
		<input type="number" class="form-select" name="id2" value="<%= request.getParameter("id3") %>" hidden >
		<div class="mb-3"><label class="form-label" >Selecione o tipo de movimenta??o:</label>
			<select name="moviTp" class="form-select" required aria-label="Default select example" >
				<option value="<%= request.getParameter("moviTp") %>"> <%= request.getParameter("moviTp") %> </option>
				<option value="Embarque">Embarque</option>
				<option value="Descarga">Descarga</option>
				<option value="Gate In">Gate In</option>
				<option value="Gate Out">Gate Out</option>
				<option value="Posicionamento Pilha">Posicionamento Pilha</option>
				<option value="Pesagem">Pesagem</option>
				<option value="Scanner">Scanner</option>
			</select>
			<label class="form-label">Data e hora do inicio:</label>
				<input type="date" class="form-select" required name="timein">
				<input type="time" class="form-select" required name="timein2">
			<label class="form-label">Data e hora do fim:</label>
				<input type="date" class="form-select" required name="timeout">
				<input type="time" class="form-select" required name="timeout2">
		<input type="text" name="conteiner" value="<%= request.getParameter("conteiner") %>" hidden>
		<input type="submit" name="movedit" class="btn btn-dark">
	</div></form>
<%} %>
</div>
<%@ include file="../WEB-INF/lib/footer.jsp" %>
</body>
</html>
