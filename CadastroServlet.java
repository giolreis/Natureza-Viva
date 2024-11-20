import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CadastroServlet")
public class CadastroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/natureza_viva", "root", "sua_senha");

            String sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, senha);

            int rows = stmt.executeUpdate();
            stmt.close();
            con.close();

            if (rows > 0) {
                response.sendRedirect("cadastro-sucesso.jsp");
            } else {
                response.sendRedirect("cadastro-falha.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cadastro-falha.jsp");
        }
    }
}
