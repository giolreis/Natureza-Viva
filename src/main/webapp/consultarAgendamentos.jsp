<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %> <!-- Importa o SimpleDateFormat para formatar as datas -->
<%@include file="conexao.jsp" %>
<%@ include file="navbar.jsp" %> <!-- Inclui o arquivo da Navbar -->

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Agendamentos</title>

    <!-- Bootstrap CSS para responsividade e estilo -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/index.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .tabela-container {
            margin-top: 20px;
        }
        .form-container {
            margin-top: 30px;
        }
        .a_outros {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="container">
        <h2 class="text-center text-success mb-4">Consulta de Agendamentos</h2>

        <!-- Formulário para buscar por mês -->
        <div class="form-container">
            <form method="POST">
                <div class="mb-3">
                    <label for="data" class="form-label">Mês de Agendamento (1-12):</label>
                    <input type="number" class="form-control" name="data" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Consultar</button>
            </form>
        </div>

        <!-- Link para voltar à página anterior -->
        <div class="mt-3">
            <a href="adminDashboard.jsp" class="a_outros">Voltar</a>
        </div>

        <div class="tabela-container">
            <%
                // Criação de um objeto SimpleDateFormat para o formato brasileiro
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                
                if(request.getParameter("data") != null){
                    int data = Integer.parseInt(request.getParameter("data"));
                    if(data >= 1 && data <= 12){
                        PreparedStatement statement = conexao.prepareStatement("select * from agendamentos a inner join espacos e on e.id = a.id_espaco inner join usuarios u on u.id = a.id_usuario where month(data_inicio) like ? order by day(data_inicio)");
                        statement.setString(1, "%" + data + "%");
                        ResultSet listar = statement.executeQuery();
                        int reg = 0;

                        // Tabela para mostrar os resultados
                        out.println("<table class='table table-bordered table-striped'>");
                        out.println("<thead><tr><th>Espaço</th><th>Usuário</th><th>Data Início</th><th>Data Fim</th></tr></thead>");
                        out.println("<tbody>");
                        while(listar.next()){
                            out.println("<tr>");
                            out.println("<td>" + listar.getString("e.nome") + "</td>");
                            out.println("<td>" + listar.getString("u.nome") + "</td>");
                            // Formatação da data para o formato brasileiro
                            out.println("<td>" + sdf.format(listar.getDate("data_inicio")) + "</td>");
                            out.println("<td>" + sdf.format(listar.getDate("data_fim")) + "</td>");
                            out.println("</tr>");
                            reg++;
                        }
                        out.println("</tbody></table>");
                        out.println("<hr>Foram localizados " + reg + " registros.");
                    } else {
                        out.println("<hr><div class='alert alert-warning'>Coloque um número válido para o mês (1-12).</div>");
                    }
                }
            %>
        </div>
    </div>

    <!-- Bootstrap JS para funcionalidades -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

<%@ include file="footer.jsp" %> <!-- Inclui o arquivo do Footer -->
</html>
