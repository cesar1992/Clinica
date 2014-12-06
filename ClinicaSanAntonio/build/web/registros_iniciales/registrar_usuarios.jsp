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
            
            Usuarios u = new Usuarios("admin", "Cesar", "Trigeros", Usuarios.getHash("admin"), "12345678-9", "@", "123456", 1);
            
            Conexion conexion = new ConexionPool();
            Operaciones.setConexion(conexion);
            
            int r = Operaciones.insertar(u);
            out.println(r);
        %>
    </body>
</html>
