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
            
            Roles rol1 = new Roles(1, "Administrador");
            Roles rol2 = new Roles(2, "Enfermera");
            Roles rol3 = new Roles(3, "Doctor/a");
            
            Conexion conexion = new ConexionPool();
            Operaciones.setConexion(conexion);
            
            int r1 = Operaciones.insertar(rol1);
            out.println(r1);
            
            int r2 = Operaciones.insertar(rol2);
            out.println(r2);
            
            int r3 = Operaciones.insertar(rol3);
            out.println(r3);
        %>
    </body>
</html>
