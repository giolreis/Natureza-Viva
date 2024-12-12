<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@include file="conexao.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<head>

    <link rel="stylesheet" type="text/css" href="style.css">

</head>
<html>
    
    <form method="POST">
        Mês Agendamento (1-12):<br>
        <input type= "number" name="data" required></input>
        <br>
        <input type="submit" value="Enviar">
    </form>

    <a href ="adminDashboard.jsp" class="a_outros">Voltar</a><br>

    <% 
        if(request.getParameter("data") != null){
                int data = Integer.parseInt(request.getParameter("data"));
            

            if(data>=1 && data<=12){
                
                PreparedStatement statement=conexao.prepareStatement("select * from agendamentos a inner join espacos e on e.id = a.id_espaco inner join usuarios u on u.id = a.id_usuario where month(data_inicio) like ? order by day(data_inicio)");
                statement.setString(1, "%" + data + "%");
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
            }else{
                out.println("<hr>Coloque um número válido."); 
            }
        }
    %>
</html>
