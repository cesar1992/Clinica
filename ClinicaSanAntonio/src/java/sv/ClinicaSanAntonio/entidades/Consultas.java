package sv.ClinicaSanAntonio.entidades;

public class Consultas extends Entidad{
    private String IDConsulta;
    private String fechaConsulta;
    private String IDDoctor;
    private String sintomas;
    private String diagnostico;
    private String medicamento;
    private String IDCita;
    
    private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDConsulta";
    }

    public Consultas() {
        init();
    }

    public Consultas(String IDConsulta, String fechaConsulta, String IDDoctor, String sintomas, String diagnostico, String medicamento, String IDCita) {
        init();
        this.IDConsulta = IDConsulta;
        this.fechaConsulta = fechaConsulta;
        this.IDDoctor = IDDoctor;
        this.sintomas = sintomas;
        this.diagnostico = diagnostico;
        this.medicamento = medicamento;
        this.IDCita = IDCita;
    }

    public Consultas(String fechaConsulta, String IDDoctor, String sintomas, String diagnostico, String medicamento, String IDCita) {
        init();
        this.fechaConsulta = fechaConsulta;
        this.IDDoctor = IDDoctor;
        this.sintomas = sintomas;
        this.diagnostico = diagnostico;
        this.medicamento = medicamento;
        this.IDCita = IDCita;
    }

    public void setIDConsulta(String IDConsulta) {
        this.IDConsulta = IDConsulta;
    }

    public void setFechaConsulta(String fechaConsulta) {
        this.fechaConsulta = fechaConsulta;
    }

    public void setIDDoctor(String IDDoctor) {
        this.IDDoctor = IDDoctor;
    }

    public void setSintomas(String sintomas) {
        this.sintomas = sintomas;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public void setMedicamento(String medicamento) {
        this.medicamento = medicamento;
    }

    public void setIDCita(String IDCita) {
        this.IDCita = IDCita;
    }

    public String getIDConsulta() {
        return IDConsulta;
    }

    public String getFechaConsulta() {
        return fechaConsulta;
    }

    public String getIDDoctor() {
        return IDDoctor;
    }

    public String getSintomas() {
        return sintomas;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public String getMedicamento() {
        return medicamento;
    }

    public String getIDCita() {
        return IDCita;
    }
    
    
}