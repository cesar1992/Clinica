<%@page import="sv.ClinicaSanAntonio.entidades.Entidad" %>
<%@page import="sv.ClinicaSanAntonio.entidades.Usuarios" %> 
<%@page import="sv.ClinicaSanAntonio.procesos.Operaciones" %>
<%@page import="java.util.HashMap" %>
<%@page import="sv.ClinicaSanAntonio.procesos.ConexionPool" %>
<%@page import="sv.ClinicaSanAntonio.procesos.Conexion" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>

<%
    String usuario = request.getParameter("txtUsuario");
    String clave = request.getParameter("txtClave");   
    if(usuario == null)
        usuario = "";
    if (clave == null)
        clave = "";
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    
    if(conn == null){
        response.sendRedirect("/ClinicaSanAntonio/index.jsp?error=1");
    }else{
        HttpSession sesion = request.getSession();
        HashMap<String, String> hpUsuario = new HashMap();
        hpUsuario = Operaciones.getRegistro(new Usuarios(), usuario);
        if(hpUsuario!=null){
            String SClave = hpUsuario.get("clave")==null?"":hpUsuario.get("clave");
            if(SClave.equals(Entidad.getHash(clave))){
                sesion.setAttribute("Usuario", hpUsuario.get("IDUsuario"));
                sesion.setAttribute("Nombre", hpUsuario.get("nombres") + " " + hpUsuario.get("apellidos"));
                sesion.setAttribute("Rol", hpUsuario.get("IDRol"));
                response.sendRedirect("principal.jsp");
            }else{
                response.sendRedirect("/ClinicaSanAntonio/index.jsp?error=0");
            }
        }else{
            response.sendRedirect("/ClinicaSanAntonio/index.jsp?error=0");
        }
    }
%>