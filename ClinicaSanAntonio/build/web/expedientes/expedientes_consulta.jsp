<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=3))){
      response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Expedientes de los Pacientes</title>

<%
    String sql = "select e.IDExpedientePaciente,e.nombrePaciente,e.sexo,DATE_FORMAT(e.fechaNacimiento,'%d-%m-%Y') as fechaNacimiento ,e.direccion,e.telefono,e.nombrePadre,e.nombreMadre from  expedientespacientes e ";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += "where (e.IDExpedientePaciente like '%" + valor1 + "%' or "
                + " e.nombrePaciente like '%" + valor1 + "%' or "
                + " e.direccion like '%" + valor1 + "%' or"
                + " e.sexo like '%" + valor1 + "%')";
    }
%>

<h1 class="tam">Listado Expedientes</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="expedientes_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li><a class="boton_personalizado" href="expedientes.jsp">Nuevo</a></li>
    </ul>
</div>
        
<br/>

<div id="mensajes" style="width: 50%;text-align: center; height: 14px">
    <%
        String result = request.getParameter("result");
        if(result != null){
            int r = Integer.parseInt(result);
            out.println(Operaciones.getMensaje(r));
        }
    %>
</div>

<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    
    //array que almacena el resultado de la consulta
    String [][] expedientes = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDExpediente", "Nombre Paciente","Sexo","Fecha de nacimiento","Direccion","Telefono","Nombre del Padre","Nombre de la Madre"
    };
    
    Tabla tab = new Tabla(expedientes, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("expedientes_operaciones.jsp");
    tab.setPaginaModificable("expedientes.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("expedientes.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado doctores");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>
<%}%>