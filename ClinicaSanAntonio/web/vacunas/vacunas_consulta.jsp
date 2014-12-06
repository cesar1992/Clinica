<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=2))){
      response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Vacunacion</title>

<%
    String sql = "select vp.IDVacunaPaciente,v.nombre,ep.nombrePaciente,vp.fecha,vp.citas_IDCita "
            + " from vacunas v, vacunaspacientes vp, citas c, expedientespacientes ep "
            + "where vp.IDVacuna=v.IDVacuna and vp.citas_IDCita=c.IDCita and c.IDExpedientePaciente=ep.IDExpedientePaciente ";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += " and (v.nombre like '%" + valor1 + "%' or "
                + " ep.nombrePaciente like '%" + valor1 + "%' or "
                + " vp.fecha like '%" + valor1 + "%')";
    }
%>

<h1>Lista de  Vacunacion</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="vacunas_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li><a href="vacunas.jsp">Nuevo</a></li>
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
    String [][] vacunas = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDVacunaPaciente", "Vacuna", "Paciente", "Fecha","IDcita"
    };
    
    Tabla tab = new Tabla(vacunas, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("vacunas_operaciones.jsp");
    tab.setPaginaModificable("vacunas.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("vacunas.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado vacunas");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>
<%}%>