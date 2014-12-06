package sv.ClinicaSanAntonio.entidades;

public class Roles extends Entidad{
    private String IDRol;
    private String rol;
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "IDRol";
    }
    public Roles() {
        init();
    }
    
    public Roles(String IDRoles) {
        init();
        this.IDRol = IDRoles;
    }

    public Roles(String IDRol, String rol) {
        init();
        this.IDRol = IDRol;
        this.rol = rol;
    }

    public String getIDRol() {
        return IDRol;
    }

    public String getRol() {
        return rol;
    }

    public void setIDRol(String IDRol) {
        this.IDRol = IDRol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    
}
