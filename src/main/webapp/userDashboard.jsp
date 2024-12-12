<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%-- <%

    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

%> --%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel do Usuário</title>
    <link rel="stylesheet" href="css/userDashborad.css">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img class="icon" src="img/iconUserPanel.png" alt="Ícone do usuário"> <!-- Ícone -->
            Painel do Usuário
        </a>
            <div class="navbar-nav">
                <a class="nav-link" href="#">Home</a>
                <a class="nav-link" href="#">Ajuda</a>
                <a class="nav-link" href="#">Perfil</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <!-- Título "Bem-vindo" -->
        <h2>Bem-vindo, <% String username = (String) session.getAttribute("username"); if (username != null) out.print(username); else out.print("Visitante"); %>!</h2>

        <!-- Contêiner dos botões -->
        <div class="button-container">
            <div class="button-box">
                <img src="img/alugarEspaco.avif" alt="Alugar Espaço">
                <a href="alugarespaco.jsp" class="btn">Alugar Espaço</a>
            </div>
            <div class="button-box">
                <img src="img\editarAluguel.jpg" alt="Editar Aluguel">
                <a href="editarAluguel.jsp" class="btn">Editar Aluguel</a>
            </div>
            <div class="button-box">
                <img src="img\consultarAluguel.jpg" alt="Consultar Alugueis">
                <a href="consultarAluguel.jsp" class="btn">Consultar Aluguéis</a>
            </div>
        </div>

        <!-- Botão de Sair -->
        <div class="logout-container">
            <form action="logout.jsp" method="POST">
               <a href="login.jsp?action=logout" class="btn_sair">Sair</a><br>
            </form>
        </div>
    </div>

    <%-- <%
         out.println(username);
    %> --%>
</body>
</html>
