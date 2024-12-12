<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Agendamentos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/sobrenos.css">
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container my-5">
        <h2 class="text-center text-primary mb-4">Excluir Agendamentos</h2>
        <h3 class="text-center text-primary mb-4">*Os agendamentos ja reservados não podem ser excluidos</h3>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Espaço</th>
                    <th>Início</th>
                    <th>Fim</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/naturezaviva", "root", "");

                    String sql = "SELECT * FROM agendamentos a inner join espacos e on e.id = a.id_espaco inner join usuarios u on u.id = a.id_usuario where u.nome = 'placeholder'";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int agendamento_id = rs.getInt("a.id");
                        String espaco_nome = rs.getString("e.nome");
                        String inicio = rs.getString("data_inicio");
                        String fim = rs.getString("data_fim");
                %>
                <tr>
                    <td><%= agendamento_id %></td>
                    <td><%= espaco_nome %></td>
                    <td><%= inicio %></td>
                    <td><%= fim %></td>
                    <td>
                        <form method="POST" class="d-inline">
                            <input type="hidden" name="id" value="<%= agendamento_id %>">
                            <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm">Excluir</button>
                        </form>
                    </td>
                </tr>

                <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Erro ao carregar agendamentos: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
                %>
            </tbody>
        </table>
    </div>

    <%
    if (request.getMethod().equals("POST")) {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String capacidade = request.getParameter("capacidade");
        String preco = request.getParameter("preco");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/naturezaviva", "root", "");

            if ("delete".equals(action)) {
                String deleteSQL = "DELETE FROM agendamentos WHERE id = ?";
                PreparedStatement stmtDelete = conn.prepareStatement(deleteSQL);
                stmtDelete.setInt(1, Integer.parseInt(id));
                stmtDelete.executeUpdate();
                out.println("<div class='alert alert-success'>Agendamento excluído com sucesso!</div>");
            } 
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Erro: " + e.getMessage() + "</div>");
        } finally {
            if (conn != null) conn.close();
        }
    }
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
<%@ include file="footer.jsp" %>
</html>
