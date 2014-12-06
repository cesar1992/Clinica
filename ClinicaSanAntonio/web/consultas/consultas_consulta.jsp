<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=2))){
      response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Consultas</title>

<%
    String sql = "select c.IDConsulta,ep.nombrePaciente,CONCAT(d.nombresDoctor,d.apellidosDoctor) as doctor,c.sintomas,c.diagnostico,c.medicamento,c.IDCita,c.fechaConsulta "
            + "from consultas c, doctores d,citas ct,expedientespacientes ep where  c.IDDoctor=d.IDDoctor and c.IDCita=ct.IDCita and ep.IDExpedientePaciente=ct.IDExpedientePaciente ";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += " and (c.fechaConsulta like '%" + valor1 + "%' or "
                + " ep.nombrePaciente like '%" + valor1 + "%' or "
                + " c.diagnostico like '%" + valor1 + "%')";
    }
%>

<h1>Lista de  consultas</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="consultas_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li><a href="consultas.jsp">Nuevo</a></li>
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
    String [][] consultas = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDConsulta", "nombrePaciente", "doctor", "sintomas", "diagnostico","medicamento","IDcita","fechaConsulta"
    };
    
    Tabla tab = new Tabla(consultas, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("consultas_operaciones.jsp");
    tab.setPaginaModificable("consultas.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("consultas.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado consultas");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>
<%}%>