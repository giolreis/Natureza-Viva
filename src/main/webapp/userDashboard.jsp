<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%

    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel do Usuário</title>
</head>
<body>
    <h2>Bem-vindo, usuário!</h2>
    <p>O que você gostaria de fazer?</p>
    
    <ul>
        <li><a href="cadastrarAluguel.jsp">alugar Espaço</a></li>
        <li><a href="EditarAluguel.jsp">Editar aluguel</a></li>
        <li><a href="consultarAgendamentosUsuario.jsp">Consultar alugueis</a></li>
    </ul>

    <form action="logout.jsp" method="POST">
        <button type="submit">Sair</button>
    </form>

    <%-- <%
         out.println(username);
    %> --%>
</body>
</html>
