package sv.ClinicaSanAntonio.entidades;

public class Especialidades extends Entidad{
    private String IDEspecialidad;
    private String especialidad;
  
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "IDEspecialidad";
    }
    public Especialidades() {
        init();
    }

    public Especialidades(String IDEspecialidad, String especialidad) {
        init();
        this.IDEspecialidad = IDEspecialidad;
        this.especialidad = especialidad;
    }

    public String getIDEspecialidad() {
        return IDEspecialidad;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setIDEspecialidad(String IDEspecialidad) {
        this.IDEspecialidad = IDEspecialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

  
    
    
    
}