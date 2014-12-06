<<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=3))){
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
    
    //Variable HashpMap para obtener elr egistro del expediente en base a un ID cuando se requiera modificacion
    HashMap expediente;
    String id = null;
    
    //bandera para manejar el tipo de operacion insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de pais enviado
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        //obtenemos el registro de expediente en base al ID
        expediente = Operaciones.getRegistro(new Expedientespacientes(), id);
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        expediente = null;
    }
%>

<jsp:include page="../_top.jsp"/>

<title>Crear expediente</title>
<h1>Pacientes</h1><br/>

<div id="wrapper">
    <form name="form_expedientes" action="expedientes_operaciones.jsp" method="post">
            <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/><!--Caja de texto oculta que envia 0 para actualizar o 1 para insertar-->
            <fieldset>
                <legend>Completar Formulario</legend>
                <table>
                    <td>
                        <fieldset>
                            <legend>Datos Personales</legend>
                            <div>Numero de Expediente
                                <input type="text" name="txtIDExpediente" required="" maxlength="20" value="<%=expediente!=null?expediente.get("IDExpedientePaciente"):""%>" <%=sw_nuevo==0?"readonly='readonly'":""%>/></div>
                            <div>Nombre
                                <input type="text" name="txtNombrePaciente" required="" maxlength="50" value="<%=expediente!=null?expediente.get("nombrePaciente"):""%>" /></div>
                            <div>Tipo de Sangre
                                <input type="text" name="txtTipoSangre" required="" maxlength="15" value="<%=expediente!=null?expediente.get("tipoSangre"):""%>" /></div>
                            <div>Peso
                                <input type="text" name="txtPeso" required="" maxlength="15" value="<%=expediente!=null?expediente.get("peso"):""%>" />Klg</div>
                            <div>Altura
                                <input type="text" name="txtAltura" required="" maxlength="15" value="<%=expediente!=null?expediente.get("altura"):""%>" />cm</div>
                                <div>Sexo 
                                <select name="opcSexo" value="<%=expediente!=null?expediente.get("sexo"):""%>"><option>Masculino</option><option>Femenino</option></select></div><br>                            
                            <div>Fecha de Nacimiento
                                <input type="date" name="fecha_nac" required="" value="<%=expediente!=null?expediente.get("fechaNacimiento"):""%>"/></div><!--Cambiar a date para la BD-->
                             <div>Direccion
                                  <input type="text" name="txtDireccion" required="" maxlength="15" value="<%=expediente!=null?expediente.get("direccion"):""%>" /></div>
                            <div>Telefono
                                  <input type="text" name="txtTelefono" required="" maxlength="15" value="<%=expediente!=null?expediente.get("telefono"):""%>" /></div>
                        </fieldset> 
                    </td>
                    <td>
                        <fieldset>
                            <legend>Datos Familiares</legend>
                            <div>Nombre de la Madre<input type="text" name="txtNombreMadre" placeholder="" required="" maxlength="35" value="<%=expediente!=null?expediente.get("nombreMadre"):""%>" /></div>
                            <div>Nombre del  Padre<input type="text" name="txtNombrePadre" placeholder="" required="" maxlength="35" value="<%=expediente!=null?expediente.get("nombrePadre"):""%>" /></div>
                        </fieldset> 
                    </td>
                </table>
                <input type="submit" value="Registrar" name="guardar"/>
                <a href="expedientes_consulta.jsp">Regresar</a>
            </fieldset>    
        </form>
    </div>

<jsp:include page="../_down.jsp"/>
<%}%>