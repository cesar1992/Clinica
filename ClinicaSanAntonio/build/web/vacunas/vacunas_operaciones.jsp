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
        int result = Operaciones.eliminar(new Vacunaspacientes(), id);
        if(result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.ERROR_ELIMINAR);
    
    //verifica si es un registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        
        String idvacunapaciente = request.getParameter("txtIDVacunaPaciente");
        String idvacuna = request.getParameter("txtVacuna");
        String fecha = request.getParameter("fechaVacuna");
        String idcita = request.getParameter("txtCita");
      
       
        
       
        
        Vacunaspacientes c=new Vacunaspacientes(idvacunapaciente, idvacuna, fecha, idcita);
        String estado[][]=Operaciones.consultar("select * from citas c where c.IDCita="+idcita+"");
        
        
        if(sw_nuevo == 1){
            try{
             Citas citas=new Citas(estado[0][0], estado[1][0], estado[2][0], estado[3][0], estado[4][0], "terminado");
            
            String result = Operaciones.insertar(c);
            int r=Operaciones.actualizar(citas, idcita);
            
              if(Integer.parseInt(result)>0 && r>0)
                  response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.OK_INSERTAR);
              else
                response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }catch(Exception ex){
                 response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }
        }else{
            //operacion actualizar
            int result = Operaciones.actualizar(c, idvacunapaciente);
            if(result>0)
                response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("vacunas_consulta.jsp?result = " + Operaciones.ERROR_ACTUALIZAR);
            }
        }else{
        response.sendRedirect("vacunas_consulta.jsp");
    }
%>