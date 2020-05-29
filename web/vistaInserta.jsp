<%-- 
    Document   : index
    Created on : 7/05/2020, 07:57:57 PM
    Author     : Isaac
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>



<!DOCTYPE html>
<html>   
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
            <form action="inserta.jsp" method="POST" class="form-control center-block border-0" style="width: 1000px; height: 1100px;">
                <hr>
                <div class="form-row">
                    <h3>Registro de pacientes</h3>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <div class="form-group col-md-2"> 
                        <label>Fecha:</label>&nbsp;&nbsp;
                        <%
                            Connection conexion = null;
                            Statement stm = null;
                            ResultSet rs = null;
                            Date date = new Date();
                            String db = "hospital";
                            String usr = "isaac";
                            String pass = "123";
                            String url = "jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123" + db;
                            DateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                            String sql00 = "SELECT CONVERT(VARCHAR(10), GETDATE(), 103)";

                            try {
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                stm = conexion.createStatement();
                                rs = stm.executeQuery(sql00);

                                while (rs.next()) {
                        %>   

                        <input name="fecha" class="form-control" disabled value="<%= dateFormat.format(date)%>" required="required">

                        <%
                            }
                        %>
                        </select>
                        <%
                            } catch (SQLException ex) {
                                out.println("Error SQL: " + ex.getMessage());
                            } catch (ClassNotFoundException exe) {
                                out.println("Error de Driver: " + exe.getMessage());
                            }
                        %>     
                    </div>


                    <div class="form-group col-md-1"> 
                        <label>Folio:</label>&nbsp;
                        <%
                            String sql0 = "select id from pacientes order by id desc ";
                            try {
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                stm = conexion.createStatement();
                                rs = stm.executeQuery(sql0);

                                if (rs.next()) {
                        %>   
                        <input name="folio" class="form-control" disabled value="<%= rs.getInt("id") + 1%>">
                        <%
                            }
                        %>
                        </select>
                        <%
                            } catch (SQLException ex) {
                                out.println("Error SQL: " + ex.getMessage());
                            } catch (ClassNotFoundException exe) {
                                out.println("Error de Driver: " + exe.getMessage());
                            }
                        %>     
                    </div>
                </div>

                <h5>Datos personales</h5>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Nombre del paciente</label>
                        <input type="text" name="paciente" value="" class="form-control" required="required">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Nombre del tutor</label>
                        <input type="text" name="tutor" value="" class="form-control" required="required">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Edad</label>
                        <input type="text" name="edad" value="" class="form-control" required="required">
                    </div>
                    <div class="form-group col-md-2">
                        <label>Genero</label>     
                        <select name="genero" class="form-control">
                            <%
                                String sql = "SELECT generoID, describeG FROM genero";

                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                    stm = conexion.createStatement();
                                    rs = stm.executeQuery(sql);

                                    while (rs.next()) {
                            %>   
                            <option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                        <%
                            } catch (SQLException ex) {
                                out.println("Error SQL: " + ex.getMessage());
                            } catch (ClassNotFoundException exe) {
                                out.println("Error de Driver: " + exe.getMessage());
                            }
                        %>    
                    </div>

                    <div class="form-group col-md-2">
                        <label for="datepicker">fecha de nacimiento</label>
                        <input type="text" name="nacimiento" id="datepicker" class="form-control" placeholder="fecha nacimiento" required="required" >
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Telefono</label>
                        <input type="text" name="telefono" value="" class="form-control" required="required">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Correo</label>
                        <input type="text" name="correo" value="" class="form-control" required="required">
                    </div>
                </div>
                <label>Domicilio</label>
                <input type="text" name="domicilio" value="" class="form-control" required="required">


                <br>
                <h5>Datos medicos</h5>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Enfermedad</label>
                        <input type="text" name="enfermedad" value="" class="form-control" required="required">        
                    </div>
                    <div class="form-group col-md-2">
                        <label>Discapacidad</label>
                        <input type="text" name="discapacidad" value="" class="form-control" required="required">        
                    </div>
                    <div class="form-group col-md-3">
                        <label for="datepicker1">fecha de alta</label>
                        <input type="text" name="alta" id="datepicker1" class="form-control" placeholder="Fecha alta" required="required" >
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Tipo de sangre</label>                    
                        <select name="sangre" class="form-control">
                            <%
                                String sql7 = "SELECT sangreID, describeS FROM sangre";

                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                    stm = conexion.createStatement();
                                    rs = stm.executeQuery(sql7);

                                    while (rs.next()) {
                            %>   
                            <option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                        <%
                            } catch (SQLException ex) {
                                out.println("Error SQL: " + ex.getMessage());
                            } catch (ClassNotFoundException exe) {
                                out.println("Error de Driver: " + exe.getMessage());
                            }
                        %>     
                    </div>
                    <div class="form-group col-md-5">
                        <label>Alergia</label>
                        <input type="text" name="alergia" value="" class="form-control" required="required">
                    </div>
                    <div class="form-group col-md-5">
                        <label>Especialidad</label>
                        <input type="text" name="especialidad" value="" class="form-control" required="required">
                    </div>
                </div>

                <label for="exampleFormControlTextarea1">Descripcion</label>
                <textarea class="form-control" name="descripcion" rows="3"></textarea>

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
                        <input type="text" name="proxcita" id="datepicker2" class="form-control" placeholder="elige la fecha"  required="required">
                    </div>
                    <div class="form-group col-md-3">
                        <label>Confirmacion</label>                    
                        <select name="confirmacion" class="form-control">
                            <%
                                String sql3 = "SELECT confirmaID, describeC FROM confirma";
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                    stm = conexion.createStatement();
                                    rs = stm.executeQuery(sql3);

                                    while (rs.next()) {
                            %>   
                            <option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>

                            <%
                                }
                            %>
                        </select>
                        <%
                            } catch (SQLException ex) {
                                out.println("Error SQL: " + ex.getMessage());
                            } catch (ClassNotFoundException exe) {
                                out.println("Error de Driver: " + exe.getMessage());
                            }
                        %>     
                    </div>
                    <div class="form-group col-md-3">
                        <label>Estatus</label>                    
                        <select name="estatus" class="form-control">
                            <%
                                String sql4 = "SELECT estatusID, describeE FROM estatus";
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                                    stm = conexion.createStatement();
                                    rs = stm.executeQuery(sql4);

                                    while (rs.next()) {
                            %>   
                            <option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                        <%
                            } catch (SQLException ex) {
                                out.println("Error SQL: " + ex.getMessage());
                            } catch (ClassNotFoundException exe) {
                                out.println("Error de Driver: " + exe.getMessage());
                            }
                        %>     
                    </div>
                </div>
                <div class="form-inline float-right">

                    <a href="index.jsp">Regresar</a>&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Registrar paciente" class="btn btn-primary btn-success" >
                    </form>
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

                </script>
                
                </html>
