<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contatos - Natureza Viva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/contatos.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <main class="container my-5">
        <h1 class="title mb-4 text-success text-center">Entre em Contato</h1>

        <!-- Formulário de Contato -->
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-12">
                <form action="enviar_mensagem.jsp" method="POST">
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Seu nome" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="seuemail@exemplo.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="mensagem" class="form-label">Mensagem</label>
                        <textarea class="form-control" id="mensagem" name="mensagem" rows="5" placeholder="Digite sua mensagem aqui" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Enviar</button>
                </form>
            </div>
        </div>

        <!-- Informações de Contato -->
        <div class="contact-info text-center mt-5">
            <h3 class="text-success">Informações de Contato</h3>
            <p><strong>Endereço:</strong> Av. Thereza Ana Cecon Breda, 1896 - Vila São Pedro, Hortolândia - SP, 13183-091</p>
            <p><strong>E-mail:</strong> contato@naturezaviva.com.br</p>
            <p><strong>Telefone:</strong> (19) 98412-0071</p>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
