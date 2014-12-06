<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=3))){
     response.sendRedirect("../principal.jsp");
 }else{
   %> 
<%@page import="java.util.HashMap" %>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>
<%@page import="sv.ClinicaSanAntonio.entidades.*" %>

<%
    //Creamos una variable para manejar la conexion pool
    Conexion conn = new ConexionPool();
    
    //Enviamos la variable de conexion a la claseoperaciones
    Operaciones.setConexion(conn);
    
    //variable HashMap para obtener el registro del pais en base a un ID cuando se requiera modificacion
    HashMap citas;
   String expedientes[][];
   String tipocitas[][];
    
    String id = null;
    
    //bandera para manejar el tipo de operacion, insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de usuario enviado
    if(request.getParameter("id") != null){//Variable id del formulario?
        id = request.getParameter("id");
        //obtenemos el registro del usuario en base al IDUsuario
        citas = Operaciones.getRegistro(new Citas(), id);
        
     
  
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        citas = null;
        
    }
       tipocitas = Operaciones.consultar("select * from tiposcitas");
        expedientes = Operaciones.consultar("select * from expedientespacientes");
%>

<jsp:include page="../_top.jsp"/>
<title>Registrar Citas</title>
<h1>Citas</h1><br/>


<div id="wrapper">
    <form name="form_doctores" action="citas_operaciones.jsp" method="post">
       <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/> 
        
            <table>
                <td>
                    <fieldset>
                        <legend>Complete la informacion</legend>
                        <div>ID Cita
                            <input type="text" name="txtIDCita" required="" maxlength="6" value="<%=citas!=null?citas.get("IDCita"):""%>" <%=sw_nuevo==0?"readonly='readonly'":""%>/></div>
                       <div>Fecha de la cita 
                                <input type="date" name="fechaCita" required="" value="<%=citas!=null?citas.get("fecha"):""%>"/></div><!--Cambiar a date para la BD-->
                        <div>Expediente Paciente
                              <select name="txtExpediente">
                                <%for (int i=0; i<expedientes[0].length;i++){%>
                                <option value="<%= expedientes[0][i] %>"
                                        <% if (citas!=null)
                                            if (expedientes[0][i]==citas.get("IDExpedientePaciente"))
                                                out.println("selected"); %>
                                                >
                                    <%= expedientes[0][i]+" "+expedientes[1][i] %>
                                    </option>
                                    <% } %>
                             </select>
                             
                             <div>Tipo de Cita
                            <select name="txtTipoCita">
                                <%for (int i=0; i<tipocitas[0].length;i++){%>
                                <option value="<%= tipocitas[0][i] %>"
                                        <% if (citas!=null)
                                            if (tipocitas[0][i]==citas.get("IDTipocita"))
                                                out.println("selected"); %>
                                                >
                                    <%= tipocitas[1][i] %>
                                    </option>
                                    <% } %>
                             </select>
                    <div>Estado
                            <input type="text" name="txtEstado" required="" maxlength="35" value="<%=citas!=null?citas.get("estado"):"pendiente"%>"/></div>                     

                            
                    </fieldset>
                </td>
            </table>
                <input type="submit" value="Guardar" name="guardar"/>
                <a href="citas_consulta.jsp">Regresar</a>

    </form>
</div>           
<jsp:include page="../_down.jsp"/>
<%}%>