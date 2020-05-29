<%-- 
    Document   : modifica
    Created on : 22/05/2020, 06:06:53 PM
    Author     : Isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
            String db = "hospital";
            String usr = "isaac";
            String pass = "123";
            String url = "jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123" + db;
            System.out.println("entro");
            
            String folio = request.getParameter("id");
            
            String paciente = request.getParameter("paciente");
            String tutor = request.getParameter("tutor");
            int edad = Integer.parseInt(request.getParameter("edad"));
            int genero = Integer.parseInt(request.getParameter("genero"));
            String nacimiento = request.getParameter("nacimiento");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String domicilio = request.getParameter("domicilio");
            String enfermedad = request.getParameter("enfermedad");
            String discapacidad = request.getParameter("discapacidad");
            String alta = request.getParameter("alta");
            int sangre = Integer.parseInt(request.getParameter("sangre"));
            String alergia = request.getParameter("alergia");
            String especialidad = request.getParameter("especialidad");
            String descripcion = request.getParameter("descripcion");
            String proxcita = request.getParameter("proxcita");
            int confirmacion = Integer.parseInt(request.getParameter("confirmacion"));
            int estatus = Integer.parseInt(request.getParameter("estatus"));
            
            
            System.out.println(folio);
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
            

            String sql = "UPDATE pacientes set generoFK = '"+genero+"', nombreTutor = '"+tutor+"', nombre = '"+paciente+"', fecha = '"+nacimiento+"' , edad = '"+ edad +"', especialidad = '" + especialidad+ "', sangreFK = '"+ sangre +"', domicilio = '"+ domicilio +"', telefono = '"+ telefono +"', correo = '"+correo+"' , alergia = '"+alergia +"', emfermedad = '"+ enfermedad+ "' , discapacidad = '"+ discapacidad+"', fechaAlta = '"+ alta+ "',descripcion = '"+ descripcion +"', fechaCita = '"+ proxcita +"', confirmacionFK = '"+ confirmacion +"', estatusFK = '" + estatus+ "' where id = " + folio + "";
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