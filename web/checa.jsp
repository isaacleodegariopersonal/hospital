<%-- 
    Document   : comprueba
    Created on : 29/05/2020, 01:49:53 AM
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
            boolean resultado = false;
            String user = request.getParameter("user");
            String contra = request.getParameter("contra");
            String sql = "select usuario, contrasena from usuario where usuario = '" + user + "' and contrasena = '" + contra + "'";

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DFM52BS\\SQLEXPRESS:1433; databaseName=hospital; user=isaac; password=123");
                stm = conexion.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    System.out.println("1");
                    if (rs.getString(1).equals(user) && rs.getString(2).equals(contra)) {
                        System.out.println("entro aca");
                        response.sendRedirect("index.jsp");
                    }
                }              
%>
        <div class="login-form">
            <form action="login.jsp" method="post">
                <h2 class="text-center">Contraseña incorrecta</h2>
                <h3 class="text-center">Vuelve a intentarlo</h3>     
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Regresar</button>
                </div>             
            </form>
        </div>
<%
            } catch (SQLException ex) {
                out.println("Error SQL: " + ex.getMessage());
            } catch (ClassNotFoundException exe) {
                out.println("Error de Driver: " + exe.getMessage());
            }
        %>
    </body>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <style type="text/css">
        body {
            color: #fff;
            background: #007BFF;
        }
        .form-control {
            min-height: 41px;
            background: #f2f2f2;
            box-shadow: none !important;
            border: transparent;
        }
        .form-control:focus {
            background: #e2e2e2;
        }
        .form-control, .btn {        
            border-radius: 2px;
        }
        .login-form {
            width: 350px;
            margin: 350px auto;
            text-align: center;
        }
        .login-form h2 {
            margin: 10px 0 25px;
        }
        .login-form form {
            color: #7a7a7a;
            border-radius: 3px;
            margin-bottom: 15px;
            background: #fff;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .login-form .btn {        
            font-size: 16px;
            font-weight: bold;
            background: #3598dc;
            border: none;
            outline: none !important;
        }
        .login-form .btn:hover, .login-form .btn:focus {
            background: #007bff;
        }
        .login-form a {
            color: #fff;
            text-decoration: underline;
        }
        .login-form a:hover {
            text-decoration: none;
        }
        .login-form form a {
            color: #7a7a7a;
            text-decoration: none;
        }
        .login-form form a:hover {
            text-decoration: underline;
        }
    </style>
</html>

