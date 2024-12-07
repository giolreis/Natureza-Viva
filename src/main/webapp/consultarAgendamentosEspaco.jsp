<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@include file="conexao.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<head>

    <link rel="stylesheet" type="text/css" href="style.css">
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
<html>

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
        Espaço (ID):<br>
        <input type= "number" name="id" required></input>
        <br>
        <input type="submit" value="Enviar">
    </form>

    <a href ="index.jsp" class="a_outros">Voltar</a><br>

    <% 
        if(request.getParameter("id") != null){
                int id = Integer.parseInt(request.getParameter("id"));
            
            
            PreparedStatement statement=conexao.prepareStatement("select * from agendamentos a inner join espacos e on e.id = a.id_espaco inner join usuarios u on u.id = a.id_usuario where id_espaco like ? order by day(data_inicio)");
            statement.setString(1, "%" + id + "%");
            ResultSet listar=statement.executeQuery();
            int reg=0;
            while(listar.next()){
                out.println(listar.getString("e.nome"));
                out.println(listar.getString("u.nome"));
                out.println(listar.getString("data_inicio"));
                out.println(listar.getString("data_fim"));
                // out.println(listar.getString("day(data_inicio)")+"<p>");
                reg++;
            }	
            out.println("<hr>Foram localizados " + reg + " registros.");  
        
        }
    %>
</html>
