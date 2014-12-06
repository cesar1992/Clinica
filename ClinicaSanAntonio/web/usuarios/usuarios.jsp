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
    
    //variable HashMap para obtener el registro del usuario en base a un ID cuando se requiera modificacion
    HashMap usuario;
    String roles[][];
    String id = null;
    
    //bandera para manejar el tipo de operacion, insertar=1, actualizar=0
    int sw_nuevo;
    
    //se verifica si hay un ID de usuario enviado
    if(request.getParameter("id") != null){//Variable id del formulario?
        id = request.getParameter("id");
        //obtenemos el registro del usuario en base al IDUsuario
        usuario = Operaciones.getRegistro(new Usuarios(), id);
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        usuario = null;
    }   
    roles = Operaciones.consultar("select * from Roles");
%>

<jsp:include page="../_top.jsp"/>

<title>Nuevo Usuario</title>

<h1>Usuarios</h1><br/>

<form name="form_usuarios" onsubmit="return validar();" action="usuarios_operaciones.jsp" method="post">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table">
        <thead>
            <tr>
                <th colspan="">Complete la Información</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>IDUsuario</td>
                <td><input type="text" name="txtIdusuario" id="txtIdusuario" value="<%= usuario!=null?usuario.get("IDUsuario"):""%>"<%=sw_nuevo==0?"readonly='readonly'":""%>/></td>
            </tr>
            <tr>
                <td>Nombres</td>
                <td><input type="text" name="txtNombres" id="txtNombres" value="<%= usuario!=null?usuario.get("nombres"):""%>" size="30"/></td>
            </tr>
            <tr>
                <td>Apellidos</td>
                <td><input type="text" name="txtApellidos" id="txtApellidos" value="<%= usuario!=null?usuario.get("apellidos"):""%>" size="30"/></td>
            </tr>
            <%if(usuario != null){%>
            <tr>
                <td colspan="2" style="font-weight: bolder">
                    Cambiar clave
                    <input type="checkbox" name="chkClave" id="chkClave" value="1" onchange="cambiar()"/>
                    <input type="hidden" name="old_clave" id="old_clave" value="<%= usuario.get("clave") %>"/>
                </td>
            </tr>
            <%}%>
            <tr>
                <td>Contraseña</td>
                <td><input type="password" name="txtClave" id="txtClave" value="<%=usuario!=null?usuario.get("clave"):""%>"/></td>
            </tr>
            <tr>
                <td>Confirmar Contraseña</td>
                <td><input type="password" name="txtConfirmar" id="txtConfirmar" value="<%=usuario!=null?usuario.get("clave"):""%>"/></td>
            </tr>
            <tr>
                <td>DUI</td>
                <td><input type="text" name="txtDUI" value="<%=usuario!=null?usuario.get("dui"):""%>" size="10" maxlength="10"/></td>
            </tr>
            <tr>
                <td>Correo</td>
                <td><input type="text" name="txtCorreo" value="<%=usuario!=null?usuario.get("correo"):""%>" size="40"/></td>
            </tr>
            <tr>
                <td>Telefono</td>
                <td><input type="text" name="txtTelefono" value="<%=usuario!=null?usuario.get("telefono"):""%>" maxlength="9" size="9" /></td>
            </tr>
            <tr>
                <td>Rol</td>
                <td>
                    <select name="cmbIdrol" id="cmbIdrol">
                        <%for (int i=0; i<roles[0].length;i++){%>
                        <option value="<%= roles[0][i] %>"
                                <% if (usuario!=null)
                                    if (roles[0][i]==usuario.get("IDRol"))
                                        out.println("selected"); %>
                                        >
                            <%= roles[1][i] %>
                            </option>
                            <% } %>
                    </select>
                </td>
            </tr>
        </tbody>
    </table>
    <br/>
    <div class="buttons">
        <ul>
            <li><input type="submit" value="Guardar" name="guardar"/></li>
            <li><a href="usuarios_consulta.jsp">Regresar</a></li>
        </ul>
    </div>
</form>
                    <script>
                        function validar(){
                            var usuario = document.getElementById('txtIdusuario');
                            var nombres = document.getElementById('txtNombres');
                            var apellidos = document.getElementById('txtApellidos');
                            var clave = document.getElementById('txtClave');
                            var confirmacion = document.getElementById('txtConfirmar');
                            var dui = document.getElementById('txtDUI');
                            var telefono = document.getElementById('txtTelefono');
                            var email = document.getElementById('txtCorreo');
                            
                            if (usuario.value.length===0){
                                usuario.focus();
                                alert("Digite usuario");
                                return false;
                            }
                            
                            if (nombres.value.length===0){
                                nombres.focus();
                                alert("Digite nombres");
                                return false;
                            }
                            
                            if (apellidos.value.length===0){
                                apellidos.focus();
                                alert("Digite apellidos");
                                return false;
                            }
                            
                            if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(email.value)){
                                email.focus();
                                alert("Correo incorrecto");
                                return false;
                            }
                            
                            if ((clave.value==="" && confirmacion.value==="") || (clave.value!==confirmacion.value)){
                                clave.focus();
                                alert("Las claves no coinciden o estan vacias");
                                return false;
                            }
                            
                            if (dui.value.length===0){
                                dui.focus();
                                alert("Digite DUI");
                                return false;
                            }
                            
                            if(telefono.value.length===0){
                                telefono.focus();
                                alert("Digite Telefono");
                                return false;
                            }
                            
                            return true;
                        }
                        
                        function cambiar(){
                            var chkClave = document.getElementById('chkClave');
                            var old_clave = document.getElementById('old_clave').value;
                            
                            if (chkClave.checked){
                                document.getElementById('txtClave').value = "";
                                document.getElementById('txtConfirmar').value = "";
                            }else{
                                document.getElementById('txtClave').value = old_clave;
                                document.getElementById('txtConfirmar').value = old_clave;
                            }
                        }
                    </script>
<jsp:include page="../_down.jsp"/>
<%}%>