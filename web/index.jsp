<%-- 
    Document   : menu
    Created on : 21/05/2020, 10:44:32 PM
    Author     : Isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body background="https://static.vecteezy.com/system/resources/previews/000/692/417/non_2x/white-and-gray-brick-perspective-with-shadow-vector.jpg">
        <!--BAR RA DE MENU-->

        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">Hospital</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="vistaInserta.jsp">Pacientes</a> 
                    <a class="nav-item nav-link" href="Control.jsp">Registros</a>
                    <a class="nav-item nav-link" href="mostrar.jsp">Buscar </a>
                </div>
            </div>
            <form class="form-inline my-2 my-lg-0" name="formulario" method="post" action="ResultBusqueda.jsp" >
                <input class="form-control mr-sm-2" type="search" placeholder="Nombre" aria-label="Search" name="buscar">
                <input class="form-control mr-sm-2" type="search" placeholder="Folio" aria-label="Search" name="folio">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
            </form>
        </nav>

        <br/><br/>

        <div class="container-fluid border-0" style="width: 1800px; height: px;">
            <div class="shadow p-3 mb-5 bg-white rounded" style="width: 1800px; height: px;">
                <div class="jumbotron text-center" style="background-image: url('https://besthqwallpapers.com/img/original/122190/stethoscope-on-keyboard-computer-repair-stethoscope-on-leptope-it-service-stethoscope.jpg'); width: 100%; height: 20vh;">
                    <h1 class="display-3">Hospital</h1>
                    <p>Control y administración de pacientes</p> 
                </div>
            </div>


            <div class="container-fluid border-0" style="width: 1800px; height: 750px;">
                <div class="shadow p-3 mb-5 bg-white rounded">
                    <div class="card-deck">
                        <div class="card">
                            <img class="card-img-top" src="https://www.flowww.net/hs-fs/hubfs/Q32019%20SEPTIEMBRE/BLOG/5-consejos-para-captar-mas-pacientes-para-tu-clinica-de-salud_flowww.jpg?width=1300&name=5-consejos-para-captar-mas-pacientes-para-tu-clinica-de-salud_flowww.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Registro de pacientes</h5>
                                <p class="card-text">Sección para registrar datos de pacientes</p>
                                <p class="card-text"><small class="text-muted"></small></p>
                                <form  name="formulario" method="post" action="vistaInserta.jsp">
                                    <button type="submit" class="btn btn-primary ">Registrar</button>
                                </form>
                            </div>
                        </div>
                        <div class="card">
                            <img class="card-img-top" src="https://image.freepik.com/foto-gratis/joven-medico-masculino-tableta-bata-blanca-estetoscopio-cuello-buscar-informacion-sobre-tratamiento-pacientes-hospital-o-clinica-concepto-medico-salud_4236-1646.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Buscar pacientes</h5>
                                <p class="card-text">Sección para buscar registros e historial del paciente</p>
                                <p class="card-text"><small class="text-muted"></small></p>
                                <form  name="formulario" method="post" action="mostrar.jsp">
                                    <button type="submit" class="btn btn-primary">Buscar</button>
                                </form>
                            </div>
                        </div>
                        <div class="card">
                            <img class="card-img-top" src="https://noticiasaldescubierto.com/wp-content/uploads/2018/12/Paciente.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Control del paciente</h5>
                                <p class="card-text">Sección para módificar datos y estatus del paciente</p>
                                <p class="card-text"><small class="text-muted"></small></p>
                                <form  name="formulario" method="post" action="Control.jsp">
                                <button type="submit" class="btn btn-primary">Control</button>
                                </form>
                            </div
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</html>
