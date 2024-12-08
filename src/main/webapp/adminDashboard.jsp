<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%-- <%

    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Funções de cadastro de espaço, agendamento e consulta de agendamentos
%> --%>
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
        <li><a href="cadastroAgendamento.jsp">Cadastrar Agendamento</a></li>
        <li><a href="consultarAgendamentos.jsp">Consultar Agendamentos por Mês</a></li>
        <li><a href="consultarAgendamentosEspaco.jsp">Consultar Agendamentos por Espaço</a></li>
        <li><a href="alterarExcluirEspaco.jsp">Alterar ou Excluir Espaços</a></li>
        <li><a href="confirmarAgendamento.jsp">Confirmar Agendamento</a></li>
    </ul>

    <form action="logout.jsp" method="POST">
        <%-- <a href ="login.jsp" class="btn_sair">  <% session.invalidate(); %>Sair</button> --%>
    </form>

    <%-- <%
         out.println(username);
    %> --%>
</body>
</html>
