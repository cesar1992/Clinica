package sv.ClinicaSanAntonio.procesos;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.*;
import javax.sql.*;

public class ConexionPool implements Conexion{//implements es para interfaz
    private Connection conn;
    
    public ConexionPool(){
        conn = null;
    }
    
    @Override
    public synchronized void conectar(){
        try{
            Context initCtx;
            initCtx = new InitialContext();
            DataSource ds = (DataSource)initCtx.lookup("jdbc/clinica2");
            conn = ds.getConnection();
        }catch(NamingException | SQLException e){
            System.out.println("db: " +e.getMessage());
        }
    }
    
    @Override
    public Connection getConexion(){
        return conn;
    }

    @Override
    public synchronized void desconectar(){
        try{
            conn.close();
        }catch(SQLException ex){
            Logger.getLogger(ConexionPool.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
