<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login ou Cadastro - Natureza Viva</title>
    <!-- Incluir o Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-gray-100">
    <%@ include file="navbar.jsp" %>

    <div class="flex justify-center items-center min-h-screen pt-20">
        <div class="flex flex-col w-full max-w-md bg-white shadow-lg rounded-lg overflow-hidden"> <!-- Tamanho ajustado para max-w-md -->
            <!-- Imagem de fundo -->
            <div class="w-full relative">
                <!-- Carrossel de Imagens -->
                <div id="carousel" class="h-48 w-full"> <!-- Ajustei a altura para 48 -->
                    <img src="img/imagePassaro.png" class="carousel-item w-full h-full object-cover" alt="Imagem de passaro">
                    <img src="img/natureza1.jpeg" class="carousel-item w-full h-full object-cover hidden" alt="Imagem de planta 1">
                    <img src="img/natureza2.jpg" class="carousel-item w-full h-full object-cover hidden" alt="Imagem de planta 2">
                    <img src="img/natureza3.jpg" class="carousel-item w-full h-full object-cover hidden" alt="Imagem de planta 3">
                </div>
            </div>
            
            <!-- Formulário de Login/Cadastro -->
            <div class="w-full p-8">
                <h1 id="formTitle" class="text-3xl font-bold mb-6 text-center">Login</h1>
                
                <!-- Formulário de Login -->
                <form id="loginForm" method="POST" action="loginProcess.jsp" class="space-y-4">
                    <div>
                        <label for="nome_login" class="block text-lg font-medium text-gray-700">Nome</label>
                        <input type="text" id="nome_login" name="nome_login" class="w-full border border-gray-300 rounded-md p-3" placeholder="Digite seu nome" required>
                    </div>
                    <div>
                        <label for="senha_login" class="block text-lg font-medium text-gray-700">Senha</label>
                        <input type="password" id="senha_login" name="senha_login" class="w-full border border-gray-300 rounded-md p-3" placeholder="Digite sua senha" required>
                    </div>
                    <button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 transition duration-300">Entrar</button>
                </form>

                <!-- Formulário de Cadastro (oculto inicialmente) -->
                <form id="registerForm" method="POST" action="registerProcess.jsp" class="space-y-4 hidden">
                    <div>
                        <label for="nome_cadastro" class="block text-lg font-medium text-gray-700">Nome</label>
                        <input type="text" id="nome_cadastro" name="nome_cadastro" class="w-full border border-gray-300 rounded-md p-3" placeholder="Digite seu nome" required>
                    </div>
                    <div>
                        <label for="email_cadastro" class="block text-lg font-medium text-gray-700">Email</label>
                        <input type="email" id="email_cadastro" name="email_cadastro" class="w-full border border-gray-300 rounded-md p-3" placeholder="Digite seu email" required>
                    </div>
                    <div>
                        <label for="senha_cadastro" class="block text-lg font-medium text-gray-700">Senha</label>
                        <input type="password" id="senha_cadastro" name="senha_cadastro" class="w-full border border-gray-300 rounded-md p-3" placeholder="Crie uma senha" required>
                    </div>
                    <div>
                        <label for="confirmar_senha" class="block text-lg font-medium text-gray-700">Confirme sua senha</label>
                        <input type="password" id="confirmar_senha" name="confirmar_senha" class="w-full border border-gray-300 rounded-md p-3" placeholder="Confirme sua senha" required>
                    </div>
                    <div>
                        <label for="escolha" class="block text-lg font-medium text-gray-700">Escolha:</label>
                        <select id="escolha" name="escolha" class="w-full border border-gray-300 rounded-md p-3" required>
                            <option value="" disabled selected>Cadastre como:</option>
                            <option value="admin">Administrador</option>
                            <option value="usuario">Usuário</option>
                            <option value="Ong">Ong</option>
                        </select>
                    </div>
                    <div>
                        <label for="cpf" class="block text-lg font-medium text-gray-700">CPF</label>
                        <input type="text" id="cpf" name="cpf" class="w-full border border-gray-300 rounded-md p-3" placeholder="Digite seu CPF" required>
                    </div>
                    <button type="submit" class="w-full bg-green-500 text-white p-3 rounded-md hover:bg-green-600 transition duration-300">Cadastrar</button>
                </form>

                <!-- Link para alternar entre login e cadastro -->
                <p class="text-center text-sm text-gray-700 mt-4">
                    <span id="toggleText">Não tem uma conta? <a href="javascript:void(0);" onclick="toggleForm()" class="text-blue-500 underline">Cadastre-se</a></span>
                    <span id="toggleBackText" class="hidden">Já tem uma conta? <a href="javascript:void(0);" onclick="toggleForm()" class="text-blue-500 underline">Faça login</a></span>
                </p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>
    <script src="js/script.js"></script>
    <script>
        // Função para alternar entre login e cadastro
        function toggleForm() {
            const loginForm = document.getElementById("loginForm");
            const registerForm = document.getElementById("registerForm");
            const formTitle = document.getElementById("formTitle");
            const toggleText = document.getElementById("toggleText");
            const toggleBackText = document.getElementById("toggleBackText");

            // Alterna entre login e cadastro
            if (loginForm.classList.contains("hidden")) {
                loginForm.classList.remove("hidden");
                registerForm.classList.add("hidden");
                formTitle.textContent = "Login";
                toggleText.classList.remove("hidden");
                toggleBackText.classList.add("hidden");
            } else {
                loginForm.classList.add("hidden");
                registerForm.classList.remove("hidden");
                formTitle.textContent = "Cadastro";
                toggleText.classList.add("hidden");
                toggleBackText.classList.remove("hidden");
            }
        }

        // Função para alternar as imagens do carrossel a cada 5 segundos
        let currentIndex = 0;
        const items = document.querySelectorAll('.carousel-item');
        
        function changeImage() {
            // Esconde a imagem atual
            items[currentIndex].classList.add('hidden');
            
            // Calcula o próximo índice
            currentIndex = (currentIndex + 1) % items.length;
            
            // Exibe a próxima imagem
            items[currentIndex].classList.remove('hidden');
        }
        
        // Chama a função de alternância de imagens a cada 5 segundos
        setInterval(changeImage, 5000);
    </script>
</body>
<%@ include file="footer.jsp" %>
</html>
