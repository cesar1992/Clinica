package sv.ClinicaSanAntonio.entidades;

public class Vacunaspacientes extends Entidad{
    private String IDVacunaPaciente;
    private String IDVacuna;
    private String fecha;
    private String citas_IDCita;
   

    
    private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDVacunaPaciente";
    }

    public Vacunaspacientes(String IDVacunaPaciente, String IDVacuna, String fecha, String citas_IDCita) {
        init();
        this.IDVacunaPaciente = IDVacunaPaciente;
        this.IDVacuna = IDVacuna;
        this.fecha = fecha;
        this.citas_IDCita = citas_IDCita;
    }

    public Vacunaspacientes() {
    init();
    }
    

    public void setIDVacunaPaciente(String IDVacunaPaciente) {
        this.IDVacunaPaciente = IDVacunaPaciente;
    }

    public void setIDVacuna(String IDVacuna) {
        this.IDVacuna = IDVacuna;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setCitas_IDCita(String citas_IDCita) {
        this.citas_IDCita = citas_IDCita;
    }

    
    public String getIDVacunaPaciente() {
        return IDVacunaPaciente;
    }

    public String getIDVacuna() {
        return IDVacuna;
    }

    public String getFecha() {
        return fecha;
    }

    public String getCitas_IDCita() {
        return citas_IDCita;
    }
    
    
}
