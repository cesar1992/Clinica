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
        int result = Operaciones.eliminar(new Citas(), id);
        if(result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.ERROR_ELIMINAR);
    
    //verifica si es un registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        
        String idcita = request.getParameter("txtIDCita");
        String fecha = request.getParameter("fechaCita");
        String idexpediente = request.getParameter("txtExpediente");
        String idtipocita = request.getParameter("txtTipoCita");
        String estado = request.getParameter("txtEstado");
        HttpSession sesion = request.getSession();
        
        Citas c=new Citas(idcita, fecha, idexpediente,sesion.getAttribute("Usuario").toString(), idtipocita, estado);
        
        if(sw_nuevo == 1){
            String result = Operaciones.insertar(c);
            try{
                 
              if(Integer.parseInt(result)>0)
                  response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.OK_INSERTAR);
              else
                response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }catch(Exception ex){
                 response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }
        }else{
            //operacion actualizar
            int result = Operaciones.actualizar(c, idcita);
            if(result>0)
                response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("citas_consulta.jsp?result = " + Operaciones.ERROR_ACTUALIZAR);
            }
        }else{
        response.sendRedirect("citas_consulta.jsp");
    }
%>