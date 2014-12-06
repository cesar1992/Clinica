package sv.ClinicaSanAntonio.entidades;

public class Menu extends Entidad{
    private Integer IDMenu;
    private String etiqueta;
    private String url;
    private Integer idpadre;

    public Menu() {
        init();
    }

    public Menu(String etiqueta, String url, Integer idpadre) {
        init();
        this.etiqueta = etiqueta;
        this.url = url;
        this.idpadre = idpadre;
    }

    public Menu(Integer IDMenu) {
        init();
        this.IDMenu = IDMenu;
    }

    public Menu(Integer IDMenu, String etiqueta, String url, Integer idpadre) {
        init();
        this.IDMenu = IDMenu;
        this.etiqueta = etiqueta;
        this.url = url;
        this.idpadre = idpadre;
    }
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "IDMenu";
    }

    public Integer getIDMenu() {
        return IDMenu;
    }

    public void setIDMenu(Integer IDMenu) {
        this.IDMenu = IDMenu;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getIdpadre() {
        return idpadre;
    }

    public void setIdpadre(Integer idpadre) {
        this.idpadre = idpadre;
    }
    
}
