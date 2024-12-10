<%
    String action = request.getParameter("action");
    if ("logout".equals(action)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
%>
