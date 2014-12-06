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
            
            Permisos per1 = new Permisos(1, 1, 1);
            Permisos per2 = new Permisos(2, 1, 2);
            Permisos per3 = new Permisos(3, 2, 1);
             Permisos per4 = new Permisos(4, 2, 2);
            
            Conexion conexion = new ConexionPool();
            Operaciones.setConexion(conexion);
            
            int r1 = Operaciones.insertar(per1);
            out.println(r1);
            
            int r2 = Operaciones.insertar(per2);
            out.println(r2);
            
            int r3 = Operaciones.insertar(per3);
            out.println(r3);
            
            int r4 = Operaciones.insertar(per3);
            out.println(r4);
        %>
    </body>
</html>
