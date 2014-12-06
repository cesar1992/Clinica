<%@page import="sv.ClinicaSanAntonio.entidades.Entidad"%>
<%@page import="sv.ClinicaSanAntonio.entidades.Roles"%>
<%@page import="sv.ClinicaSanAntonio.procesos.ConexionPool"%>
<%@page import="sv.ClinicaSanAntonio.procesos.Operaciones"%>
<%@page import="sv.ClinicaSanAntonio.procesos.Conexion"%>
<%@page import="sv.ClinicaSanAntonio.entidades.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesi&oacute;n</title>
        <link rel="stylesheet" href="css/login.css" type="text/css" />

    </head>
    <body>
        <form id="start" action="login.jsp" method="post">
         <h1>Digite sus Datos</h1>
         <%
//          Conexion conn = new ConexionPool();
//            if(conn == null){
//               out.println("Error de conexion");
//           }
//            Operaciones.setConexion(conn);
//            Roles r = new Roles(1, "Administrador");
//
//            Operaciones.insertar(r);
//           Usuarios u = new Usuarios("admin", "Cesar", "Adonay", Entidad.getHash("admin"), "12345", "adasd@gmail.com", "123456", 1);
//
//           String a = Operaciones.insertar(u);
//         out.println(a);
//           HttpSession sesion = request.getSession();
//
//
//              String Mensaje[] = new String[3];
//              Mensaje[0] = "Usuario y/o contraseña incorrectos!!!<br>";
//               Mensaje[1] = "Ocurrio un error en la conexion, Intentelo de nuevo<br>";
//               String Error = request.getParameter("error");
//
//              if(Error != null)
//                    out.println("<center><font color=red size=2>" + Mensaje[Integer.parseInt(Error)] + "</font><br></center><br>");
//         %>
         <p>
            <label for="name">Usuario</label>
            <input id="name" type="text" name="txtUsuario">
         </p>
         <p>
            <label for="password">Contraseña</label>
            <input id="password" type="password" name="txtClave">
         </p>
         <p>
             <input class="submit" type="submit" value="Entrar" name="btnEntrar">
         </p>
      </form>
    </body>
</html>
