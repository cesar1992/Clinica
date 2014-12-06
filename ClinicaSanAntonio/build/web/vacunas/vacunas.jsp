<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=2))){
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
    HashMap vacunas;
    String doctores[][];
    String citas[][];
    String expedientes[][];
    String vac[][];
    String id = null;
    
    //bandera para manejar el tipo de operacion, insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de usuario enviado
    if(request.getParameter("id") != null){//Variable id del formulario?
        id = request.getParameter("id");
        //obtenemos el registro del usuario en base al IDUsuario
        vacunas = Operaciones.getRegistro(new Vacunaspacientes(), id);
       
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        vacunas=null;
        doctores = null;
        citas = null;
        expedientes=null;
    }   
     doctores = Operaciones.consultar("select * from doctores");
     citas = Operaciones.consultar("select * from citas c where c.estado='pendiente' and c.IDTipocita=3");
     vac=Operaciones.consultar("select * from vacunas");
%>

<jsp:include page="../_top.jsp"/>
<title>Registrar Vacuna</title>
<h1>Vacunas</h1><br/>


<div id="wrapper">
    <form name="form" action="vacunas_operaciones.jsp" method="post">
       <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/> 
        
            <table>
                <td>
                    <fieldset>
                        <legend>Complete la informacion</legend>
                        <div>ID Vacuna
                            <input type="text" name="txtIDVacunaPaciente" required="" maxlength="6" value="<%=vacunas!=null?vacunas.get("IDVacunaPaciente"):""%>" <%=sw_nuevo==0?"readonly='readonly'":""%>/></div>
                       <div>Fecha de Vacunacion 
                              <input type="date" name="fechaVacuna" required="" value="<%=vacunas!=null?vacunas.get("fecha"):""%>"/></div><!--Cambiar a date para la BD-->
                       <div>Tipo de Vacuna
                             <select name="txtVacuna" id="cmbIdDoctor">
                                <%for (int i=0; i<vac[0].length;i++){%>
                                    <option value="<%= vac[0][i] %>"
                                        <% if (vacunas!=null)
                                            if (vac[0][i]==vacunas.get("IDExamen"))    
                                                out.println("selected"); %>
                                                >
                                    <%= vac[1][i] %>
                                    </option>
                                 <% } %>
                            </select>
                          
                             <div>Cita-Paciente
                             <select name="txtCita" id="cmbIdCita">
                                <%String idCita,paciente;
                                for (int i=0; i<citas[0].length;i++){
                               
                                 expedientes =Operaciones.consultar("select e.IDExpedientePaciente,e.nombrePaciente from expedientespacientes e, citas c"
                                         + " where c.IDExpedientePaciente=e.IDExpedientePaciente and c.IDCita="+citas[0][i]+""); 
                                // paciente=expedientes.get("nombrePaciente").toString();
                                  %>
                                    <option value="<%= citas[0][i]  %>"
                                        <% if (vacunas!=null)
                                            if (citas[0][i]==vacunas.get("IDCita"))
                                                out.println("selected");
                                            %>
                                                >
                                        <%= citas[0][i]+" " +expedientes[1][0].toString() %>
                                    </option>
                                    
                                 <% } %>
                            </select>
                         
                            
                      
                    </fieldset>
                </td>
            </table>
                <input type="submit" value="Guardar" name="guardar"/>
                <a href="vacunas_consulta.jsp">Regresar</a>

    </form>
</div>           
<jsp:include page="../_down.jsp"/>
<%}%>