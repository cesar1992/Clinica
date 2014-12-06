package sv.ClinicaSanAntonio.datos;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Encrypt {

    private static List<String> variables;
    public static void main(String[] args) throws Exception{
                        
                File f = new File("src/java/com/aerolinea/procesos/config.properties");                
                variables = new ArrayList<>();
                variables.add("Usuario");
                variables.add("Clave");
                variables.add("Servidor");
                variables.add("Puerto");
                variables.add("DataBase");
                System.out.println(f.getPath());
                Iterator e = variables.iterator();
		EncryptedProperties ep = new EncryptedProperties("AbCdEfGhIj");
		try {
			if (f.exists()) {
				FileInputStream in = new FileInputStream(f);
				ep.load(in);
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
                        String key;
                        String value;
			while (e.hasNext()) {
                                key = e.next().toString();
				System.out.print(key+ ": ");
				value = br.readLine();
                                ep.setProperty(key, value);
                        }
                    try (FileOutputStream out = new FileOutputStream(f)) {
                        ep.store(out, "Archivo propiedades encriptado");
                    }

			System.out.println("Datos");
			Iterator i = ep.keySet().iterator();
			while (i.hasNext()) {
				String k = (String) i.next();
				String v = (String) ep.get(k);
				System.out.println("   " + k + "=" + v);
			}
		}
		catch (IOException er) {
			System.out.println("No se puede acceder al archivo encriptado: " + f.getAbsolutePath());
		}
    }
}
