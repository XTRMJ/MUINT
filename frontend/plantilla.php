<?php
#include 'conn.php';
?>
<!DOCTYPE html>
<html>
<head>
<title>MUINT</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages':['corechart', 'controls']});
            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(buildChart);
            // Some raw data (not necessarily accurate)
            function buildChart(){
                // Some raw data (not necessarily accurate)
                var rowData1 = [['Hora', 'Robo/Casa', 'Robo/Civil', 'Robo/Vehiculo', 'Robo/Comercio',
                                'Promedio'],
                                ['05:00', 15, 9, 22, 8, 13.5],
                                ['06:00', 15, 12, 39, 18, 21],
                                ['07:00', 17, 17, 58, 7, 24.75],
                                ['08:00', 19, 11, 15, 28, 18.25],
                                ['09:00', 16, 19, 29, 26, 20]];
                var rowData2 = [['Hora', 'Robo/Casa', 'Robo/Civil', 'Robo/Vehiculo', 'Robo/Comercio',
                                'Promedio'],
                                ['05:00', 15, 38, 52, 9, 28.5],
                                ['06:00', 13, 10, 29, 18, 17.5],
                                ['07:00', 15, 16, 35, 13, 26],
                                ['08:00', 13, 10, 15, 8, 11.5],
                                ['09:00', 13, 16, 7, 9, 11.25]];
                var rowData3 = [['Hora', 'Robo/Casa', 'Robo/Civil', 'Robo/Vehiculo', 'Robo/Comercio',
                                'Promedio'],
                                ['05:00', 6, 3, 12, 8, 7.25],
                                ['06:00', 5, 2, 9, 6, 5.5],
                                ['07:00', 7, 8, 5, 7, 6.75],
                                ['08:00', 9, 7, 11, 9, 9],
                                ['09:00', 6, 5, 6, 2, 4.75]];
                var rowData4 = [['Hora', 'Robo/Casa', 'Robo/Civil', 'Robo/Vehiculo', 'Robo/Comercio',
                                'Promedio'],
                                ['05:00', 26, 8, 12, 8, 13.5],
                                ['06:00', 15, 12, 19, 16, 15.5],
                                ['07:00', 17, 3, 5, 7, 8],
                                ['08:00', 19, 4, 13, 9, 11.25],
                                ['09:00', 16, 5, 6, 2, 7.25]];
                var rowData5 = [['Hora', 'Robo/Casa', 'Robo/Civil', 'Robo/Vehiculo', 'Robo/Comercio',
                                'Promedio'],
                                ['05:00', 6, 3, 12, 8, 7.25],
                                ['06:00', 5, 2, 9, 6, 5.5],
                                ['07:00', 7, 8, 5, 7, 6.75],
                                ['08:00', 9, 7, 11, 9, 9],
                                ['09:00', 6, 5, 6, 2, 4.75]];
                // Create and populate the data tables.
                var data = [];
                data[0] = google.visualization.arrayToDataTable(rowData1);
                data[1] = google.visualization.arrayToDataTable(rowData2);
                data[2] = google.visualization.arrayToDataTable(rowData3);
                data[3] = google.visualization.arrayToDataTable(rowData4);
                data[4] = google.visualization.arrayToDataTable(rowData5);

                var options = {
                    width: 700,
                    height: 400,
                    vAxis: {title: "Cantidad"},
                    hAxis: {title: "Hora"},
                    seriesType: "bars",
                    series: {4: {type: "line"}},
                    animation:{
                        duration: 1000,
                        easing: 'out'
                    },
                };
                var current = 0;
                // Create and draw the visualization.
                var chart = new google.visualization.ComboChart(document.getElementById('visualization'));
                var button1 = document.getElementById('b1');
                var button2 = document.getElementById('b2');
                var button3 = document.getElementById('b3');
                var button4 = document.getElementById('b4');
                var button5 = document.getElementById('b5');
                var control = new google.visualization.ControlWrapper({
                    controlType: 'ChartRangeFilter',
                    containerId: 'control_div',
                    options: {
                        filterColumnIndex: 0
                    }
                });
                google.visualization.events.addListener(control, 'statechange', function () {
                    var state = control.getState();
                    var view = new google.visualization.DataView(dataOther);
                    view.setRows(view.getFilteredRows([{column: 0, minValue: state.range.start, maxValue: state.range.end}]));
                    table.setDataTable(view);
                    table.draw();
                });
                function drawChart() {
                    // Disabling the button while the chart is drawing.
                    button1.disabled = true;
                    google.visualization.events.addListener(chart, 'ready',
                        function() {
                            button1.disabled = false;
                        });
                    switch (current){
                      case 0:
                        options['title'] = 'Delitos en el Sector Norte de S.L.P.';                      
                        break;
                      case 1:
                        options['title'] = 'Delitos en el Sector Sur de S.L.P.';                      
                        break;
                      case 2:
                        options['title'] = 'Delitos en el Sector Centro de S.L.P.';                      
                        break;
                      case 3:
                        options['title'] = 'Delitos en el Sector Oriente de S.L.P.';                      
                        break;
                      case 4:
                        options['title'] = 'Delitos en el Sector Poniente de S.L.P.';                        
                        break;
                    }


                    chart.draw(data[current], options);
                }
                drawChart();

                var previewOptions = {
                    width: 175,
                    height: 100,
                    seriesType: "bars",
                    series: {4: {type: "line"}},
                };
                var chartN = new google.visualization.ComboChart(document.getElementById('sectorN'));
                var chartS = new google.visualization.ComboChart(document.getElementById('sectorS'));
                var chartC = new google.visualization.ComboChart(document.getElementById('sectorC'));
                var chartO = new google.visualization.ComboChart(document.getElementById('sectorO'));
                var chartP = new google.visualization.ComboChart(document.getElementById('sectorP'));
                function drawPreview() {
                    // Disabling the button while the chart is drawing.
                    chartN.draw(data[0], previewOptions);
                    chartS.draw(data[1], previewOptions);
                    chartC.draw(data[2], previewOptions);
                    chartO.draw(data[3], previewOptions);
                    chartP.draw(data[4], previewOptions);
                }
                drawPreview();
                button1.onclick = function() {
                    current = 0;
                    drawChart();
                }
                button2.onclick = function() {
                    current = 1;
                    drawChart();
                }
                button3.onclick = function() {
                    current = 2;
                    drawChart();
                }
                button4.onclick = function() {
                    current = 3;
                    drawChart();
                }
                button5.onclick = function() {
                    current = 4;
                    drawChart();
                }
            }

        </script>
</head>
<body class="w3-light-grey">
<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-left" >MUINT</span>
  <span class="w3-bar-item w3-right" >Dirección de Tecnologías Inteligencia Social </span>
  <span class="w3-bar-item w3-right" >Módulo de la Unidad de Inteligencia </span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="avatar.png" class="w3-circle w3-margin-right" style="width:68px; height: 68px;">
    </div>
    <div class="w3-col s5 w3-bar">
      <span>Bienvenido, <strong>Mike</strong></span><br>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="#" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  Subdirección de investigación y análisis</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Jefatura de análisis y explotación de la información ciudadana - datos de la barandilla</a>
    <a href="Mapa.html" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  Jefatura de política criminológica para la atención de delitos de mayor incidencia - datos de incidentes</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Subdirección de investigación y análisis</a>
    <br><br>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <a href="C:/Users/noeam/OneDrive/Documentos/GitHub/MUINT/frontend/plantilla.html"><h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5></a>
  </header>
  <!-- GraficasBotones -->
  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-black w3-padding-16">
        <div class="w3-center" id="sectorN" style="width:50%">
        </div>
        <div class="w3-center">
          <button class="w3-button w3-black" id="b1" >Sector Norte</button>
        </div>
        <span class="w3-opacity w3-medium">Lorem ipsum dolor sit<br>Lorem ipsum dolor sit<br>Lorem ipsum dolor sit</span>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-dark-grey w3-padding-16">
        <div class="w3-center" id="sectorS">
        </div>
        <div class="w3-center">
          <button class="w3-button w3-dark-grey" id="b2" >Sector Sur</button>
        </div>
        <span class="w3-opacity w3-medium">Lorem ipsum dolor sit<br>Lorem ipsum dolor sit<br>Lorem ipsum dolor sit</span>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-indigo w3-padding-16">
        <div class="w3-center" id="sectorC">
        </div>
        <div class="w3-center">
          <button class="w3-button w3-indigo" id="b3" >Sector Centro</button>
        </div>
        <span class="w3-opacity w3-medium">Lorem ipsum dolor sit<br>Lorem ipsum dolor sit<br>Lorem ipsum dolor sit</span>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-yellow w3-text-white w3-padding-16">
        <div class="w3-center" id="sectorO"></div>
        <div class="w3-center">
          <button class="w3-button w3-yellow" id="b4" >Sector Oriente</button>
        </div>
        <span class="w3-opacity w3-medium w3-text-black">Lorem ipsum dolor sit<br>Lorem ipsum dolor sit<br>Lorem ipsum dolor sit</span>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-white w3-text-black w3-padding-16">
        <div class="w3-center" id="sectorP"></div>
        <div class="w3-center">
          <button class="w3-button w3-white" id="b5" >Sector Poniente</button>
        </div>
        <span class="w3-opacity w3-medium w3-text-black">Lorem ipsum dolor sit<br>Lorem ipsum dolor sit<br>Lorem ipsum dolor sit</span>
      </div>
    </div>
  </div>
  <!-- FinBotones -->
  <!-- Contenedor Gráfica -->
  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third">
        <h5>Gráfica de Delitos</h5>
        <div id="visualization" style="width: 100%"></div>
      </div>
    </div>
  </div>
  <!-- Delitos Recientes -->
  <div class="w3-panel">
    <div class="w3-row-padding w3-blue-grey" style="margin:0 -16px">
      <h5>Incidentes Robo a Comercio (JPCADMI).</h5>
      <h5>Último Incidente Ocurrido: <span class="w3-opacity w3-medium">Miércoles 30 de Noviembre 2022, 22:12:31 Horas</span></h5>
      




      <?php
          #TODO:
          include 'conn.php';
          $conn = conn();
          if($conn){
            for($i=0;$i<3;$i++)
            echo '<div class="w3-third w3-blue-grey">
            <h5><span class="w3-opacity w3-medium">29/09/2022 - 21:12:11 Horas.</span></h5>
            <img src="https://www.elsoldepuebla.com.mx/policiaca/3ck1by-robo-oxxo-01.jpg/ALTERNATES/LANDSCAPE_1140/Robo%20Oxxo%2001.jpg" class="w3-center w3-margin-right" style="width:100%">
            <h5>Delito 1</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
            </div>';
            $query = "SELECT * FROM muint.usuario";
            $consulta = pg_query($query);
            if(pg_num_rows($consulta)>0){
                while($obj = pg_fetch_object($consulta)){
                    echo $obj->user."<br>";
                }
            }
          }
        ?>
    </div>
  </div>
  
  <div class="w3-container">
    <h5>Recent Users</h5>
    <ul class="w3-ul w3-card-4 w3-white">
      <li class="w3-padding-16">
        <img src="/w3images/avatar2.png" class="w3-left w3-circle w3-margin-right" style="width:35px">
        <span class="w3-xlarge">Mike</span><br>
      </li>
      <li class="w3-padding-16">
        <img src="/w3images/avatar5.png" class="w3-left w3-circle w3-margin-right" style="width:35px">
        <span class="w3-xlarge">Jill</span><br>
      </li>
      <li class="w3-padding-16">
        <img src="/w3images/avatar6.png" class="w3-left w3-circle w3-margin-right" style="width:35px">
        <span class="w3-xlarge">Jane</span><br>
      </li>
    </ul>
  </div>
  <hr>

  

  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
    <h4>FOOTER</h4>
    <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
  </footer>

  <!-- End page content -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>