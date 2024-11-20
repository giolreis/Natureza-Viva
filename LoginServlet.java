@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Estabelecer conexão com o banco de dados
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/natureza_viva", "root", "sua_senha");

            // Consultar o banco para verificar o login
            String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);

            rs = stmt.executeQuery();

            // Se o usuário for encontrado, redirecionar para uma página de sucesso
            if (rs.next()) {
                response.sendRedirect("index.jsp"); // ou para a página de sucesso do seu sistema
            } else {
                response.sendRedirect("login-failed.jsp"); // ou para a página de erro de login
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login-failed.jsp"); // Redirecionar em caso de erro
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
