import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Validação simples de login
        try {
            // Estabelece a conexão com o banco de dados
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/NaturezaViva", "root", "test");
            
            // Cria a consulta SQL
            String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = MD5(?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, senha);
            
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                // Se o usuário for encontrado, redireciona para a página home.jsp
                HttpSession session = request.getSession();
                session.setAttribute("usuario", email);
                response.sendRedirect("home.jsp");  // Redireciona para a página de escolha de ação
            } else {
                // Se as credenciais estiverem erradas, exibe uma mensagem de erro
                request.setAttribute("erro", "Email ou senha incorretos.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro de banco de dados.");
        }
    }
}
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Validação simples de login
        try {
            // Estabelece a conexão com o banco de dados
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/NaturezaViva", "root", "senha");
            
            // Cria a consulta SQL
            String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = MD5(?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, senha);
            
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                // Se o usuário for encontrado, redireciona para a página home.jsp
                HttpSession session = request.getSession();
                session.setAttribute("usuario", email);
                response.sendRedirect("home.jsp");  // Redireciona para a página de escolha de ação
            } else {
                // Se as credenciais estiverem erradas, exibe uma mensagem de erro
                request.setAttribute("erro", "Email ou senha incorretos.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro de banco de dados.");
        }
    }
}
