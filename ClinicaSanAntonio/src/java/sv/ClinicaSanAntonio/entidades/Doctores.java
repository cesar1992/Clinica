package sv.ClinicaSanAntonio.entidades;

public class Doctores extends Entidad{
    private String IDDoctor;
    private String nombresDoctor;
    private String apellidosDoctor;
    private String direccion;
    private String telefono;
    private String IDEspecialidad;

    private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDDoctor";
    }
    
    public Doctores() {
        init();
    }

    public Doctores(String IDDoctor, String nombresDoctor, String apellidosDoctor, String direccion, String telefono, String IDEspecialidad) {
        init();
        this.IDDoctor = IDDoctor;
        this.nombresDoctor = nombresDoctor;
        this.apellidosDoctor = apellidosDoctor;
        this.direccion = direccion;
        this.telefono = telefono;
        this.IDEspecialidad = IDEspecialidad;
    }

    public Doctores(String nombresDoctor, String apellidosDoctor, String direccion, String telefono, String IDEspecialidad) {
        init();
        this.nombresDoctor = nombresDoctor;
        this.apellidosDoctor = apellidosDoctor;
        this.direccion = direccion;
        this.telefono = telefono;
        this.IDEspecialidad = IDEspecialidad;
    }

    public String getIDDoctor() {
        return IDDoctor;
    }

    public String getNombresDoctor() {
        return nombresDoctor;
    }

    public String getApellidosDoctor() {
        return apellidosDoctor;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getIDEspecialidad() {
        return IDEspecialidad;
    }

    public void setIDDoctor(String IDDoctor) {
        this.IDDoctor = IDDoctor;
    }

    public void setNombresDoctor(String nombresDoctor) {
        this.nombresDoctor = nombresDoctor;
    }

    public void setApellidosDoctor(String apellidosDoctor) {
        this.apellidosDoctor = apellidosDoctor;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setIDEspecialidad(String IDEspecialidad) {
        this.IDEspecialidad = IDEspecialidad;
    }
    
    

    
    
}