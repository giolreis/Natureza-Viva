// // Captura os formulários
// const loginForm = document.querySelector('.forms-dados');
// const signupForm = document.querySelector('#signup-form');

// // Captura os botões de Login e Cadastro
// const showSignupButton = document.querySelector('.btn-custom:nth-child(2)');  // Botão "Cadastre-se"
// const showLoginButton = document.querySelector('.btn-custom:nth-child(1)');  // Botão "Login"
// const showLoginFromSignupButton = document.querySelector('#show-login');  // Botão "Já tem uma conta? Faça login"

// // Função para mostrar o formulário de cadastro
// function showSignup() {
//     loginForm.style.display = 'none';   // Esconde o formulário de login
//     signupForm.style.display = 'block'; // Mostra o formulário de cadastro
// }

// // Função para mostrar o formulário de login
// function showLogin() {
//     signupForm.style.display = 'none';  // Esconde o formulário de cadastro
//     loginForm.style.display = 'block';  // Mostra o formulário de login
// }

// // Eventos de clique
// showSignupButton.addEventListener('click', showSignup);
// showLoginButton.addEventListener('click', showLogin);
// showLoginFromSignupButton.addEventListener('click', showLogin);

// // Exibe o login por padrão, escondendo o cadastro
// loginForm.style.display = 'block';
// signupForm.style.display = 'none';

/// Captura os formulários
const loginForm = document.querySelector('.forms-dados');
const signupForm = document.querySelector('#signup-form');

// Captura os botões de Login e Cadastro
const showSignupButton = document.querySelector('.btn-custom:nth-child(2)'); 
const showLoginButton = document.querySelector('.btn-custom:nth-child(1)');
const showLoginFromSignupButton = document.querySelector('#show-login');

// Função para mostrar o formulário de cadastro
function showSignup() {
  loginForm.style.display = 'none';
  signupForm.style.display = 'block';
}

// Função para mostrar o formulário de login
function showLogin() {
  signupForm.style.display = 'none';
  loginForm.style.display = 'block';
}

// Eventos de clique
showSignupButton.addEventListener('click', showSignup);
showLoginButton.addEventListener('click', showLogin);
showLoginFromSignupButton.addEventListener('click', showLogin);

// Exibe o login por padrão, escondendo o cadastro
loginForm.style.display = 'block';
signupForm.style.display = 'none';