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
        int result = Operaciones.eliminar(new ExamenesPacientes(), id);
        if(result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.ERROR_ELIMINAR);
    
    //verifica si es un registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        
        String idexamenPaciente = request.getParameter("txtIDExamenPaciente");
        String fecha = request.getParameter("fechaExamen");
        String resultado = request.getParameter("txtResultado");
        String idexamen = request.getParameter("txtExamen");
        String idcita = request.getParameter("txtCita");
        String iddoctor = request.getParameter("txtDoctor");
       
        
       
        
        ExamenesPacientes c=new ExamenesPacientes(idexamenPaciente, fecha, resultado, idexamen, idcita, iddoctor);
        String estado[][]=Operaciones.consultar("select * from citas c where c.IDCita="+idcita+"");
         
        
        if(sw_nuevo == 1){  
            try{
                
                Citas citas=new Citas(estado[0][0], estado[1][0], estado[2][0], estado[3][0], estado[4][0], "terminado");
                  
                String result = Operaciones.insertar(c);
                int r=Operaciones.actualizar(citas, idcita);
           
           
                 
              if(Integer.parseInt(result)>0 && r>0)
                  response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.OK_INSERTAR);
              else
                response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }catch(Exception ex){
                 response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }
        }else{
            //operacion actualizar
            int result = Operaciones.actualizar(c, idexamenPaciente);
            if(result>0)
                response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("examenes_consulta.jsp?result = " + Operaciones.ERROR_ACTUALIZAR);
            }
        }else{
        response.sendRedirect("examenes_consulta.jsp");
    }
%>