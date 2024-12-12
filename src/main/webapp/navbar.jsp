
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="header">
    <head>
        <link rel="stylesheet" href="../webapp/css/navbar.css">
    </head>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand logo" href="index.jsp">🌱 Natureza Viva</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Início</a></li>
                    <li class="nav-item"><a class="nav-link" href="contatos.jsp">Contatos</a></li>
                    <li class="nav-item"><a class="nav-link" href="sobrenos.jsp">Sobre nós</a></li>
                    
                    <% 
                    String username = (String) session.getAttribute("username");
                    if (username != null) { 
                    %>
                        <!-- Se o usuário estiver logado, exibe o botão de Logout -->
                        <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Painel</a></li>
                        <li class="nav-item">
                            <a class="btn btn-danger" style="background-color: red;" href="logout.jsp">Logout</a>
                        </li>
                        
                        
                    <% 
                    } else { 
                    %>
                        <!-- Se o usuário não estiver logado, exibe o botão de Login -->
                        <li class="nav-item">
                            <a class="btn btn-outline-success" href="login.jsp">Login</a>
                        </li>
                    <% 
                    } 
                    %>
                </ul>
            </div>
        </div>
    </nav>
</header>
