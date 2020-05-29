<%-- 
    Document   : modificaMostrar
    Created on : 22/05/2020, 03:33:35 PM
    Author     : Isaac
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>



<!DOCTYPE html>
<html> 
    <%
        Connection conexion = null;
        Statement stm = null;
        ResultSet rs = null;
        Statement stm1 = null;
        ResultSet rs1 = null;
        Statement stm3 = null;
        ResultSet rs3 = null;
        Statement stm4 = null;
        ResultSet rs4 = null;
        Statement stm5 = null;
        ResultSet rs5 = null;
        Statement stm6 = null;
        ResultSet rs6 = null;

        Date date = new Date();
        String db = "hospital";
        String usr = "isaac";
        String pass = "123";
        String url = "jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123" + db;
        int id;
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select pacientes.id, genero.describeG, pacientes.nombreTutor, pacientes.nombre, pacientes.fecha, pacientes.edad, pacientes.especialidad, sangre.describeS,pacientes.domicilio, pacientes.telefono, pacientes.correo, pacientes.alergia, pacientes.emfermedad, pacientes.discapacidad, pacientes.radiografia,pacientes.fechaAlta, pacientes.descripcion, pacientes.fechaCita, confirma.describeC, estatus.describeE from pacientes inner join genero on genero.generoID = pacientes.generoFK inner join sangre on sangre.sangreID = pacientes.sangreFK inner join confirma on confirma.confirmaID = pacientes.confirmacionFK inner join estatus on estatus.estatusID = pacientes.estatusFK where id = " + id;
        String sql2 = "SELECT generoID, describeG FROM genero";
        String sql3 = "select pacientes.id, genero.describeG, pacientes.nombreTutor, pacientes.nombre, pacientes.fecha, pacientes.edad, pacientes.especialidad, sangre.describeS,pacientes.domicilio, pacientes.telefono, pacientes.correo, pacientes.alergia, pacientes.emfermedad, pacientes.discapacidad, pacientes.radiografia,pacientes.fechaAlta, pacientes.descripcion, pacientes.fechaCita, confirma.describeC, estatus.describeE from pacientes inner join genero on genero.generoID = pacientes.generoFK inner join sangre on sangre.sangreID = pacientes.sangreFK inner join confirma on confirma.confirmaID = pacientes.confirmacionFK inner join estatus on estatus.estatusID = pacientes.estatusFK where id = " + id;
        String sql4 = "SELECT sangreID, describeS FROM sangre";
        String sql5 = "SELECT confirmaID, describeC FROM confirma";
        String sql6 = "SELECT estatusID, describeE FROM estatus";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
            stm = conexion.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {

    %>
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
        <div class="container shadow p-3 mb-4 bg-white rounded form-control center-block border-0" style="width: 1038px; height: 1140px;">
            <form action="modifica.jsp" method="POST" class="form-control center-block border-0" style="width: 1000px; height: 1100px;">
                <div class="form-group">                    
                    <input type="hidden" name="id" value="<%= rs.getString(1)%>" class="form-control">
                </div>
                <hr>
                <div class="form-row">
                    <h3>Registro de pacientes</h3>
                </div>

                <h5>Datos personales</h5>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Nombre del paciente</label>
                        <input type="text" name="paciente" value="<%= rs.getString(4)%>" class="form-control">
                    </div>
                    
                    <div class="form-group col-md-6">
                        <label>Nombre del tutor</label>
                        <input type="text" name="tutor" value="<%= rs.getString(3)%>" class="form-control">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Edad</label>
                        <input type="text" name="edad" value="<%= rs.getString(6)%>" class="form-control">
                    </div>
                    <div class="form-group col-md-2">
                        <label>Genero</label>     
                        <select name="genero" class="form-control">
                            <%
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                stm1 = conexion.createStatement();
                                rs1 = stm.executeQuery(sql2);
                                while (rs1.next()) {
                            %>   

                            <option value="<%= rs1.getString(1)%>"> <%= rs1.getString(2)%>

                            </option>
                            <%
                                }
                            %>
                        </select>  
                    </div>

                    <%
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                        stm3 = conexion.createStatement();
                        rs3 = stm.executeQuery(sql3);
                        while (rs3.next()) {
                    %>   
                    <div class="form-group col-md-2">
                        <label for="datepicker">fecha de nacimiento</label>
                        <input type="text" name="nacimiento" id="datepicker" class="form-control" placeholder="<%= rs3.getString(5)%>" >
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Telefono</label>
                        <input type="text" name="telefono" value="<%= rs3.getString(10)%>" class="form-control">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Correo</label>
                        <input type="text" name="correo" value="<%= rs3.getString(11)%>" class="form-control">
                    </div>
                </div>
                <label>Domicilio</label>
                <input type="text" name="domicilio" value="<%= rs3.getString(9)%>" class="form-control">


                <br>
                <h5>Datos medicos</h5>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Enfermedad</label>
                        <input type="text" name="enfermedad" value="<%= rs3.getString(13)%>" class="form-control">        
                    </div>
                    <div class="form-group col-md-2">
                        <label>Discapacidad</label>
                        <input type="text" name="discapacidad" value="<%= rs3.getString(14)%>" class="form-control">        
                    </div>
                    <div class="form-group col-md-3">
                        <label for="datepicker1">fecha de alta</label>
                        <input type="text" name="alta" id="datepicker1" class="form-control" placeholder="<%= rs3.getString(16)%>" >
                    </div>
                </div>
                <%
                    }
                %>

                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Tipo de sangre</label>                    
                        <select name="sangre" class="form-control">
                            <%
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                stm4 = conexion.createStatement();
                                rs4 = stm.executeQuery(sql4);
                                while (rs4.next()) {
                            %>   

                            <option value="<%= rs4.getString(1)%>"> <%= rs4.getString(2)%>

                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <%
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                        stm3 = conexion.createStatement();
                        rs3 = stm.executeQuery(sql3);
                        while (rs3.next()) {
                    %>    

                    <div class="form-group col-md-5">
                        <label>Alergia</label>
                        <input type="text" name="alergia" value="<%= rs3.getString(12)%>" class="form-control">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Especialidad</label>
                        <input type="text" name="especialidad" value="<%= rs3.getString(7)%>" class="form-control">
                    </div>

                </div>

                <label for="exampleFormControlTextarea1">Descripcion</label>
                <textarea class="form-control" name="descripcion" rows="3"><%= rs3.getString(17)%></textarea>

                <br>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="radio">
                    <label class="custom-file-label" for="customFile">Elegir radiografia</label>
                </div>

                <br>
                <br>
                <h5>Estatus</h5>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="datepicker2">Proxima cita</label>
                        <input type="text" name="proxcita" id="datepicker2" class="form-control" placeholder="<%= rs3.getString(18)%>" >
                    </div>
                    <%
                        }
                    %>
                    <div class="form-group col-md-3">
                        <label>Confirmacion</label>                    
                        <select name="confirmacion" class="form-control">
                            <%
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                stm5 = conexion.createStatement();
                                rs5 = stm.executeQuery(sql5);
                                while (rs5.next()) {
                            %>   

                            <option value="<%= rs5.getString(1)%>"> <%= rs5.getString(2)%>

                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Estatus</label>                    
                        <select name="estatus" class="form-control">
                            <%
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                stm6 = conexion.createStatement();
                                rs6 = stm.executeQuery(sql6);
                                while (rs6.next()) {
                            %>   

                            <option value="<%= rs6.getString(1)%>"> <%= rs6.getString(2)%>

                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="form-inline float-right">
                    <a href="index.jsp">Regresar</a>&nbsp;&nbsp;&nbsp;
                    <input type="submit" name="updateEmpleado" value="Actualizar Información" class="btn btn-sm btn-success">

                </div>
            </form>

        </div>
        <%
            }
        %>
        <%} catch (SQLException ex) {
                
            } catch (ClassNotFoundException ex) {
                out.println("error del Driver:" + ex.getMessage());
            }
        %>

    </form>
</body>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function () {
        $("#datepicker").datepicker();
    });
    $(function () {
        $("#datepicker1").datepicker();
    });
    $(function () {
        $("#datepicker2").datepicker();
    });
    $(function () {
        $("#datepicker4").datepicker();
    });

</script>
</html>
