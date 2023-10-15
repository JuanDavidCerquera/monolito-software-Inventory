package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/producto";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "";

    public static Connection getConnection() {
        try {
            // Cargar el controlador de la base de datos (por ejemplo, MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establecer la conexión
            Connection connection = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Manejar errores apropiadamente
            return null; // O podrías lanzar una excepción personalizada
        }
    }
}
