<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cadrasto de agendamentos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"><style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
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
        <h2 class="text-center text-success mb-4">Cadastro de Agendamentos</h2>
        
        <table>
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

    // Estabelecer conexão com o banco de dados
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/naturezaviva","root","");

    // Executar consulta
    String sql = "SELECT nome, id FROM espacos";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    // Iterar pelos resultados e gerar linhas da tabela
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

    // Fechar recursos
    rs.close();
    stmt.close();
    conn.close();
%>
        </tbody>

        <form method="POST">
            <div class="mb-3">
                <label for="id_espaco" class="form-label">ID Espaço</label>
                <input type="number" class="form-control" id="id_espaco" name="id_espaco" placeholder="0" required>
            </div>
            <div class="mb-3">
                <label for="inicio" class="form-label">Data Início</label>
                <input type="datetime-local" class="form-control" id="inicio" name="inicio" required>
            </div>
            <div class="mb-3">
                <label for="fim" class="form-label">Data Fim</label>
                <input type="datetime-local" class="form-control" id="fim" name="fim" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Adicionar</button>
        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
    <%@ include file="footer.jsp" %>
        
    <%

        // Connection conn = null;
        // Statement stmt = null;
        // ResultSet rs = null;

        // String sql = "SELECT (nome,id) FROM espacos";
        // stmt = conn.createStatement();
        // rs = stmt.executeQuery(sql);

        // while (rs.next()) {
        //     int espaco_id = rs.getInt("id");
        //     String espaco = rs.getString("nome");
        // }


        // PreparedStatement statement=conexao.prepareStatement("select (nome,id) from espacos");
        // statement.setString(1, "%" + data + "%");
        // ResultSet listar=statement.executeQuery();
        // int reg=0;
        // while(listar.next()){
        //     String espaco = rs.getInt("nome");
        //     int espaco_id = rs.getInt("id");
        // }	

        if(request.getMethod().equals("POST")){

            String id=request.getParameter("id_espaco");
            String inicio=request.getParameter("inicio");
            String fim=request.getParameter("fim");

            try{
            
                Class.forName("com.mysql.jdbc.Driver");
                PreparedStatement inserir=conexao.prepareStatement("insert into agendamentos (id_usuario, id_espaco, data_inicio, data_fim) values(4,?,?,?)");
                inserir.setString(1,id); 
                inserir.setString(2,inicio); 
                inserir.setString(3,fim); 
                inserir.execute(); 
                out.println("Agendamento Gravado!");
                inserir.close();		

            }catch (ClassNotFoundException erroClass){
                out.println("Class Driver não foi localizado, erro = "+erroClass);}
       
            catch (SQLException e){
                out.println("Erro na conexão ao banco de dados. Detalhes: " + e.getMessage());
            }				
        }
    %>
</html>
