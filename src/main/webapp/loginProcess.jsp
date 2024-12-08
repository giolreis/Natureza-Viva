<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>
 <%
if (request.getMethod().equals("POST")) {
    String nome = request.getParameter("nome_login");
    String senha = request.getParameter("senha_login");

    try {
        PreparedStatement statement = conexao.prepareStatement(
            "SELECT id, nome, senha, tipo_usuario FROM usuarios WHERE nome = ? AND senha = ?");
        statement.setString(1, nome);
        statement.setString(2, senha);
        ResultSet listar = statement.executeQuery();

        if (listar.next()) {
            String nomeDb = listar.getString("nome");
            String senhaDb = listar.getString("senha");
            String tipoUsuario = listar.getString("tipo_usuario");
            int id = listar.getInt("id");

            if (nomeDb.equals(nome) && senhaDb.equals(senha)) {
                // Invalida sessão anterior, se existir
                if (session != null) {
                    session.invalidate();
                }

                // Cria uma nova sessão
                HttpSession novaSessao = request.getSession(true);
                novaSessao.setAttribute("username", nomeDb);
                novaSessao.setAttribute("id", id);

                // Direciona com base no tipo de usuário
                if (tipoUsuario.equals("usuario")) {
                    response.sendRedirect("userDashboard.jsp");
                } else if (senhaDb.equals("123456")) {
                    response.sendRedirect("trocarSenha.jsp");
                } else {
                    response.sendRedirect("adminDashboard.jsp");
                }
            } else {
                out.println("Usuário ou senha incorretos");
            }
        } else {
            out.println("Usuário não encontrado");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Erro ao acessar o banco de dados");
    }
}
%>
