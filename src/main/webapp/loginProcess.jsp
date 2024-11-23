<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, java.security.MessageDigest, java.security.NoSuchAlgorithmException" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
        response.sendRedirect("login.jsp?error=emptyFields");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naturezaviva", "root", "senha");

        String hashedPassword = hashPassword(password);

        String query = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, hashedPassword);
        rs = ps.executeQuery();

        if (rs.next()) {
            String userRole = rs.getString("role"); // Coluna 'role' vai determinar se é admin ou usuário normal

            // Criação de cookies para armazenar o nome do usuário e a função
            Cookie userCookie = new Cookie("username", username);
            Cookie roleCookie = new Cookie("role", userRole);
            userCookie.setMaxAge(3600); // O cookie ficará válido por 1 hora
            roleCookie.setMaxAge(3600); // O cookie ficará válido por 1 hora
            response.addCookie(userCookie);
            response.addCookie(roleCookie);

            if ("admin".equals(userRole)) {
                response.sendRedirect("adminDashboard.jsp"); // Redireciona para o painel do admin
            } else {
                response.sendRedirect("userDashboard.jsp"); // Redireciona para o painel do usuário
            }
        } else {
            response.sendRedirect("login.jsp?error=invalidCredentials");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("login.jsp?error=dbError");
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashBytes) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
%>
