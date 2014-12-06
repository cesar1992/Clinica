<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>
<%@page import="sv.ClinicaSanAntonio.entidades.*" %>

<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    
    //variable para manejar el ID en una eliminacion
    String id = null;
    
    //operacion eliminar
    if(request.getParameter("id")!=null){
        id = request.getParameter("id");
        int result = Operaciones.eliminar(new Usuarios(), id);
        if(result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.ERROR_ELIMINAR);
    
    //verifica si es un registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idusuario = request.getParameter("txtIdusuario");
        String nombres = request.getParameter("txtNombres");
        String apellidos = request.getParameter("txtApellidos");
        String clave = request.getParameter("txtClave");
        String dui = request.getParameter("txtDUI");
        String correo = request.getParameter("txtCorreo");
        String telefono = request.getParameter("txtTelefono");
        String idrol = request.getParameter("cmbIdrol");
        
        Usuarios u = new Usuarios(idusuario, 
                                  nombres.toUpperCase(),
                                  apellidos.toUpperCase(), 
                                  Usuarios.getHash(clave), 
                                  dui, 
                                  correo,
                                  telefono,
                                  Integer.parseInt(idrol));
        if(sw_nuevo == 1){
            
            String result = Operaciones.insertar(u);
            try{
            if(Integer.parseInt(result) > 0)
                response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.OK_INSERTAR);
            else
                response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
            }catch(Exception ex){
                response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
            }
        }else{
           //operacion actualizar
            int result = Operaciones.actualizar(u, idusuario);
            if(result>0)
                response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("usuarios_consulta.jsp?result = " + Operaciones.ERROR_ACTUALIZAR);
        }
    }else{
        response.sendRedirect("usuarios_consulta.jsp");
    }
%>