<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Natureza Viva</title>
    <!-- Importando o CSS externo -->
    <link href="../webapp/css/home.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo" href="index.jsp">🌱 Natureza Viva</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="contatos.jsp">Contatos</a></li>
                        <li class="nav-item"><a class="nav-link" href="sobrenos.jsp">Sobre nós</a></li>
                        <c:if test="${not empty sessionScope.usuario}">
                            <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                        </c:if>
                        <c:if test="${empty sessionScope.usuario}">
                            <li class="nav-item"><a class="btn btn-outline-success" href="login.jsp">Login</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <c:if test="${not empty sessionScope.usuario}">
            <h2>Bem-vindo, ${sessionScope.usuario}!</h2>
            <p>Escolha uma das opções abaixo para continuar:</p>
            <div class="row">
                <div class="col-md-6">
                    <a href="novoAgendamento.jsp" class="btn btn-success btn-lg">Agendar um Espaço</a>
                </div>
                <div class="col-md-6">
                    <a href="meusAgendamentos.jsp" class="btn btn-primary btn-lg">Ver Meus Agendamentos</a>
                </div>
            </div>
        </c:if>

        <c:if test="${empty sessionScope.usuario}">
            <h2>Você não está logado. Por favor, <a href="login.jsp">faça login</a>.</h2>
        </c:if>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
