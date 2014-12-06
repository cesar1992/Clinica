
package sv.ClinicaSanAntonio.entidades;


public class Tiposcitas extends Entidad{
    
    private String IDTipocita;
    private String tipocita;
    
      private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "IDTipocita";
    }

    public Tiposcitas() {
        init();
    }

    public Tiposcitas(String IDTipocita, String tipocita) {
        init();
        this.IDTipocita = IDTipocita;
        this.tipocita = tipocita;
    }

    public String getIDTipocita() {
        return IDTipocita;
    }

    public String getTipocita() {
        return tipocita;
    }

    public void setIDTipocita(String IDTipocita) {
        this.IDTipocita = IDTipocita;
    }

    public void setTipocita(String tipocita) {
        this.tipocita = tipocita;
    }
    
    
      
   
}
