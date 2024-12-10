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
        <h2 class="text-center text-success mb-4">Alterar ou Avaliar Agendamentos</h2>
        
        <table>
        <thead>
            <tr>
                <th>ID</td>
                <th>Espaço</th>
                <th>Usuário</th>
                <th>Data Início</th>
                <th>Data Fim</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/naturezaviva","root","");

    String sql = "SELECT * FROM agendamentos a inner join espacos e on e.id = a.id_espaco inner join usuarios u on u.id = a.id_usuario where a.status <> 'finalizado'";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    while (rs.next()) {

        int id = rs.getInt("a.id");
        String espaco = rs.getString("e.nome");
        String usuario = rs.getString("u.nome");
        String inicio = rs.getString("data_inicio");
        String fim = rs.getString("data_fim");
        String status = rs.getString("a.status");
%>
        <tr>
            <td><%= id %></td>
            <td><%= espaco %></td>
            <td><%= usuario %></td>
            <td><%= inicio %></td>
            <td><%= fim %></td>
            <td><%= status %></td>
        </tr>
<%
    }

    rs.close();
    stmt.close();
    conn.close();
%>
        </tbody>
        </table>

        <form method="POST">
            <div class="mb-3">
                <label for="id_agendamento" class="form-label">ID Agendamento</label>
                <input type="number" class="form-control" id="id_agendamento" name="id_agendamento" placeholder="0" required>
            </div>

            <div class="mb-3">
                <label for="status">Status</label>
                <select class="form-select" name="status">
                    <option value="confirmado">Confirmar</option>
                    <option value="cancelado">Cancelar</option>
                    <option value="finalizado">Finalizar</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="nota" class="form-label">Nota</label>
                <input type="number" class="form-control" id="nota" name="nota" placeholder="0">
            </div>

            <div class="mb-3">
                <label for="id_agendamento" class="form-label">Observação</label>
                <input type="text" class="form-control" id="obs" name="obs" placeholder="Observação">
            </div>

            <button type="submit" class="btn btn-success w-100">Alterar</button>
        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
    <%@ include file="footer.jsp" %>
        
    <%

        if(request.getMethod().equals("POST")){

            String id_agendamento=request.getParameter("id_agendamento");
            String status = request.getParameter("status");
            String nota = request.getParameter("nota");
            String obs = request.getParameter("obs");
    
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                
                
                if("finalizado".equals(status)){

                    PreparedStatement select = conexao.prepareStatement("select id_espaco from agendamentos where id=?");
                    select.setString(1,id_agendamento);  
                    ResultSet rs_select = select.executeQuery();  

                    while (rs_select.next()) {

                        int id_espaco = rs_select.getInt("id_espaco");
                        PreparedStatement update2=conexao.prepareStatement("update espacos set status = 'disponivel' where id = ?");
                        update2.setInt(1, id_espaco);
                        update2.execute(); 
                        update2.close();

                    }

                    select.close();	

                    PreparedStatement update=conexao.prepareStatement("update agendamentos set status = ? where id = ?");
                    update.setString(1,status); 
                    update.setString(2,id_agendamento); 
                    update.execute(); 
                    update.close();	

                    PreparedStatement insert=conexao.prepareStatement("insert into avaliacoes (id_agendamento, nota, comentario, data_criacao) values(?,?,?,current_timestamp())");
                    insert.setString(1,id_agendamento); 
                    insert.setString(2,nota); 
                    insert.setString(3,obs);
                    insert.execute(); 
                    insert.close(); 
                }else{

                    if (status.equals("confirmado")){
                        PreparedStatement select = conexao.prepareStatement("select id_espaco from agendamentos where id=?");
                        select.setString(1,id_agendamento);  
                        ResultSet rs_select = select.executeQuery();  

                        while (rs_select.next()) {

                        int id_espaco = rs_select.getInt("id_espaco");
                        PreparedStatement update2=conexao.prepareStatement("update espacos set status = 'indisponivel' where id = ?");
                        update2.setInt(1, id_espaco);
                        update2.execute(); 
                        update2.close();

                        }

                    select.close();	
                    }

                    PreparedStatement update=conexao.prepareStatement("update agendamentos set status = ? where id = ?");
                    update.setString(1,status); 
                    update.setString(2,id_agendamento); 
                    update.execute(); 
                    update.close();	

                }



                out.println("Alteração salva com sucesso!");

            }catch (ClassNotFoundException erroClass){
                out.println("Class Driver não foi localizado, erro = "+erroClass);}
       
            catch (SQLException e){
                out.println("Erro na conexão ao banco de dados. Detalhes: " + e.getMessage());
            }				
        }
    %>
</html>
