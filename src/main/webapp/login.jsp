<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Natureza Viva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <img id="icone" src="images/icone.png" alt="Logotipo da ONG Natureza Viva">
            <a class="navbar-brand" href="#">Natureza Viva</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="contatos.jsp">Contatos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Projetos</a></li>
                    <li class="nav-item"><a class="nav-link" href="sobrenos.jsp">Sobre nós</a></li>
                </ul>
                
            <div class="navbar-login">
                <button class="btnNav-login" onclick="location.href='#'">Login</button>
            </div>
            </div>
        </div>
    </nav>
    <div class="entre">
        <h1 id="titulo">Entre</h1>
        <img id="seta" src="images/arrow-right.svg" alt="Seta">
    </div>
    <div class="content">
        <div class="login-box">
            
            <div class="button-group">
                <button class="btn btn-custom">Login</button>
                <button class="btn btn-custom">Cadastre-se</button>
            </div>
            <form method="POST" action="loginProcess.jsp" class="forms-dados">
                <label for="nome">Nome</label>
                <input type="text" id="nome_login" name="nome_login" class="form-control" placeholder="Digite seu nome">
                <label for="senha">Senha</label>
                <input type="password" id="senha_login" name="senha_login" class="form-control" placeholder="Digite sua senha">
                <button type="submit" class="btn-login">Entrar</button>
            </form>

        </div>

    <div id="signup-form" style="display: none;">
        <form action="CadastroServlet" method="POST">
            <label for="nome">Nome</label>
            <input type="text" id="nome" name="nome" class="form-control" placeholder="Nome:" required>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Email:" required>
            
            <label for="senha">Senha</label>
            <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha:" required>
            
            <label for="escolha">Escolha:</label>
            <select id="escolha" name="escolha" class="form-control" required>
                <option value="" disabled selected>Cadastre como:</option>
                <option value="Administrador">Administrador</option>
                <option value="Usuário">Usuário</option>
                <option value="Ong">Ong</option>
            </select>
            
            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" class="form-control" placeholder="CPF" required>
            
            <div class="button-group">
                <button class="btn-login" type="submit">Cadastrar</button>
            </div>
        </form>
    </div>
            </div>
            </div>
    </div>

            <div class="carousel-container">
            <div class="carousel">
                <img src="images/imagePassaro.png" alt="Imagem de passaro" />
                <img src="images/imagePlanta.png" alt="Imagem de planta" />
            </div>
        <div class="disparo"></div>
    </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="js/script.js"></script>
    </body>

        <%

            // if(request.getMethod().equals("POST")){

            //     String nome = request.getParameter("nome_login");
            //     String senha = request.getParameter("senha_login");
            //     try {
            //         PreparedStatement statement = conexao.prepareStatement("SELECT nome, senha, tipo_usuario FROM usuarios WHERE nome = ? AND senha = ?");
            //         statement.setString(1, nome); 
            //         statement.setString(2, senha); 
            //         ResultSet listar = statement.executeQuery();
            //         out.println(nome);
            //         if (listar.next()) {
                        
            //             String nomeDb = listar.getString("nome");
            //             String senhaDb = listar.getString("senha");
            //             String user = listar.getString("tipo_usuario");
            //             if (nomeDb.equals(nome) && senhaDb.equals(senha)) {
            //                 session.setAttribute("username", nome);
            //                 if(user.equals("usuario")){
            //                     response.sendRedirect("userDashboard.jsp");
            //                 }else if(senhaDb.equals("123456")){
            //                     response.sendRedirect("trocarSenha.jsp");
            //                 }else{
            //                     response.sendRedirect("adminDashboard.jsp");
            //                 }
            //             } else {
            //                 out.println("Usuário ou senha incorretos"); 
            //             }
            //         } else {
            //             out.println("Usuário não encontrado"); 
            //         }
            //     } catch (SQLException e) {
            //         e.printStackTrace();
            //         out.println("Erro ao acessar o banco de dados");
            //     }
            // }
        %>
</html>
