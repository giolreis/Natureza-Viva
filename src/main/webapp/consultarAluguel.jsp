<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conexao.jsp" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Alugar Espaço - Airbnb Style</title>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="css/alugarEspaco.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 50px auto;
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
  <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img class="icon" src="img/iconUserPanel.png" alt="Ícone do usuário"> <!-- Ícone -->
            Painel do Usuário
        </a>
            <div class="navbar-nav">
                <a class="nav-link" href="#">Home</a>
                <a class="nav-link" href="#">Ajuda</a>
                <a class="nav-link" href="#">Perfil</a>
            </div>
        </div>
    </nav>
    <h1>Consultar Agendamentos</h1>
    
    <table>
        <thead>
            <tr>
                <th>Espaço</th>
                <th>Capacidade</th>
                <th>Início</th>
                <th>Fim</th>
                <th>Status</th>
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

                String sql = "SELECT * FROM agendamentos a INNER JOIN espacos e ON e.id = a.id_espaco WHERE a.id_usuario = ? and a.status = 'pendente'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(session.getAttribute("id").toString()));
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    String nome = rs.getString("e.nome");
                    int espaco_capacidade = rs.getInt("e.capacidade");
                    String inicio = rs.getString("a.data_inicio");
                    String fim = rs.getString("a.data_fim");
                    String agendamentoStatus = rs.getString("a.status");
                    int agendamentoId = rs.getInt("a.id");
                    String status = rs.getString("a.status");
                    
                    if (!"confirmado".equals(agendamentoStatus)) {
            %>
            <tr>
                <td><%= nome %></td>
                <td><%= espaco_capacidade %></td>
                <td><%= inicio %></td>
                <td><%= fim %></td>
                <td><%= status %></td>
            </tr>
            <% 
                    }
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Erro ao carregar agendamentos: " + e.getMessage() + "</td></tr>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
            %>
        </tbody>
    </table>

    <a href ="userDashboard.jsp" class="a_outros">Voltar</a><br>

</body>
</html>
