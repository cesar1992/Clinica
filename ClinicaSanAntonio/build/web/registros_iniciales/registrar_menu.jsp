<%@page import="sv.ClinicaSanAntonio.procesos. *" %>
<%@page import="sv.ClinicaSanAntonio.entidades.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Conexion cn = new ConexionPool();
            cn.conectar();
            
            if(cn.getConexion() == null)
                out.println("No se conecto");
            else
                out.println("Se conecto");
            
            Menu men1 = new Menu(1, "Inicio", "#", 0);
            Menu men2 = new Menu(2, "Expediente", "#", 0);
            
            Conexion conexion = new ConexionPool();
            Operaciones.setConexion(conexion);
            
            int r1 = Operaciones.insertar(men1);
            out.println(r1);
            
             int r2 = Operaciones.insertar(men2);
            out.println(r2);
        %>
    </body>
</html>
