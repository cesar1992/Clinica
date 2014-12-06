package sv.ClinicaSanAntonio.procesos;

import sv.ClinicaSanAntonio.datos.EncryptedProperties;
import java.io.IOException;
import java.sql.*;

public class ConexionBD implements Conexion{
 
    private final String usuario;
    private final String clave;
    private final String url;    
    private Connection conn = null;
    
    public ConexionBD() throws Exception {        
        EncryptedProperties properties = new EncryptedProperties( "AbCdEfGhIj" );       
        try {                                
            properties.load(getClass().getResourceAsStream("config.properties"));            
        }catch(IOException e){
            System.err.println(e.getMessage());
        }
        String server;
        String port;
        String database;    
        usuario = properties.getProperty("Usuario");
        clave = properties.getProperty("Clave");
        server = properties.getProperty("Servidor");
        port = properties.getProperty("Puerto");
        database = properties.getProperty("DataBase");
        url = "jdbc:mysql://"+server+":"+port+"/"+database;
    }

    @Override
    public synchronized void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url,usuario,clave);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException err) {
            System.out.println("Error " + err.getMessage());
        }                
    }
    
    @Override
    public Connection getConexion(){
        return conn;
    }
    
    @Override
    public synchronized void desconectar() {
        try {
                conn.close();
        } catch (SQLException err) {
            System.out.println("Error " + err.getMessage());
        }
    }  
}
