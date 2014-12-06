package sv.ClinicaSanAntonio.entidades;

public class ExamenesPacientes extends Entidad{
    private String IDExamenpaciente;
    private String fecha;
    private String resultado;
    private String IDExamen;
    private String IDCita;
    private String IDDoctor;

    
    private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDExamenpaciente";
    }

    public ExamenesPacientes(String IDExamenpaciente, String fecha, String resultado, String IDExamen, String IDCita, String IDDoctor) {
        init();
        this.IDExamenpaciente = IDExamenpaciente;
        this.fecha = fecha;
        this.resultado = resultado;
        this.IDExamen = IDExamen;
        this.IDCita = IDCita;
        this.IDDoctor = IDDoctor;
    }

    public ExamenesPacientes() {
        init();
    }

    public void setIDExamenpaciente(String IDExamenpaciente) {
        this.IDExamenpaciente = IDExamenpaciente;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public void setIDExamen(String IDExamen) {
        this.IDExamen = IDExamen;
    }

    public void setIDCita(String IDCita) {
        this.IDCita = IDCita;
    }

    public void setIDDoctor(String IDDoctor) {
        this.IDDoctor = IDDoctor;
    }

    public String getIDExamenpaciente() {
        return IDExamenpaciente;
    }

    public String getFecha() {
        return fecha;
    }

    public String getResultado() {
        return resultado;
    }

    public String getIDExamen() {
        return IDExamen;
    }

    public String getIDCita() {
        return IDCita;
    }

    public String getIDDoctor() {
        return IDDoctor;
    }
    
    

    
}  