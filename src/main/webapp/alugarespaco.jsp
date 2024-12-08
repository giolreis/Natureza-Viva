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
    <script>
        $(document).ready(function () {
            let selectedSpaceId = null;

            // Initialize the calendar
            var calendar = new FullCalendar.Calendar($('#calendar')[0], {
                initialView: 'dayGridMonth',
                locale: 'pt-br',
                events: [],
            });
            calendar.render();

            // Handle space selection
            $('.space-card').click(function () {
                selectedSpaceId = $(this).data('id'); // Get the ID of the clicked space
                updateCalendar(selectedSpaceId);
            });

            // Handle search functionality
            $('#search-btn').click(function () {
                const name = $('#search-name').val().toLowerCase();
                const startDate = $('#search-start').val();
                const endDate = $('#search-end').val();

                // Filter spaces based on name and date range
                filterSpaces(name, startDate, endDate);
            });

            function filterSpaces(name, startDate, endDate) {
                $('.space-card').each(function () {
                    const spaceName = $(this).find('.space-name').text().toLowerCase();
                    const spaceStart = $(this).data('start');
                    const spaceEnd = $(this).data('end');

                    if (spaceName.includes(name)) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }

                    // Additional date filtering logic
                    if (startDate && endDate && (new Date(spaceStart) < new Date(endDate) && new Date(spaceEnd) > new Date(startDate))) {
                        $(this).show();
                    }
                });
            }

            function updateCalendar(spaceId) {
                // Request the events for the selected space
                $.ajax({
                    url: 'consultarAgendamentos.jsp', // Endpoint to get the availability for the selected space
                    data: { id: spaceId },
                    type: 'GET',
                    success: function (response) {
                        const events = JSON.parse(response);
                        calendar.removeAllEvents(); // Clear current events
                        calendar.addEventSource(events); // Add new events for the selected space
                    }
                });
            }
        });
    </script>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"><style>
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
    <h1>Encontre seu Espaço</h1>
    <table>
        <thead>
            <tr>
                <th>ID</td>
                <th>Espaço</th>
                <th>Capacidade</th>
                <th>Data Início</th>
                <th>Data Fim</th>
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
    String sql = "SELECT * FROM agendamentos a inner join espacos e on e.id = a.id_espaco inner join usuarios u on u.id = a.id_usuario where u.nome = 'placeholder'";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    // Iterar pelos resultados e gerar linhas da tabela
    while (rs.next()) {

        int id = rs.getInt("a.id");
        String espaco = rs.getString("e.nome");
        String capacidade = rs.getString("e.capacidade");
        String inicio = rs.getString("data_inicio");
        String fim = rs.getString("data_fim");
%>
        <tr>
            <td><%= id %></td>
            <td><%= espaco %></td>
            <td><%= capacidade %></td>
            <td><%= inicio %></td>
            <td><%= fim %></td>
        </tr>
<%
    }

    // Fechar recursos
    rs.close();
    stmt.close();
    conn.close();
%>
        </tbody>
        </table>

    <div class="search-bar">
        <form method="POST">
            <input type="int" id="search-name" name="id_agendamento" placeholder="0">
            <button type="submit" class="btn btn-success w-100">Registrar</button>
        </form>
    </div>

    <div class="container">
        <!-- Lista de espaços -->

        <!-- Calendário -->
    </div>

    <% 

        if(request.getMethod().equals("POST")){

            String id_agendamento=request.getParameter("id_agendamento");
            String username = (String) session.getAttribute("username");
            String id_user = (String) session.getAttribute("id");

            Class.forName("com.mysql.jdbc.Driver");
            PreparedStatement selectA = conexao.prepareStatement("select * from agendamentos where id_usuario = ? and status <> 'finalizado' and status <> 'cancelado'");
            selectA.setString(1, id_user);
            ResultSet rs_selectA = selectA.executeQuery();

            if(!rs_selectA.next()){
                try{
                    out.println(username);
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    PreparedStatement select = conexao.prepareStatement("select id from usuarios where nome = ?");
                    select.setString(1, username);
                    ResultSet rs_select = select.executeQuery();  

                    while (rs_select.next()) {

                        int id = rs_select.getInt("id");
                        out.println(id);
                        out.println(id_agendamento);
                        PreparedStatement update = conexao.prepareStatement("update agendamentos set id_usuario = ? where id = ?");
                        update.setInt(1, id);
                        update.setString(2, id_agendamento);
                        update.execute(); 
                        update.close();

                    }

                    select.close();		

                    out.println("Alteração salva com sucesso!");

                }catch (ClassNotFoundException erroClass){
                    out.println("Class Driver não foi localizado, erro = "+erroClass);}

                catch (SQLException e){
                    out.println("Erro na conexão ao banco de dados. Detalhes: " + e.getMessage());
                }
            }				
        }else{
            out.print("Não é possível realizar dois agendamentos ao mesmo tempo!");
        }

    %>
</body>
</html>
