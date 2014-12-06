<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=2))){
      response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Examenes</title>

<%
    String sql = "select ep.IDExamenpaciente,e.examen,epa.nombrePaciente,CONCAT(d.nombresDoctor,' ',d.apellidosDoctor) as doctor,ep.resultado,ep.fecha,ep.IDCita"
    + " from examenespacientes ep, examenes e,citas c, expedientespacientes epa, doctores d "
    + " where ep.IDCita=c.IDCita and ep.IDExamen=e.IDExamen and ep.IDDoctor=d.IDDoctor and c.IDExpedientePaciente=epa.IDExpedientePaciente ";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += " and (e.examen like '%" + valor1 + "%' or "
                + " ep.fecha like '%" + valor1 + "%' or "
                + " epa.nombrePaciente like '%" + valor1 + "%')";
    }
%>

<h1>Lista de  consultas</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="examenes_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li><a href="examenes.jsp">Nuevo</a></li>
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
    String [][] examenes = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDExamenPaciente", "Examen", "Paciente","Doctor","Resultado"," Fecha","IDCita"
    };
    
    Tabla tab = new Tabla(examenes, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("examenes_operaciones.jsp");
    tab.setPaginaModificable("examenes.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("examenes.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado examenes");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>
<%}%>