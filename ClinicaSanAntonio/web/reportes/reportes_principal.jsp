<jsp:include page="../_top.jsp"/>
<%@page import="sv.ClinicaSanAntonio.procesos.*" %>

<title>Reportes</title>
<br>
<br>
<h3>Reportes que genera el Sistema Clinico:</h3><br>
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
<h3>Consultar expediente:</h3>
<form method="post" action="consultas_expediente.jsp">
    <label>Num. Expediente: </label>
    <input type="text" name="numExpediente" /><br>
    <input type="submit" value="Consultar"/>
</form>

<br/>

<jsp:include page="../_down.jsp"/>