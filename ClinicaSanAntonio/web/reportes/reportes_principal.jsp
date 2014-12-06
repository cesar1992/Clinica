<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Reportes</title>
<br>
<br>
<h3>Reportes que genera el Sistema:</h3><br>
<%
    String especialidades[][];
    String tiposcitas[][];
    tiposcitas = Operaciones.consultar("select * from tiposcitas"); 
    especialidades = Operaciones.consultar("select * from especialidades");
%>

<ul>
    <style>
        ul li{
            padding-top: 20px;
        }
    </style>
    <li><a href="/ClinicaSanAntonio/reportes/reportes.jsp" target="_blank">Todos los Usuarios del Sistema</a></li>
    <li><a href="/ClinicaSanAntonio/reportes/ultimas_citas.jsp" target="_blank">Ultimas Citas</a></li>
    <li><a href="/ClinicaSanAntonio/reportes/ultimas_consultas.jsp" target="_blank">Ultimas Consultas</a></li>
</ul>
<br>
<br>
<br>
<h3>Consultar doctores de una especialidad:</h3>
<form method="post" action="especialidades_doctor.jsp" target="_blank">
    <label>Seleccione la especialidad: </label>
    <select name="txtEspecialidad">
        <%for (int i=0; i<especialidades[0].length;i++){%>
                                    <option value="<%= especialidades[0][i] %>">
                                    <%= especialidades[1][i] %>
                                    </option>
        <% } %>
    </select>
    <input type="submit" value="Ver Reporte"/>
</form>
    
    <h3>Consultar todas las citas de acuerdo al tipo de Cita:</h3>
<form method="post" action="tiposcitas.jsp" target="_blank">
    <label>Seleccione el tipo de cita: </label>
    <select name="txtTipoCita">
        <%for (int i=0; i<tiposcitas[0].length;i++){%>
                                    <option value="<%= tiposcitas[0][i] %>">
                                    <%= tiposcitas[1][i] %>
                                    </option>
        <% } %>
    </select>
    <input type="submit" value="Ver Reporte"/>
</form>

<br/>

<jsp:include page="../_down.jsp"/>