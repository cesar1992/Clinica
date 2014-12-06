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
        int result = Operaciones.eliminar(new Especialidades(), id);
        if(result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.ERROR_ELIMINAR);
    
    //verifica si es un registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idespecialidad = request.getParameter("txtIDEspecialidad");
        String especialidad = request.getParameter("txtEspecialidad");
        
      Especialidades e=new Especialidades(idespecialidad, especialidad);
        
        if(sw_nuevo == 1){
            String result = Operaciones.insertar(e);
            try{
                 
              if(Integer.parseInt(result)>0)
                  response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.OK_INSERTAR);
              else
                response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }catch(Exception ex){
                 response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }
        }else{
            //operacion actualizar
            int result = Operaciones.actualizar(e, idespecialidad);
            if(result>0)
                response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("especialidades_consulta.jsp?result = " + Operaciones.ERROR_ACTUALIZAR);
            }
        }else{
        response.sendRedirect("especialidades_consulta.jsp");
    }
%>