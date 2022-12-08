
<!DOCTYPE html>
<html>
<head>
    <title>MUINT</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/estilo1.css">
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
                        width: 900,
                        height: 500,
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
                        width: 825,
                        height: 150,
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

<!-- Carrusel Barandilla -->
<div class="slideshow-container w3-row-padding w3-margin-bottom">
  <h5>Mas notorios</h5>
  <div class="mySlides fade">
    <div>
      <div class="w3-container w3-black w3-padding-16">
        <div class="w3-twothird">
          <img src="images/mugshot1.jpg" alt="mugshot1.jpg" width="80%">
        </div>
        <div class="w3-third">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet porta felis. Curabitur vehicula erat id euismod vulputate. Aliquam pharetra lacinia nibh sed venenatis. Proin aliquam neque eget odio tempus fermentum. Donec at lectus id nibh ultricies ullamcorper eget sit amet libero. Quisque eget massa ex. Etiam malesuada imperdiet venenatis. Duis convallis condimentum massa ut condimentum. Vivamus ac dictum ex.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="mySlides fade">
    <div>
      <div class="w3-container w3-black w3-padding-16">
        <div class="w3-twothird">
          <img src="images/mugshot2.jpeg" alt="mugshot2.jpeg" width="80%">
        </div>
        <div class="w3-third">
          <p>Quisque et nunc dignissim, ultrices eros vitae, posuere risus. Etiam non nibh sed quam eleifend interdum vitae sed felis. Aenean consectetur tincidunt venenatis. Suspendisse mi odio, auctor eget commodo ullamcorper, elementum vitae orci. Ut pretium leo sed ligula faucibus, congue volutpat velit fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi aliquet vulputate tellus, sodales semper libero bibendum a.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="mySlides fade">
    <div>
      <div class="w3-container w3-black w3-padding-16">
        <div class="w3-twothird">
          <img src="images/mugshot3.jpg" alt="mugshot3.jpg" width="80%">
        </div>
        <div class="w3-third">
          <p>Sed quis tortor vitae ligula congue lacinia. Nam consequat pellentesque hendrerit. Aenean sit amet nunc eu magna ornare accumsan. Nulla placerat, metus iaculis semper luctus, felis justo tempus magna, vel ullamcorper nulla erat at nisi. Sed ut dolor nec augue accumsan tincidunt et a ante. Sed tristique, ex vel interdum eleifend, nisl ligula vestibulum quam, sed dapibus sem massa at felis. Sed vitae mauris elit. Maecenas aliquet lacinia pellentesque. Cras dictum felis in nisl ultrices fringilla. Donec nec commodo est, vitae congue sem. Praesent vel felis nec nisi mollis semper vehicula sit amet arcu. Vivamus efficitur turpis eget quam elementum ultricies. Praesent a aliquet massa, non gravida augue.</p>
        </div>
      </div>
    </div>
  </div>

  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>
</div>

  <!-- Delitos Recientes -->
  <div class="w3-panel">
    <div class="w3-row-padding w3-blue-grey" style="margin:0 -16px">
      <h5>Mas recientes</h5>

      <div class="w3-third w3-blue-grey">
        <h5><span class="w3-opacity w3-medium"> - Frank Sinatra</span></h5>
        <img src="images/mugshot3.jpg" class="w3-center w3-margin-right" style="width:100%">
        <br>
        <p>Ut interdum tempor massa. Vestibulum non velit nec mauris mollis viverra. Nulla mattis vitae dui id auctor. Nam laoreet, sem sit amet ultricies rutrum, augue erat finibus diam, nec consequat orci sem vel lectus. Aenean laoreet nisi a tempus vulputate. Proin commodo dictum ex, scelerisque consectetur magna consequat ac. Quisque porttitor mauris ipsum, vitae rutrum dolor ultrices eget. Suspendisse laoreet, libero eu ultricies finibus, leo felis ultrices dui, id facilisis nunc turpis sed lectus. Curabitur pretium ac diam et fringilla. Donec nec elit ac nulla laoreet rutrum vel ac odio. Aenean non enim risus.</p>
      </div>

      <div class="w3-third w3-blue-grey">
        <h5><span class="w3-opacity w3-medium"> - Jhon Doe</span></h5>
        <img src="images/mugshot1.jpg" class="w3-center w3-margin-right" style="width:100%">
        <br>
        <p>Sed euismod sagittis magna, nec tempus sem fermentum ac. Integer massa sem, posuere eget velit sodales, ultricies sodales leo. Nunc tincidunt sem eu elit ultricies scelerisque. Aliquam non felis est. Donec id ligula quis turpis tincidunt ultrices. Nunc orci augue, mollis id molestie a, semper vel neque. Nam vestibulum sem orci, sed laoreet massa dignissim id. Praesent massa dolor, hendrerit a purus nec, aliquet ornare ipsum.</p>
      </div>

      <div class="w3-third w3-blue-grey">
        <h5><span class="w3-opacity w3-medium"> - Patricia Campbell</span></h5>
        <img src="images/mugshot2.jpeg" class="w3-center w3-margin-right" style="width:100%">
        <br>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet porta felis. Curabitur vehicula erat id euismod vulputate. Aliquam pharetra lacinia nibh sed venenatis. Proin aliquam neque eget odio tempus fermentum. Donec at lectus id nibh ultricies ullamcorper eget sit amet libero. Quisque eget massa ex. Etiam malesuada imperdiet venenatis. Duis convallis condimentum massa ut condimentum. Vivamus ac dictum ex.</p>
      </div>
    </div>
  </div>
    <br>
    <!-- 
      <?php 
      /*
        $servername="localhost";
        $username="root";
        $password="";
        $dbname="incidencia";

        $conn=new mysqli($servername,$username,$password,$dbname);

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
        SELECT CONCAT(p.ap,', ',p.nombre) as nombre, CONCAT(g.longitud,', ',g.latitud) as lugar, m.motivo as motivo
        FROM muint.personas as p, muint.geo as g, muint.motivo as m, muint.informacion as i, muint.aprehension as a
        WHERE p.id_personas=i.id_personas AND a.id_personas=p.id_personas AND a.id_geo=g.id_geo AND
        a.id_motivo=m.id_motivo ORDER BY 1 DESC LIMIT 1;
      */
      ?>
    -->

  <div class="w3-container w3-dark-grey w3-padding-32">
    <div class="w3-row">
      <div class="w3-container w3-third">
        <h5 class="w3-bottombar w3-border-green">Demographic</h5>
        <p>Language</p>
        <p>Country</p>
        <p>City</p>
      </div>
      <div class="w3-container w3-third">
        <h5 class="w3-bottombar w3-border-red">System</h5>
        <p>Browser</p>
        <p>OS</p>
        <p>More</p>
      </div>
      <div class="w3-container w3-third">
        <h5 class="w3-bottombar w3-border-orange">Target</h5>
        <p>Users</p>
        <p>Active</p>
        <p>Geo</p>
        <p>Interests</p>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
    <h4>FOOTER</h4>
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

<!--Scrip carrusel-->
  <script>
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html>
