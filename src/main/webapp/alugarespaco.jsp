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
    <div class="search-bar">
        
        <input type="text" id="search-name" placeholder="Nome do Espaço">
        <input type="date" id="search-start">
        <input type="date" id="search-end">
        <button id="search-btn">Buscar</button>
    </div>

    <div class="container">
        <!-- Lista de espaços -->
        <div class="spaces">
            <%
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    String sql = "SELECT * FROM espacos WHERE status='disponivel'";
                    stmt = conexao.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int idEspaco = rs.getInt("id");
                        String nome = rs.getString("nome");
                        String descricao = rs.getString("descricao");
                        int capacidade = rs.getInt("capacidade");
                        double preco = rs.getDouble("preco");
                        String dataInicio = rs.getString("data_inicio");  // Exemplo de data
                        String dataFim = rs.getString("data_fim"); // Exemplo de data
            %>
            <div class="space-card" data-id="<%= idEspaco %>" data-start="<%= dataInicio %>" data-end="<%= dataFim %>">
                <h3 class="space-name"><%= nome %></h3>
                <p><%= descricao %></p>
                <p>Capacidade: <%= capacidade %></p>
                <p>Preço: R$ <%= preco %></p>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conexao != null) conexao.close();
                }
            %>
        </div>

        <!-- Calendário -->
        <div id="calendar"></div>
    </div>
</body>
</html>
