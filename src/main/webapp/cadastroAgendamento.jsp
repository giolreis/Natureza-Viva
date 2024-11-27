<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cadrasto de agendamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="container my-5">
        <h2 class="text-center text-success mb-4">Cadastro de Agendamentos</h2>

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
        if(request.getMethod().equals("POST")){

            String id=request.getParameter("id_espaco");
            String inicio=request.getParameter("inicio");
            String fim=request.getParameter("fim");

            try{
            
                Class.forName("com.mysql.jdbc.Driver");
                PreparedStatement inserir=conexao.prepareStatement("insert into agendamentos (id_usuario, id_espaco, data_inicio, data_fim) values(0,?,?,?)");
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
