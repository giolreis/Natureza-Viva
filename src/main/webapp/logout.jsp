<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%
    session.invalidate(); // Destrói a sessão do usuário
    response.sendRedirect("index.jsp"); // Redireciona para a página inicial após o logout
%>
