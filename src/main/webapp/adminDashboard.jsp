<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel do Administrador</title>
    <link rel="stylesheet" href="../webapp/css/userDashborad.css">
</head>
<%@ include file="navbar.jsp" %>
<body>
  
    <div class="container">
        <!-- Título "Bem-vindo" -->
        <h2>Bem-vindo, 
            <% 
                // Declaração da variável username
                String userName = (String) session.getAttribute("userName"); 
                if (userName != null) { 
                    out.print(userName); 
                } else { 
                    out.print("Visitante"); 
                }
            %>!
        </h2>

        <!-- Contêiner dos botões -->
        <div class="button-container">
            <div class="button-box">
                <img src="img/alugarEspaco.avif" alt="Alugar Espaço">
                <a href="cadastrarEspaco.jsp" class="btn">Cadastrar Espaços</a>
            </div>
            <div class="button-box">
                <img src="img\editarAluguel.jpg" alt="Editar Aluguel">
                <a href="cadastroAgendamento.jsp" class="btn">Cadastrar Agendamentos</a>
            </div>
            <div class="button-box">
                <img src="img\consultarAluguel.jpg" alt="Consultar Alugueis">
                <a href="excluirAgendamento.jsp" class="btn">Excluir Agendamentos</a>
            </div>
            <div class="button-box">
                <img src="img\consultarAluguel.jpg" alt="Consultar Alugueis">
                <a href="consultarAgendamentos.jsp" class="btn">Consultar Agendamentos por Mês</a>
            </div>
            <div class="button-box">
                <img src="img\consultarAluguel.jpg" alt="Consultar Alugueis">
                <a href="consultarAgendamentosEspaco.jsp" class="btn">Consultar Agendamentos por Espaço</a>
            </div>
            <div class="button-box">
                <img src="img\consultarAluguel.jpg" alt="Consultar Alugueis">
                <a href="alterarExcluirEspaco.jsp" class="btn">Alterar ou Excluir Espaços</a>
            </div>
            <div class="button-box">
                <img src="img\consultarAluguel.jpg" alt="Consultar Alugueis">
                <a href="confirmarAgendamento.jsp" class="btn">Confirmar Agendamento</a>
            </div>
        </div>

    </div>

</body>
<%@ include file="footer.jsp" %>
</html>
