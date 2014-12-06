<% if(Integer.parseInt(session.getAttribute("Rol").toString())!=1){
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
    HashMap roles;
    String id = null;
    
    //bandera para manejar el tipo de operacion, insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de usuario enviado
    if(request.getParameter("id") != null){//Variable id del formulario?
        id = request.getParameter("id");
        //obtenemos el registro del usuario en base al IDUsuario
        roles = Operaciones.getRegistro(new Roles(), id);
       
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        roles = null;
  
    }   

%>

<jsp:include page="../_top.jsp"/>
<title>Registrar Roles</title>
<h1>Roles</h1><br/>


<div id="wrapper">
    <form name="form_doctores" action="roles_operaciones.jsp" method="post">
       <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/> 
        
            <table>
                <td>
                    <fieldset>
                        <legend>Complete la informacion</legend>
                        <div>ID Rol
                            <input type="text" name="txtIDRol" required="" maxlength="6" value="<%=roles!=null?roles.get("IDRol"):""%>" <%=sw_nuevo==0?"readonly='readonly'":""%>/></div>
                        <div>Rol
                            <input type="text" name="txtRol" required="" maxlength="35" value="<%=roles!=null?roles.get("Rol"):""%>"/></div>
                        
                    </fieldset>
                </td>
            </table>
                <input type="submit" value="Guardar" name="guardar"/>
                <a href="roles_consulta.jsp">Regresar</a>

    </form>
</div>           
<jsp:include page="../_down.jsp"/>
<%}%>
