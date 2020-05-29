<%-- 
    Document   : elimina
    Created on : 22/05/2020, 02:49:20 PM
    Author     : Isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            int id;
            id = Integer.parseInt(request.getParameter("id"));
            String sql = "update pacientes set estatusFK = 2  WHERE ID = '" + id + "'";
            System.out.println("id = " + id);
            System.out.println(sql);
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

