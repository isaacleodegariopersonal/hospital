<%-- 
    Document   : ResultBusqueda
    Created on : 22/05/2020, 08:23:57 PM
    Author     : Isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </br>

        <%

            Connection conexion = null;
            Statement stm = null;
            ResultSet rs = null;
            String db = "hospital";
            String usr = "isaac";
            String pass = "123";
            String url = "jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123" + db;
            String busqueda = request.getParameter("buscar");
            String folio = request.getParameter("folio");

            String sql = "select pacientes.id, genero.describeG, pacientes.nombreTutor, pacientes.nombre, pacientes.fecha, pacientes.edad, pacientes.especialidad, sangre.describeS,pacientes.domicilio, pacientes.telefono, pacientes.correo, pacientes.alergia, pacientes.emfermedad, pacientes.discapacidad, pacientes.radiografia,pacientes.fechaAlta, pacientes.descripcion, pacientes.fechaCita, confirma.describeC, estatus.describeE from pacientes inner join genero on genero.generoID = pacientes.generoFK inner join sangre on sangre.sangreID = pacientes.sangreFK inner join confirma on confirma.confirmaID = pacientes.confirmacionFK inner join estatus on estatus.estatusID = pacientes.estatusFK where (nombre LIKE  '" + busqueda + "%')";
            String sql2 = "select pacientes.id, genero.describeG, pacientes.nombreTutor, pacientes.nombre, pacientes.fecha, pacientes.edad, pacientes.especialidad, sangre.describeS,pacientes.domicilio, pacientes.telefono, pacientes.correo, pacientes.alergia, pacientes.emfermedad, pacientes.discapacidad, pacientes.radiografia,pacientes.fechaAlta, pacientes.descripcion, pacientes.fechaCita, confirma.describeC, estatus.describeE from pacientes inner join genero on genero.generoID = pacientes.generoFK inner join sangre on sangre.sangreID = pacientes.sangreFK inner join confirma on confirma.confirmaID = pacientes.confirmacionFK inner join estatus on estatus.estatusID = pacientes.estatusFK where id = '" + folio + "'";

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                stm = conexion.createStatement();
                if (folio.equals("")) {
                    rs = stm.executeQuery(sql);
                }
                if (busqueda.equals("")) {
                    rs = stm.executeQuery(sql2);
                }
        %>

        <div class="shadow p-3 mb-5 bg-white rounded" style="width: 2250px; height: px;">
            <table class="table ">
                <tr>
                    <th class="text-center">Modifica</th>
                    <th class="text-center">Elimina</th>
                    <th class="text-center">No</th>
                    <th class="text-center">Genero</th>
                    <th class="text-center">Nombre tutor</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Fecha</th>
                    <th class="text-center">Edad</th>
                    <th class="text-center">Especialidad</th>
                    <th class="text-center">Tipo de sangre</th>
                    <th class="text-center">Domicilio</th>
                    <th class="text-center">Telefono</th>
                    <th class="text-center">Correo</th>
                    <th class="text-center">Alergia</th>
                    <th class="text-center">Enfermedad.</th>
                    <th class="text-center">Discapacidad</th>
                    <th class="text-center">Radiografia</th>
                    <th class="text-center">Fecha alta</th>
                    <th class="text-center">Descripcion</th>
                    <th class="text-center">Fecha cita</th>
                    <th class="text-center">Confirmacion</th>
                    <th class="text-center">Estatus</th>
                </tr>

                <%while (rs.next()) {%>
                <tr>
                    <td>
                        <a href="modificaMostrar.jsp?id=<%= rs.getString(1)%>" class="btn-warning btn-sm">Editar</a>
                    </td>
                    <td>
                        <a href="elimina.jsp?id=<%= rs.getString(1)%>" class="btn-danger btn-sm">Eliminar</a>                       
                    </td>
                    <td class="text-center"><%= rs.getString(1)%></td>
                    <td class="text-center"><%= rs.getString(2)%></td>
                    <td class="text-center"><%= rs.getString(3)%></td>
                    <td class="text-center"><%= rs.getString(4)%></td>
                    <td class="text-center"><%= rs.getString(5)%></td>
                    <td class="text-center"><%= rs.getString(6)%></td>
                    <td class="text-center"><%= rs.getString(7)%></td>
                    <td class="text-center"><%= rs.getString(8)%></td>
                    <td class="text-center"><%= rs.getString(9)%></td>
                    <td class="text-center"><%= rs.getString(10)%></td>
                    <td class="text-center"><%= rs.getString(11)%></td>
                    <td class="text-center"><%= rs.getString(12)%></td>
                    <td class="text-center"><%= rs.getString(13)%></td>
                    <td class="text-center"><%= rs.getString(14)%></td>
                    <td class="text-center"><%= rs.getString(15)%></td>
                    <td class="text-center"><%= rs.getString(16)%></td>
                    <td class="text-center"><%= rs.getString(17)%></td>
                    <td class="text-center"><%= rs.getString(18)%></td>
                    <td class="text-center"><%= rs.getString(19)%></td>
                    <td class="text-center"><%= rs.getString(20)%></td>

                </tr>
                <% } %>
            </table>

            <%
                } catch (SQLException ex) {
                    out.println("error de SQL:" + ex.getMessage());
                } catch (ClassNotFoundException ex) {
                    out.println("error del Driver:" + ex.getMessage());
                }
            %>
        </div>
    </body>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
