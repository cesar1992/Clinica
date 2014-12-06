 <%  if(Integer.parseInt(session.getAttribute("Rol").toString())!=1){
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
    HashMap doctores;
    String especialidades[][];
    String id = null;
    
    //bandera para manejar el tipo de operacion, insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de usuario enviado
    if(request.getParameter("id") != null){//Variable id del formulario?
        id = request.getParameter("id");
        //obtenemos el registro del usuario en base al IDUsuario
        doctores = Operaciones.getRegistro(new Doctores(), id);
       
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        doctores = null;
        especialidades = null;
    }   
     especialidades = Operaciones.consultar("select * from especialidades");
%>

<jsp:include page="../_top.jsp"/>
<title>Registrar Doctor</title>
<h1>Doctores</h1><br/>


<div id="wrapper">
    <form name="form_doctores" action="doctores_operaciones.jsp" method="post">
       <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/> 
        
            <table>
                <td>
                    <fieldset>
                        <legend>Complete la informacion</legend>
                        <div>Codigo Medico
                            <input type="text" name="txtIDDoctor" required="" maxlength="6" value="<%=doctores!=null?doctores.get("IDDoctor"):""%>" <%=sw_nuevo==0?"readonly='readonly'":""%>/></div>
                        <div>Nombres
                            <input type="text" name="txtNombresDoctor" required="" maxlength="35" value="<%=doctores!=null?doctores.get("nombresDoctor"):""%>"/></div>
                        <div>Apellidos
                            <input type="text" name="txtApellidosDoctor" required="" maxlength="35" value="<%=doctores!=null?doctores.get("apellidosDoctor"):""%>"/></div>                     
                        <div>Direccion
                            <input type="text" name="txtDireccion" required="" maxlength="150" value="<%=doctores!=null?doctores.get("direccion"):""%>" /></div>
                        <div>Telefono
                            <input type="tel" name="txtTelefono" required="" maxlength="9" value="<%=doctores!=null?doctores.get("telefono"):""%>" /></div>
                        <div>Especialidad
                             <select name="txtEspecialidad" id="cmbIdEspecialidad">
                                <%for (int i=0; i<especialidades[0].length;i++){%>
                                    <option value="<%= especialidades[0][i] %>"
                                        <% if (doctores!=null)
                                            if (especialidades[0][i]==doctores.get("IDEspecialidad"))
                                                out.println("selected"); %>
                                                >
                                    <%= especialidades[1][i] %>
                                    </option>
                                 <% } %>
                            </select>
                    </fieldset>
                </td>
            </table>
                <input type="submit" value="Guardar" name="guardar"/>
                <a href="doctores_consulta.jsp">Regresar</a>

    </form>
</div>           
<jsp:include page="../_down.jsp"/>
<%}%>