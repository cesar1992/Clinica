<% if(Integer.parseInt(session.getAttribute("Rol").toString())!=1){
     response.sendRedirect("../principal.jsp");
 }else{
   %> 
<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<%
    String sql = "SELECT u.IDUsuario, u.nombres, u.apellidos,"
                    + " u.dui, u.correo, u.telefono, r.rol "
                    + "FROM Usuarios u, Roles r "
                    + " WHERE u.IDRol = r.IDRol ";
    
    String valor1 = request.getParameter("txtBusqueda");
    
    if(valor1 != null){
        sql += "and (u.IDUsuario like '%" + valor1 + "%' or "
                + " u.nombres like '%" + valor1 + "%' or "
                + " u.apellidos like '%" + valor1 + "%')";
    }
%>

<title>Usuarios</title>

<h1 class="tam">Listado Usuarios</h1><br>

<script>
    window.onload = function() {
           document.getElementById("txtBusqueda").focus();
       };
</script>
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="usuarios_consulta.jsp" method="get">
        <input type="search" name="txtBusqueda" id="txtBusqueda" value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>
        <div class="buttons" >
            <ul>
                <li>
                    <a class="boton_personalizado" href="usuarios.jsp">Nuevo</a>
                    <a class="boton_personalizado" href="/ClinicaSanAntonio/roles/roles_consulta.jsp">Roles</a>
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
    String [][] usuarios = Operaciones.consultar(sql);
    
    String [] cabeceras = new String[]{
        "Usuario", "Nombres", "Apellidos", "DUI", "Correo", "Telefono", "Rol"
    };
    
    Tabla tab = new Tabla(usuarios, "90%", Tabla.STYLE.TABLE01, Tabla.ALIGN.CENTER, cabeceras);
    
    tab.setEliminable(true);
    tab.setModificable(true);
    tab.setPaginaEliminable("usuarios_operaciones.jsp");
    tab.setPaginaModificable("usuarios.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png");
    tab.setPaginaSeleccionable("usuarios.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado usuarios");
    String tabla01 = tab.getTabla();//Error de Servidor
    out.println(tabla01);
%>
<jsp:include page="../_down.jsp"/>
<%}%>
