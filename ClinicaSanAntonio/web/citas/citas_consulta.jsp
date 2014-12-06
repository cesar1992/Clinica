<% if(((Integer.parseInt(session.getAttribute("Rol").toString())!=1) && (Integer.parseInt(session.getAttribute("Rol").toString())!=3))){
     response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Citas</title>

<%
    String sql = "select c.IDCita,e.IDExpedientePaciente,e.nombrePaciente,c.fecha,tc.tipocita,c.estado,e.direccion from citas c,expedientespacientes e, usuarios u, tiposcitas tc where c.IDExpedientePaciente=e.IDExpedientePaciente and c.IDUsuario=u.IDUsuario and c.IDTipocita=tc.IDTipocita";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += " and (c.IDCita like '%" + valor1 + "%' or "
                + " c.fecha like '%" + valor1 + "%' or "
                + " e.IDExpedientePaciente like '%" + valor1 + "%' or"
                + " tc.tipocita like '%" + valor1 + "%' or"
                + " c.estado like '%" + valor1 + "%')";
    }
%>

<h1 class="tam">Lista de  citas</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="citas_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li><a class="boton_personalizado" href="citas.jsp">Nuevo</a></li>
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
    String [][] citas = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDCita", "Expediente", "Paciente", "Fecha", "Tipo de Cita","Estado","Direccion"
    };
    
    Tabla tab = new Tabla(citas, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("citas_operaciones.jsp");
    tab.setPaginaModificable("citas.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("citas.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado citas");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>
<%}%>