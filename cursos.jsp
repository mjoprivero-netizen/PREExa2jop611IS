<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Catálogo de Cursos - IA Generativa</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-----------------------------BOOTSTRAP----------------------------->
                <!--Icono-->
                <link rel="Icon" type="img/png" href="img/logoicono.png">
                <!-- Google font -->
                <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
                <!-- Bootstrap -->
                <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
                <!-- Slick -->
                <link type="text/css" rel="stylesheet" href="css/slick.css"/>
                <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
                <!-- nouislider -->
                <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
                <!-- Font Awesome Icon -->
                <link rel="stylesheet" href="css/font-awesome.min.css">
                <!-- Custom stlylesheet -->
                <link type="text/css" rel="stylesheet" href="css/style.css"/>
                <!--Ventanas emergentes-->
                <link rel="stylesheet" type="text/css" href="css/ventanas.css">
        <!-----------------------------/BOOTSTRAP----------------------------->
    </head>
    <body>
        <!-- HEADER -------------------------------------------------------------------->
                <header>
                        <!-- MAIN HEADER -->
                        <div id="header">
                                <!-- container -->
                                <div class="container">
                                        <!-- row -->
                                        <div class="row">

                                                <!-- LOGO -->
                                                <div class="col-md-9">
                                                        <div class="header-logo">
                                                                <a href="#" class="logo">
                                                                        <img src="./img/logoTUVCH.png" alt="">
                                                                </a>
                                                        </div>
                                                </div>
                                                <!-- /LOGO -->

                                                <!-- ACCOUNT -->
                                                <div class="col-md-3 clearfix">
                                                        <div class="header-ctn">
                                                                <div class="container">
                                                                <ul class="header-links pull-right">               
                                                                <li><a href="index.html"><i class="fa fa-user-o"></i>Alumno: Maximiliano Jop</a></li>
                                                                </ul>
                                                                </div>
                                                        </div>
                                                </div>
                                                <!-- /ACCOUNT -->
                                        </div>
                                        <!-- row -->
                                </div>
                                <!-- container -->
                        </div>
                        <!-- /MAIN HEADER -->
                </header>
        <!-- /HEADER ------------------------------------------------------------------->

        <!-- NAVIGATION ---------------------------------------------------------------->
                <nav id="navigation">
                        <!-- container -->
                        <div class="container">
                                <!-- responsive-nav -->
                                <div id="responsive-nav">
                                        <!-- NAV -->
                                        <ul class="main-nav nav navbar-nav">
                                                <li><a href="index.html">Inicio</a></li>
                                                <li><a href="cursos.jsp">Catálogo (RF-001)</a></li>
                                                <li><a href="#openModal">Acerca de</a>
                                                    <div id="openModal" class="modalDialog">
                                                            <div id="contenidomod">
                                                                    <a href="#close" title="Close" class="close">X</a>
                                                                    <br><h1>Plataforma IA Generativa</h1>
                                                                    <p>Sistema web académico para la gestión de cursos, tips y recursos de Inteligencia Artificial.</p>
                                                            </div>
                                                    </div></li>
                                        </ul>
                                        <!-- /NAV -->
                                </div>
                                <!-- /responsive-nav -->
                        </div>
                        <!-- /container -->
                </nav>
        <!-- /NAVIGATION --------------------------------------------------------------->

        <!-- CONTENIDO PRINCIPAL: CATÁLOGO DE CURSOS (RF-001) -->
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Catálogo de Cursos (RF-001)</h3>
                            <p>Gestión de información de cursos de Inteligencia Artificial Generativa.</p>
                        </div>
                    </div>
                </div>

                <!-- FILA DE TARJETAS DINÁMICAS DESDE MYSQL -->
                <div class="row">
                    <%
                        try {
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM curso");
                            while(rs.next()) {
                    %>
                    <div class="col-md-4 col-xs-6" style="margin-bottom: 25px;">
                        <div class="panel panel-default" style="border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
                            <div class="panel-body">
                                <span class="label label-primary">ID Curso: <%= rs.getInt("id_curso") %></span>
                                <span class="pull-right text-muted" style="font-size: 12px;"><i class="fa fa-calendar"></i> <%= rs.getDate("fecha_inicio") %></span>
                                <h4 style="margin-top: 15px; font-weight: bold;"><%= rs.getString("nombre") %></h4>
                                <p class="text-muted"><%= rs.getString("descripcion") %></p>
                                <hr style="margin: 10px 0;">
                                <p style="font-size: 13px;"><strong class="text-danger">Requisitos:</strong> <%= rs.getString("requisitos") %></p>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                            rs.close();
                            stmt.close();
                            if(conn != null) conn.close();
                        } catch(Exception e) {
                            out.println("<div class='alert alert-danger'>Error al cargar cursos: " + e.getMessage() + "</div>");
                        }
                    %>
                </div>
                <!-- /FILA DE TARJETAS -->
            </div>
        </div>
        <!-- /CONTENIDO PRINCIPAL -->

        <!-- FOOTER -------------------------------------------------------------------->
                <footer id="footer">
                         <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Contáctanos</h3>
                                <p>Tecnológico Universitario del Valle de Chalco</p>
                                <ul class="footer-links">
                                    <li><i class="fa fa-map-marker"></i>Av. Tezozómoc s/n, Col. Alfredo Baranda, Valle de Chalco</li>
                                    <li><i class="fa fa-phone"></i>1708 5959</li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="col-md-3 col-xs-6">
                            <div class="footer" style="display: inline-block;">
                                <br><br><img src="img/logibero.png" style="display: inline-block;" width="200px">
                            </div>       
                        </div>
                        
                        <div class="col-md-3 col-xs-6">
                            <div class="footer" style="display: inline-block;">
                                <br><img src="img/logsuj.png" style="display: inline-block;" width="200px">
                            </div> 
                        </div>

                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <span class="copyright">
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> Universidad de Londres - Grupo 5001 | Todos los derechos reservados
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /bottom footer -->
                </footer>
        <!-- /FOOTER -------------------------------------------------------------------> 

        <!-- jQuery Plugins -->
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/slick.min.js"></script>
                <script src="js/nouislider.min.js"></script>
                <script src="js/jquery.zoom.min.js"></script>
                <script src="js/main.js"></script>
    </body>
</html>