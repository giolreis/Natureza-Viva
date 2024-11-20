<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sobre Nós - Natureza Viva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/sobrenos.css">
</head>
<body>
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
                        <li class="nav-item"><a class="nav-link active" href="sobrenos.jsp">Sobre nós</a></li>
                        <li class="nav-item"><a class="btn btn-outline-success" href="login.jsp">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="container text-center flex-grow-1 mt-5">
        <h1 class="title mb-4">Sobre Nós</h1>
        <p class="lead mb-5">
            O projeto Natureza Viva tem como objetivo promover a sustentabilidade e o cuidado com o meio ambiente,
            fornecendo soluções tecnológicas para o monitoramento e a preservação de áreas naturais.
            Trabalhamos com tecnologias inovadoras para ajudar na conservação do nosso planeta, de forma prática e acessível para todos.
        </p>

        <h2 class="project-title mb-4">Nossa Equipe</h2>
        <div class="row mb-5">
            <div class="col-md-4">
                <img src="../webapp/img/joao.jpg" alt="Membro da equipe 1" class="team-img">
                <h4 class="mt-3">João Silva</h4>
                <p>Fundador e CEO</p>
            </div>
            <div class="col-md-4">
                <img src="../webapp/img/maria.jpg" alt="Membro da equipe 2" class="team-img">
                <h4 class="mt-3">Maria Oliveira</h4>
                <p>Co-fundadora e Diretora de Marketing</p>
            </div>
            <div class="col-md-4">
                <img src="../webapp/img/carlos.jpg" alt="Membro da equipe 3" class="team-img">
                <h4 class="mt-3">Carlos Pereira</h4>
                <p>Desenvolvedor de Software</p>
            </div>
        </div>

        <h2 class="project-title mb-4">Nosso Propósito</h2>
        <p class="lead">
            Acreditamos que, através da união de pessoas e tecnologia, podemos gerar um impacto positivo no mundo. Nosso objetivo é criar soluções inovadoras que ajudem no dia a dia das pessoas e na preservação ambiental.
        </p>
    </main>

    <footer class="footer">
        <p>&copy; 2024 Natureza Viva. Todos os direitos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
