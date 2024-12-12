<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.sql.*" %>
<%@ include file="navbar.jsp" %>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Agendamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/index.css">
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
        .container {
            margin-top: 40px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center text-primary mb-4">Agendamentos por Espaço</h2>
        <h3 class="text-center text-primary mb-4">*Filtrar por ID do espaço</h3>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Espaço</th>
                    <th>ID</th>
                </tr>
            </thead>
            <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Estabelece a conexão
                    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/naturezaviva", "root", "");
                    String sql = "SELECT nome, id FROM espacos";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int espaco_id = rs.getInt("id");
                        String espaco = rs.getString("nome");
            %>
                        <tr>
                            <td><%= espaco %></td>
                            <td><%= espaco_id %></td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<tr><td colspan='2'>Erro ao carregar espaços: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Garante que a conexão será fechada no final
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p>Erro ao fechar recursos: " + e.getMessage() + "</p>");
                    }
                }
            %>
            </tbody>
        </table>

        <form method="POST" class="mb-4">
            <div class="mb-3">
                <label for="id" class="form-label">Espaço (ID):</label>
                <input type="number" name="id" id="id" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>

        <hr>

        <%
            if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn2 = null;
                PreparedStatement statement = null;
                ResultSet listar = null;

                try {
                    conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/naturezaviva", "root", "");
                    statement = conn2.prepareStatement(
                        "SELECT e.nome AS espaco_nome, u.nome AS usuario_nome, a.data_inicio, a.data_fim " +
                        "FROM agendamentos a " +
                        "INNER JOIN espacos e ON e.id = a.id_espaco " +
                        "INNER JOIN usuarios u ON u.id = a.id_usuario " +
                        "WHERE id_espaco = ? " + // Aqui estamos corrigindo a consulta para evitar SQL injection
                        "ORDER BY a.data_inicio");

                    statement.setInt(1, id);
                    listar = statement.executeQuery();

                    // Verifica se existem resultados e exibe a tabela
                    if (!listar.isBeforeFirst()) {
                        out.println("<p>Não foram encontrados agendamentos para o ID informado.</p>");
                    } else {
            %>

                        <!-- Tabela para exibir os agendamentos -->
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Espaço</th>
                                    <th>Usuário</th>
                                    <th>Data Início</th>
                                    <th>Data Fim</th>
                                </tr>
                            </thead>
                            <tbody>
            <%
                        // Exibe as informações na tabela
                        while (listar.next()) {
            %>
                            <tr>
                                <td><%= listar.getString("espaco_nome") %></td>
                                <td><%= listar.getString("usuario_nome") %></td>
                                <td><%= listar.getString("data_inicio") %></td>
                                <td><%= listar.getString("data_fim") %></td>
                            </tr>
            <%
                        }
            %>
                            </tbody>
                        </table>

            <%
                    }
                } catch (SQLException e) {
                    out.println("<p>Erro ao carregar agendamentos: " + e.getMessage() + "</p>");
                } finally {
                    // Garante o fechamento dos recursos
                    try {
                        if (listar != null) listar.close();
                        if (statement != null) statement.close();
                        if (conn2 != null) conn2.close();
                    } catch (SQLException e) {
                        out.println("<p>Erro ao fechar recursos: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>

    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
