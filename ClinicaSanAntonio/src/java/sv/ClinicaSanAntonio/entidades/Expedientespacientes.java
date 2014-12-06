

package sv.ClinicaSanAntonio.entidades;

import java.sql.Date;


public class Expedientespacientes extends Entidad {
    
    private String IDExpedientePaciente;
    private String nombrePaciente;
    private String nombrePadre;
    private String nombreMadre;
    private String tipoSangre;
    private String peso;
    private String altura;
    private String sexo;
    private String fechaNacimiento;
    private String direccion;
    private String telefono;
    
    
    
     private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDExpedientePaciente";
    }

    public Expedientespacientes() {
        init();
    }

    public Expedientespacientes(String IDExpedientePaciente, String nombrePaciente, String nombrePadre, String nombreMadre, String tipoSangre, String peso, String altura, String sexo, String fechaNacimiento, String direccion, String telefono) {
        init();
        this.IDExpedientePaciente = IDExpedientePaciente;
        this.nombrePaciente = nombrePaciente;
        this.nombrePadre = nombrePadre;
        this.nombreMadre = nombreMadre;
        this.tipoSangre = tipoSangre;
        this.peso = peso;
        this.altura = altura;
        this.sexo = sexo;
        this.fechaNacimiento = fechaNacimiento;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public String getIDExpedientePaciente() {
        return IDExpedientePaciente;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public String getNombrePadre() {
        return nombrePadre;
    }

    public String getNombreMadre() {
        return nombreMadre;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public String getPeso() {
        return peso;
    }

    public String getAltura() {
        return altura;
    }

    public String getSexo() {
        return sexo;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setIDExpedientePaciente(String IDExpedientePaciente) {
        this.IDExpedientePaciente = IDExpedientePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public void setNombrePadre(String nombrePadre) {
        this.nombrePadre = nombrePadre;
    }

    public void setNombreMadre(String nombreMadre) {
        this.nombreMadre = nombreMadre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

  

}
