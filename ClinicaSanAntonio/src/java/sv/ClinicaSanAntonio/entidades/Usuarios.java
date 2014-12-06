package sv.ClinicaSanAntonio.entidades;

public class Usuarios extends Entidad{
    private String IDUsuario;
    private String nombres;
    private String apellidos;
    private String clave;
    private String dui;
    private String correo;
    private String telefono;
    private Integer IDRol;
    
 private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDUsuario";
    }
 
    public Usuarios() {
        init();
    }

    public Usuarios(String IDUsuario, String nombres, String apellidos, String clave, String dui, String correo, String telefono, Integer IDRol) {
        init();
        this.IDUsuario = IDUsuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.clave = clave;
        this.dui = dui;
        this.correo = correo;
        this.telefono = telefono;
        this.IDRol = IDRol;
    }

    public String getIDUsuario() {
        return IDUsuario;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getClave() {
        return clave;
    }

    public String getDui() {
        return dui;
    }

    public String getCorreo() {
        return correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public Integer getIDRol() {
        return IDRol;
    }

    public void setIDUsuario(String IDUsuario) {
        this.IDUsuario = IDUsuario;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setIDRol(Integer IDRol) {
        this.IDRol = IDRol;
    }
    
    


    
   


    
}
