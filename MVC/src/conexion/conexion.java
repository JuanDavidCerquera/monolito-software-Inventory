/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;
import java.sql.Statement;
import java.sql.ResultSet;
import com.sun.source.tree.CaseTree;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
/**
 *
 * @author bonil
 */
public class conexion {
        
      Connection con;
    public conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_79","root","");
            System.out.println("Conexion exitosa");
        } catch (Exception e) {
            System.err.println("Error:"+e);
        }      
    }
}
