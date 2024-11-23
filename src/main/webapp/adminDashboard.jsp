<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Funções de cadastro de espaço, agendamento e consulta de agendamentos
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel de Administração</title>
</head>
<body>
    <h2>Bem-vindo, Administrador!</h2>
    <p>O que você gostaria de fazer?</p>
    
    <ul>
        <li><a href="cadastrarEspaco.jsp">Cadastrar Espaços</a></li>
        <li><a href="cadastrarAgendamento.jsp">Cadastrar Agendamento</a></li>
        <li><a href="consultarAgendamentos.jsp">Consultar Agendamentos</a></li>
        <li><a href="alterarExcluirEspaco.jsp">Alterar ou Excluir Espaços</a></li>
    </ul>

    <form action="logout.jsp" method="POST">
        <button type="submit">Sair</button>
    </form>
</body>
</html>
