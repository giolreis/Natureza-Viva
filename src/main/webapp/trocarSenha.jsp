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
                <button class="btnNav-login" onclick="location.href='login.jsp'">Login</button>
            </div>
            </div>
        </div>
    </nav>
    <div class="entre">
    <h3>Alterar Senha Padrão/h3>
    </div>
    <div class="content">
        <div class="login-box">
            <form method="POST">
                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha:" required>

                <%-- <label for="confirmacao">Confirmação Senha</label>
                <input type="password" id="confirmacao" name="confirmacao" class="form-control" placeholder="Senha:" required> --%>

                <div class="button-group">
                    <button class="btn-login" type="submit">Alterar</button>
                </div>
            </form>
        </div>
    </div>

    </body>

        <%
            // out.print(session.getAttribute("id"));
            if(request.getMethod().equals("POST")){
                if(session.getAttribute("id") != null){

                    int id = (int) session.getAttribute("id");
                    String senha = request.getParameter("senha");
                    // String confirmacao = request.getParameter("confirmacao");

                    // out.print(confirmacao.trim().equals(senha.trim()));

                    // if(confirmacao.equals(senha)){

                        try {

                            String updateSQL = "UPDATE usuarios SET senha = ? WHERE id = ?";
                            PreparedStatement stmtUpdate = conexao.prepareStatement(updateSQL);
                            stmtUpdate.setString(1, senha);
                            stmtUpdate.setInt(2, id);
                            stmtUpdate.executeUpdate();
                            out.println("<div class='alert alert-success'>Senha alterada com sucesso!</div>");

                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("Erro ao acessar o banco de dados");
                        }
                    // }else{
                    //     out.print("As senhas devem ser iguais");
                    // }
                }
            }
        %>
</html>
