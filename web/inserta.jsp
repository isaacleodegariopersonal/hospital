<%-- 
    Document   : inserta
    Created on : 9/05/2020, 12:10:10 AM
    Author     : Isaac
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            Connection conexion = null;
            Statement stm = null;
            ResultSet rs = null;

            String paciente = request.getParameter("paciente");
            String tutor = request.getParameter("tutor");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String genero = request.getParameter("genero");
            String nacimiento = request.getParameter("nacimiento");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String domicilio = request.getParameter("domicilio");
            String enfermedad = request.getParameter("enfermedad");
            String discapacidad = request.getParameter("discapacidad");
            String alta = request.getParameter("alta");
            String sangre = request.getParameter("sangre");
            String alergia = request.getParameter("alergia");
            String especialidad = request.getParameter("especialidad");
            String descripcion = request.getParameter("descripcion");
            String proxcita = request.getParameter("proxcita");
            String confirmacion = request.getParameter("confirmacion");
            String estatus = request.getParameter("estatus");

            System.out.println(paciente);
            System.out.println(tutor);
            System.out.println(edad);
            System.out.println(genero);
            System.out.println(nacimiento);
            System.out.println(telefono);
            System.out.println(correo);
            System.out.println(domicilio);
            System.out.println(enfermedad);
            System.out.println(discapacidad);
            System.out.println(alta);
            System.out.println(sangre);
            System.out.println(alergia);
            System.out.println(especialidad);
            System.out.println(descripcion);
            System.out.println(proxcita);
            System.out.println(confirmacion);
            System.out.println(estatus);

            int san = 1;
            if (sangre.equals("A+")) {
                san = 1;
            }
            if (sangre.equals("A-")) {
                san = 1;
            }
            if (sangre.equals("O+")) {
                san = 1;
            }
            if (sangre.equals("O+")) {
                san = 1;
            }

            int gen = 1;
            if (genero.equals("F")) {
                gen = 1;
            }
            if (genero.equals("M")) {
                gen = 2;
            }

            int conf = 1;
            if (confirmacion.equals("A")) {
                conf = 1;
            }
            if (confirmacion.equals("C")) {
                conf = 2;
            }
            if (confirmacion.equals("P")) {
                conf = 3;
            }

            int est = 1;
            if (estatus.equals("A")) {
                est = 1;
            }
            if (estatus.equals("B")) {
                est = 2;
            }
            if (estatus.equals("P")) {
                est = 3;
            }

            String sql = "insert into pacientes values (" + gen + ",'" + tutor + "','" + paciente + "','" + nacimiento + "'," + edad + ",'" + especialidad + "'," + san + ",'" + domicilio + "','" + telefono + "','" + correo + "','" + alergia + "','" + enfermedad + "','" + discapacidad + "',null,'" + alta + "','" + descripcion + "','" + proxcita + "'," + conf + ", " + est + ");";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");

                stm = conexion.createStatement();
                stm.executeUpdate(sql);
                response.sendRedirect("index.jsp");
            } catch (SQLException ex) {
                out.println("Error SQL: " + ex.getMessage());
            }

        %>
    </body>
</html>
