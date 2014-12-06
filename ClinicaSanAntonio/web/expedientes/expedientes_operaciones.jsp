<%@page import="java.text.ParseException"%>
<%@page import="java.sql.Date"%>
<% HttpSession sesion = request.getSession();%>
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
        int result = Operaciones.eliminar(new Expedientespacientes(), id);
        if(result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.ERROR_ELIMINAR);
        
    //verifica si es un registro nuevo
    }else if(request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        
        //Variables para la tabla DatosPaciente
        String idexpediente = request.getParameter("txtIDExpediente");
        String nombrePaciente = request.getParameter("txtNombrePaciente").toUpperCase();
        String tipoSangre=request.getParameter("txtTipoSangre").toUpperCase();
        String peso=request.getParameter("txtPeso").toUpperCase();
        String altura=request.getParameter("txtAltura").toUpperCase();
        String sexo = request.getParameter("opcSexo");
        String fechanacimiento=request.getParameter("fecha_nac"); //Covertir a tipo Date para poder insertar        
        String direccion = request.getParameter("txtDireccion").toUpperCase();
        String telefono = request.getParameter("txtTelefono");
        
        //Variables para la tabla Datos Familiares
        String nombreMadre = request.getParameter("txtNombreMadre").toUpperCase();
        String nombrePadre = request.getParameter("txtNombrePadre").toUpperCase();
      
      

        //Insertando en la tabla DatosPaciente
        Expedientespacientes expediente = new Expedientespacientes(idexpediente,
                                                                nombrePaciente, 
                                                                nombrePadre, nombreMadre,
                                                                tipoSangre, 
                                                                peso, 
                                                                altura,
                                                                sexo,
                                                                fechanacimiento,
                                                                direccion, 
                                                                telefono);
        
       
        if(sw_nuevo == 1){
            String result = Operaciones.insertar(expediente);
            try{
                 
              if(Integer.parseInt(result)>0)
                  response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.OK_INSERTAR);
              else
                response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }catch(Exception ex){
                 response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.ERROR_INSERTAR);
             }
        }else{
            //operacion actualizar
            int result = Operaciones.actualizar(expediente, idexpediente);
            if(result>0)
                response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("expedientes_consulta.jsp?result = " + Operaciones.ERROR_ACTUALIZAR);
            }
        }else{
        response.sendRedirect("doctores_consulta.jsp");
    }
%>
