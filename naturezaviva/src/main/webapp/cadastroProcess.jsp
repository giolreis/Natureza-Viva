<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naturezaviva", "root", "senha");
        String query = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("username", username); // Salva o nome de usuário na sessão
            response.sendRedirect("index.jsp"); // Redireciona para a página inicial
        } else {
            out.println("<h3 class='text-danger'>Usuário ou senha inválidos.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 class='text-danger'>Erro de conexão com o banco de dados.</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
