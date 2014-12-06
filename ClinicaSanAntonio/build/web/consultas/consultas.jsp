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
    HashMap consultas;
    String doctores[][];
    String citas[][];
    String expedientes[][];
    
    String id = null;
    
    //bandera para manejar el tipo de operacion, insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de usuario enviado
    if(request.getParameter("id") != null){//Variable id del formulario?
        id = request.getParameter("id");
        //obtenemos el registro del usuario en base al IDUsuario
        consultas = Operaciones.getRegistro(new Consultas(), id);
       
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        consultas=null;
        doctores = null;
        citas = null;
        expedientes=null;
    }   
     doctores = Operaciones.consultar("select * from doctores");
     citas = Operaciones.consultar("select * from citas c where c.estado='pendiente' and c.IDTipocita=2 ");
     
%>

<jsp:include page="../_top.jsp"/>
<title>Registrar Consulta</title>
<h1>Consultas</h1><br/>


<div id="wrapper">
    <form name="form" action="consultas_operaciones.jsp" method="post">
       <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/> 
        
            <table>
                <td>
                    <fieldset>
                        <legend>Complete la informacion</legend>
                        <div>ID Consulta
                            <input type="text" name="txtIDConsulta" required="" maxlength="6" value="<%=consultas!=null?consultas.get("IDConsulta"):""%>" <%=sw_nuevo==0?"readonly='readonly'":""%>/></div>
                       <div>Fecha de la consulta 
                              <input type="date" name="fechaConsulta" required="" value="<%=consultas!=null?consultas.get("fechaConsulta"):""%>"/></div><!--Cambiar a date para la BD-->
                       <div>Doctor
                             <select name="txtDoctor" id="cmbIdDoctor">
                                <%for (int i=0; i<doctores[0].length;i++){%>
                                    <option value="<%= doctores[0][i] %>"
                                        <% if (consultas!=null)
                                            if (doctores[0][i]==consultas.get("IDDoctor"))    
                                                out.println("selected"); %>
                                                >
                                    <%= doctores[1][i] %>
                                    </option>
                                 <% } %>
                            </select>
                               <div>Cita-Paciente
                             <select name="txtCita" id='cmbIdCita'>
                                <%String idCita,paciente;
                                for (int i=0; i<citas[0].length;i++){
                               
                                 expedientes =Operaciones.consultar("select e.IDExpedientePaciente,e.nombrePaciente from expedientespacientes e, citas c"
                                         + " where c.IDExpedientePaciente=e.IDExpedientePaciente and c.IDCita="+citas[0][i]+""); 
                                // paciente=expedientes.get("nombrePaciente").toString();
                                  %>
                                    <option value="<%= citas[0][i]  %>"
                                        <% if (consultas!=null)
                                            if (citas[0][i]==consultas.get("IDCita"))
                                                out.println("selected");
                                            %>
                                                >
                                        <%= citas[0][i]+" " +expedientes[1][0].toString() %>
                                    </option>
                                 <% } %>
                            </select>
                         
                            
                      
                            <div>Sintomas
                            <input type="text" name="txtSintomas" required="" maxlength="35" value="<%=consultas!=null?consultas.get("sintomas"):""%>"/></div>
                        <div>Diagnostico
                            <input type="text" name="txtDiagnostico" required="" maxlength="35" value="<%=consultas!=null?consultas.get("diagnostico"):""%>"/></div>                     
                        <div>Medicamento
                            <input type="text" name="txtMedicamento" required="" maxlength="150" value="<%=consultas!=null?consultas.get("medicamento"):""%>" /></div>
                     
                          
                    </fieldset>
                </td>
            </table>
                <input type="submit" value="Guardar" name="guardar"/>
                <a href="consultas_consulta.jsp">Regresar</a>

    </form>
</div>           
<jsp:include page="../_down.jsp"/>
<%}%>