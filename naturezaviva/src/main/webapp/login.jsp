<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Natureza Viva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="container my-5">
        <h2 class="text-center text-success mb-4">Login</h2>

        <form action="loginProcess.jsp" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Usuário</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Digite seu nome de usuário" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Senha</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Digite sua senha" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Entrar</button>
        </form>

        <div class="mt-3 text-center">
            <p>Não tem uma conta? <a href="cadastro.jsp">Crie uma conta</a></p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
    <%@ include file="footer.jsp" %>
</html>
