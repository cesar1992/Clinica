

package sv.ClinicaSanAntonio.entidades;



public class Citas extends Entidad{

    private String IDCita;
    private String fecha;
    private String IDExpedientePaciente;
    private String IDUsuario;
    private String IDTipocita;
    private String estado;
    
      private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDCita";
    }

    public Citas() {
        init();
    }

    public Citas(String IDCita, String estado) {
        init();
        this.IDCita = IDCita;
        this.estado = estado;
    }

      
   

   
    public Citas(String IDCita, String fecha, String IDExpedientePaciente, String IDUsuario, String IDTipocita, String estado) {
        init();
        this.IDCita = IDCita;
        this.fecha = fecha;
        this.IDExpedientePaciente = IDExpedientePaciente;
        this.IDUsuario = IDUsuario;
        this.IDTipocita = IDTipocita;
        this.estado = estado;
    }

    public String getIDCita() {
        return IDCita;
    }

    public String getFecha() {
        return fecha;
    }

    public String getIDExpedientePaciente() {
        return IDExpedientePaciente;
    }

    public String getIDUsuario() {
        return IDUsuario;
    }

    public String getIDTipocita() {
        return IDTipocita;
    }

    public String getEstado() {
        return estado;
    }

    public void setIDCita(String IDCita) {
        this.IDCita = IDCita;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setIDExpedientePaciente(String IDExpedientePaciente) {
        this.IDExpedientePaciente = IDExpedientePaciente;
    }

    public void setIDUsuario(String IDUsuario) {
        this.IDUsuario = IDUsuario;
    }

    public void setIDTipocita(String IDTipocita) {
        this.IDTipocita = IDTipocita;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
    
}

    