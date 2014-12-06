package sv.ClinicaSanAntonio.entidades;

public class Permisos extends Entidad{
    private Integer IDPermisos;
    private Integer IDMenu;
    private Integer IDRoles;

    public Permisos() {
        init();
    }

    public Permisos(Integer IDMenu, Integer IDRoles) {
        init();
        this.IDMenu = IDMenu;
        this.IDRoles = IDRoles;
    }

    public Permisos(Integer IDPermisos) {
        init();
        this.IDPermisos = IDPermisos;
    }

    public Permisos(Integer IDPermisos, Integer IDMenu, Integer IDRoles) {
        init();
        this.IDPermisos = IDPermisos;
        this.IDMenu = IDMenu;
        this.IDRoles = IDRoles;
    }
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "IDPermisos";
    }

    public Integer getIDPermisos() {
        return IDPermisos;
    }

    public void setIDPermisos(Integer IDPermisos) {
        this.IDPermisos = IDPermisos;
    }

    public Integer getIDMenu() {
        return IDMenu;
    }

    public void setIDMenu(Integer IDMenu) {
        this.IDMenu = IDMenu;
    }

    public Integer getIDRoles() {
        return IDRoles;
    }

    public void setIDRoles(Integer IDRoles) {
        this.IDRoles = IDRoles;
    }
    
}
