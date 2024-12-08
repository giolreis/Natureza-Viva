<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.security.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="conexao.jsp" %>
<% 
    if(request.getMethod().equals("POST")){

        String nome=request.getParameter("nome");
        String senha=request.getParameter("senha");
        String confirmacao=request.getParameter("confirmacao");
        String email=request.getParameter("email");
        String usuario=request.getParameter("escolha");
        String cpf=request.getParameter("cpf");

        if(senha.equals(confirmacao)){

            PreparedStatement statement = conexao.prepareStatement("SELECT * FROM usuarios where email like ?");
            statement.setString(1,email); 
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                out.print("O email já foi cadastrado!");
                return;
            }

            try{
            
            Class.forName("com.mysql.jdbc.Driver");
            PreparedStatement inserir=conexao.prepareStatement("insert into usuarios (nome, email, senha, cpf, tipo_usuario, data_cadastro, status) values(?,?,?,?,?, now(), 'ativo')");
            inserir.setString(1,nome); 
            inserir.setString(2,email); 
            inserir.setString(3,senha); 
            inserir.setString(4,cpf); 
            inserir.setString(5,usuario); 
            inserir.execute(); 
            out.println("Usuário Gravado!");
            inserir.close();		

            }catch (ClassNotFoundException erroClass){
                out.println("Class Driver não foi localizado, erro = "+erroClass);}
    
            catch (SQLException e){
                out.println("Erro na conexão ao banco de dados. Detalhes: " + e.getMessage());
            }				
        }else{
            out.print("As senhas devem ser iguais");
        }
    }
    
%>