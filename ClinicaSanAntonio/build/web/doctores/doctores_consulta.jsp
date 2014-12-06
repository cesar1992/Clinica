 <%  if(Integer.parseInt(session.getAttribute("Rol").toString())!=1){
     response.sendRedirect("../principal.jsp");
 }else{
   %> 

<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Doctores</title>

<%
    String sql = "SELECT d.IDDoctor,d.nombresDoctor,d.apellidosDoctor,d.direccion,d.telefono,e.especialidad FROM doctores d, especialidades e WHERE d.IDEspecialidad=e.IDEspecialidad ";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += " and (d.IDDoctor like '%" + valor1 + "%' or "
                + " d.nombresDoctor like '%" + valor1 + "%' or "
                + " d.apellidosDoctor like '%" + valor1 + "%' or"
                + " e.especialidad like '%" + valor1 + "%')";
    }
%>

<h1 class="tam">Listado Doctores</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="doctores_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li>
                <a class="boton_personalizado" href="doctores.jsp">Nuevo</a>
                <a class="boton_personalizado" href="/ClinicaSanAntonio/especialidades/especialidades_consulta.jsp">Especialidades</a>
        </li>
    
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
    String [][] doctores = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDDoctor", "Nombres", "Apellidos", "Direccion", "Telefono","Especialidad"
    };
    
    Tabla tab = new Tabla(doctores, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("doctores_operaciones.jsp");
    tab.setPaginaModificable("doctores.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("doctores.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado doctores");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>

<%}%>