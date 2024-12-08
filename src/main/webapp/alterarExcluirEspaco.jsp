<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Espaços</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <h2 class="text-center text-primary mb-4">Gerenciar Espaços</h2>
        <h3 class="text-center text-primary mb-4">*Os espaços indisponíveis não podem ser editados nem excluídos</h3>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Capacidade</th>
                    <th>Preço</th>
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

                    String sql = "SELECT id, nome, descricao, capacidade, preco FROM espacos where status <> 'indisponivel'";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int espaco_id = rs.getInt("id");
                        String espaco_nome = rs.getString("nome");
                        String espaco_descricao = rs.getString("descricao");
                        int espaco_capacidade = rs.getInt("capacidade");
                        double espaco_preco = rs.getDouble("preco");
                %>
                <tr>
                    <td><%= espaco_id %></td>
                    <td><%= espaco_nome %></td>
                    <td><%= espaco_descricao %></td>
                    <td><%= espaco_capacidade %></td>
                    <td>R$ <%= String.format("%.2f", espaco_preco) %></td>
                    <td>
                        <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal<%= espaco_id %>">
                            Editar
                        </button>
                        <form method="POST" class="d-inline">
                            <input type="hidden" name="id" value="<%= espaco_id %>">
                            <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm">Excluir</button>
                        </form>
                    </td>
                </tr>

                <!-- Modal para Editar Espaço -->
                <div class="modal fade" id="editModal<%= espaco_id %>" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Editar Espaço</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="POST">
                                <div class="modal-body">
                                    <input type="hidden" name="id" value="<%= espaco_id %>">
                                    <div class="mb-3">
                                        <label for="nome" class="form-label">Nome</label>
                                        <input type="text" class="form-control" id="nome" name="nome" value="<%= espaco_nome %>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="descricao" class="form-label">Descrição</label>
                                        <textarea class="form-control" id="descricao" name="descricao" rows="3" required><%= espaco_descricao %></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="capacidade" class="form-label">Capacidade</label>
                                        <input type="number" class="form-control" id="capacidade" name="capacidade" value="<%= espaco_capacidade %>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="preco" class="form-label">Preço</label>
                                        <input type="number" step="0.01" class="form-control" id="preco" name="preco" value="<%= espaco_preco %>" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" name="action" value="edit" class="btn btn-primary">Salvar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Erro ao carregar espaços: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
                %>
            </tbody>
        </table>
    </div>

    <%-- Processar ações de edição ou exclusão --%>
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
                String deleteSQL = "DELETE FROM espacos WHERE id = ?";
                PreparedStatement stmtDelete = conn.prepareStatement(deleteSQL);
                stmtDelete.setInt(1, Integer.parseInt(id));
                stmtDelete.executeUpdate();
                out.println("<div class='alert alert-success'>Espaço excluído com sucesso!</div>");
            } else if ("edit".equals(action)) {
                String updateSQL = "UPDATE espacos SET nome = ?, descricao = ?, capacidade = ?, preco = ? WHERE id = ?";
                PreparedStatement stmtUpdate = conn.prepareStatement(updateSQL);
                stmtUpdate.setString(1, nome);
                stmtUpdate.setString(2, descricao);
                stmtUpdate.setInt(3, Integer.parseInt(capacidade));
                stmtUpdate.setDouble(4, Double.parseDouble(preco));
                stmtUpdate.setInt(5, Integer.parseInt(id));
                stmtUpdate.executeUpdate();
                out.println("<div class='alert alert-success'>Espaço atualizado com sucesso!</div>");
            }
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Erro: " + e.getMessage() + "</div>");
        } finally {
            if (conn != null) conn.close();
        }
    }
    %>
    <a href ="adminDashboard.jsp" class="a_outros">Voltar</a><br>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@ include file="footer.jsp" %>
    
</body>
</html>
