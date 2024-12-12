<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cadrasto de espaços</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../webapp/css/index.css">

</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="container my-5">
        <h2 class="text-center text-success mb-4">Cadastro de Espaços</h2>

        <form method="POST">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome do espaço" required>
            </div>
            <div class="mb-3">
                <label for="descricao" class="form-label">Descrição</label>
                <textarea class="form-control" id="descricao" name="descricao" placeholder="Descreva o espaço" required> </textarea>
            </div>
             <div class="mb-3">
                <label for="capacidade" class="form-label">Capacidade</label>
                <input type="number" class="form-control" id="capacidade" name="capacidade" required>
            </div>
             <div class="mb-3">
                <label for="preco" class="form-label">Preço</label>
                <input type="number" class="form-control" id="preco" name="preco" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Adicionar</button>
        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
    <%@ include file="footer.jsp" %>

    <%
        if(request.getMethod().equals("POST")){

            String nome=request.getParameter("nome");
            String descricao=request.getParameter("descricao");
            String capacidade=request.getParameter("capacidade");
            String preco=request.getParameter("preco");

            try{
            
                Class.forName("com.mysql.jdbc.Driver");
                PreparedStatement inserir=conexao.prepareStatement("insert into espacos (nome, descricao, capacidade, preco, status, data_criacao) values(?,?,?,?, 'disponivel',now())");
                inserir.setString(1,nome); 
                inserir.setString(2,descricao); 
                inserir.setString(3,capacidade); 
                inserir.setString(4,preco);
                inserir.execute(); 
                out.println("Espaço Gravado!");
                inserir.close();		

            }catch (ClassNotFoundException erroClass){
                out.println("Class Driver não foi localizado, erro = "+erroClass);}
       
            catch (SQLException e){
                out.println("Erro na conexão ao banco de dados. Detalhes: " + e.getMessage());
            }				
        }
    %>
</html>
