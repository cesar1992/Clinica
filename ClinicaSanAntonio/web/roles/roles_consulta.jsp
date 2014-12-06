<% if(Integer.parseInt(session.getAttribute("Rol").toString())!=1){
     response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Doctores</title>

<%
    String sql = "select * from roles r";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += " where r.IDRol like '%" + valor1 + "%' or "
            + " r.Rol like '%" + valor1 + "%'";
    }
%>

<h1 class="tam">Listado Roles</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>

<div class="busqueda" style="width: 90%; text-align: right">
    <form action="roles_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        
<div class="buttons" >
    <ul>
        <li>
                <a class="boton_personalizado" href="roles.jsp" class="buttons">Nuevo</a>
                <a class="boton_personalizado" href="/ClinicaSanAntonio/usuarios/usuarios_consulta.jsp" class="buttons">Usuarios</a>
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
    String [][] roles = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "IDRol", "Rol"
    };
    
    Tabla tab = new Tabla(roles, "95%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("roles_operaciones.jsp");
    tab.setPaginaModificable("roles.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("roles.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado ROles");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>

<jsp:include page="../_down.jsp"/>
<%}%>