<%@page import="sv.ClinicaSanAntonio.procesos.*" %>
<% HttpSession sesion = request.getSession();
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server  
    
    if(sesion.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
    }
    
    

%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
 
<!DOCTYPE html>
<html>
    <head>   
        <link rel="stylesheet"  type="text/css" href="/ClinicaSanAntonio/css/menu.css" />
        <link rel="stylesheet"  type="text/css" href="/ClinicaSanAntonio/css/css-slider.css" />
        <link rel="stylesheet"  type="text/css" href="/ClinicaSanAntonio/css/maquetacion.css" />
        <link rel="stylesheet"  type="text/css" href="/ClinicaSanAntonio/css/tabla.css" />
        <link rel="stylesheet"  type="text/css" href="/ClinicaSanAntonio/css/reset.css" />
        <link rel="stylesheet"  type="text/css" href="/ClinicaSanAntonio/css/styles.css" />
        <script type="text/javascript">
            history.forward();
        </script>
    </head>
    <body>
        <div id="contenedor">

            <div id="salud">
                <img src="/ClinicaSanAntonio/img/bannernew_.jpg" style="height: 90px; width: 100%; padding-left: 0px;"/>
            </div>
            <div id="sesion">
                <br/>
                Usuario: <font color="#B40404"><%= sesion.getAttribute("Nombre")%>
                <strong>[<%= sesion.getAttribute("Usuario")%>]</strong></font>
                <a href="/ClinicaSanAntonio/logout.jsp">Cerrar Sesión</a>
                </h2>
            </div>
                <style>
                    .mimenu{
                        background-color: #555;
                        margin-top: 10px;
                    }
                    
                    .mimenu a{
                        color: white;
                    }
                    
                    .mimenu li{
                        display: inline;
                        line-height: 40px;
                        margin-left: 10px;
                        margin-right: 10px;
                    }
                </style>
                <%  if(Integer.parseInt(sesion.getAttribute("Rol").toString())==1){
                    
                %>    
                <ul class="mimenu">
                <li><a href="/ClinicaSanAntonio/principal.jsp">Inicio</a></li>
                <li><a href="/ClinicaSanAntonio/expedientes/expedientes_consulta.jsp">Expedientes</a></li>
                <li><a href="/ClinicaSanAntonio/citas/citas_consulta.jsp">Citas</a></li>
                <li><a href="/ClinicaSanAntonio/consultas/consultas_consulta.jsp">Consultas</a></li>
                 <li><a href="/ClinicaSanAntonio/examenes/examenes_consulta.jsp">Examenes</a></li>
                <li><a href="/ClinicaSanAntonio/vacunas/vacunas_consulta.jsp">Vacunacion</a></li>
                <li><a href="/ClinicaSanAntonio/doctores/doctores_consulta.jsp">Doctores</a></li>
                <li><a href="/ClinicaSanAntonio/usuarios/usuarios_consulta.jsp">Usuarios</a></li>
                <li><a href="/ClinicaSanAntonio/reportes/reportes_principal.jsp">Reportes</a></li>
                 </ul>
                <% }else{ if(Integer.parseInt(sesion.getAttribute("Rol").toString())==2){%> 
                     <ul class="mimenu">
                        <li><a href="/ClinicaSanAntonio/principal.jsp">Inicio</a></li>
                        <li><a href="/ClinicaSanAntonio/consultas/consultas_consulta.jsp">Consultas</a></li>
                         <li><a href="/ClinicaSanAntonio/examenes/examenes_consulta.jsp">Examenes</a></li>
                        <li><a href="/ClinicaSanAntonio/vacunas/vacunas_consulta.jsp">Vacunacion</a></li>
                      </ul>
                 <% }else{ if(Integer.parseInt(sesion.getAttribute("Rol").toString())==3){%> 
                  <ul class="mimenu">
                    <li><a href="/ClinicaSanAntonio/principal.jsp">Inicio</a></li>
                    <li><a href="/ClinicaSanAntonio/expedientes/expedientes_consulta.jsp">Expedientes</a></li>
                    <li><a href="/ClinicaSanAntonio/citas/citas_consulta.jsp">Citas</a></li>
                  </ul>
                 <% }}}%>
            <div id="contenido">
                <h2>