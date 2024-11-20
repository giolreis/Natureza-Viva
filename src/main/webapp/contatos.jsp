<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contatos - Natureza Viva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/contatos.css">
    <style>
        /* Ajustes no formulário de contato */
        .form-control {
            border-radius: 10px;
        }

        .contact-info {
            margin-top: 30px;
        }

        .contact-info p {
            font-size: 1.2rem;
        }

    </style>
</head>
<body>
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo" href="#">🌱 Natureza Viva</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="contatos.jsp">Contatos</a></li>
                        <li class="nav-item"><a class="nav-link" href="sobrenos.jsp">Sobre nós</a></li>
                        <li class="nav-item"><a class="btn btn-outline-success" href="login.jsp">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="container text-center mt-5">
        <h1 class="title mb-4">Entre em Contato</h1>

        <!-- Formulário de Contato -->
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form action="enviar_mensagem.jsp" method="POST">
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="mensagem" class="form-label">Mensagem</label>
                        <textarea class="form-control" id="mensagem" name="mensagem" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Enviar</button>
                </form>
            </div>
        </div>

        <!-- Informações de Contato -->
        <div class="contact-info mt-5">
            <h3>Informações de Contato</h3>
            <p><strong>Endereço:</strong> : Av. Thereza Ana Cecon Breda, 1896 - Vila Sao Pedro, Hortolândia - SP, 13183-091</p>
            <p><strong>E-mail:</strong> contato@naturezaviva.com.br</p>
            <p><strong>Telefone:</strong> (19) 98412-0071</p>
        </div>

        
    </main>

    <footer class="footer mt-5">
        <p>&copy; 2024 Natureza Viva. Todos os direitos reservados.</p>
    </footer>

</body>
</html>
