package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import sv.ClinicaSanAntonio.entidades.Entidad;
import sv.ClinicaSanAntonio.entidades.Roles;
import sv.ClinicaSanAntonio.procesos.ConexionPool;
import sv.ClinicaSanAntonio.procesos.Operaciones;
import sv.ClinicaSanAntonio.procesos.Conexion;
import sv.ClinicaSanAntonio.entidades.Usuarios;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Iniciar Sesi&oacute;n</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/login.css\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form id=\"start\" action=\"login.jsp\" method=\"post\">\n");
      out.write("         <h1>Digite sus Datos</h1>\n");
      out.write("         ");

//          Conexion conn = new ConexionPool();
//            if(conn == null){
//               out.println("Error de conexion");
//           }
//            Operaciones.setConexion(conn);
//            Roles r = new Roles(1, "Administrador");
//
//            Operaciones.insertar(r);
//           Usuarios u = new Usuarios("admin", "Cesar", "Adonay", Entidad.getHash("admin"), "12345", "adasd@gmail.com", "123456", 1);
//
//           String a = Operaciones.insertar(u);
//         out.println(a);
//           HttpSession sesion = request.getSession();
//
//
//              String Mensaje[] = new String[3];
//              Mensaje[0] = "Usuario y/o contraseña incorrectos!!!<br>";
//               Mensaje[1] = "Ocurrio un error en la conexion, Intentelo de nuevo<br>";
//               String Error = request.getParameter("error");
//
//              if(Error != null)
//                    out.println("<center><font color=red size=2>" + Mensaje[Integer.parseInt(Error)] + "</font><br></center><br>");
//         
      out.write("\n");
      out.write("         <p>\n");
      out.write("            <label for=\"name\">Usuario</label>\n");
      out.write("            <input id=\"name\" type=\"text\" name=\"txtUsuario\">\n");
      out.write("         </p>\n");
      out.write("         <p>\n");
      out.write("            <label for=\"password\">Contraseña</label>\n");
      out.write("            <input id=\"password\" type=\"password\" name=\"txtClave\">\n");
      out.write("         </p>\n");
      out.write("         <p>\n");
      out.write("             <input class=\"submit\" type=\"submit\" value=\"Entrar\" name=\"btnEntrar\">\n");
      out.write("         </p>\n");
      out.write("      </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
