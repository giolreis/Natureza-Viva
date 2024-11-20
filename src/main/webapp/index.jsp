<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Natureza Viva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/index.css">
    <style>
        /* Ajuste para as imagens do carrossel */
        .carousel-item img {
            height: 60vh; /* Define uma altura relativa à altura da tela */
            object-fit: cover; /* Ajusta a imagem para cobrir o container sem distorções */
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

    <main class="container text-center flex-grow-1 mt-5">
        <!-- Carrossel -->
        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../webapp/img/natureza1.jpeg" class="d-block w-100" alt="Imagem 1">
                </div>
                <div class="carousel-item">
                    <img src="../webapp/img/natureza2.jpg" class="d-block w-100" alt="Imagem 2">
                </div>
                <div class="carousel-item">
                    <img src="../webapp/img/natureza3.jpg" class="d-block w-100" alt="Imagem 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Próximo</span>
            </button>
        </div>
    </main>

    <footer class="footer">
        <p>&copy; 2024 Natureza Viva. Todos os direitos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
