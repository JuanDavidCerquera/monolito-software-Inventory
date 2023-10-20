/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.entity;
import  conexion.conexion;
import java.util.Date;
import Model.Interface.Accion;
import com.sun.jdi.connect.spi.Connection;
import java.util.Objects;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author bonil
 */
public class Producto implements Accion{
    public long id;
    public int id_provedor;
    public String codigo;
    public String nombre;
    public Double ValorUnitario;
    public int cantidad;
    public String categoria;

    public int getId_provedor() {
        return id_provedor;
    }

    public void setId_provedor(int id_provedor) {
        this.id_provedor = id_provedor;
    }
    public Date vencimiento;
    public conexion conn;

    public Producto() {
        this.conn = conn;
    }   

        public Double getValorUnitario() {
        return ValorUnitario;
    }

    public void setValorUnitario(Double ValorUnitario) {
        this.ValorUnitario = ValorUnitario;
    }    
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getVencimiento() {
        return vencimiento;
    }

    public void setVencimiento(Date vencimiento) {
        this.vencimiento = vencimiento;
    }

    


@Override
public void agregar() {
    try {
    // Establecer la conexión a la base de datos
    java.sql.Connection connection = conn.getConnection();

    // Crear la sentencia SQL parametrizada
    String sentenciaSql = "INSERT INTO productos (" +
        "id_provedor, " +    
        "Codigo, " +         
        "Nombre, " +        
        "ValorUnitario, " +
        "Categoria, " +
        "Cantidad, " +
        "FechaVencimiento, " +  // Agregamos el campo de FechaVencimiento
        "state, " +     // 8
        "deleted_at, " +// 9
        "updated_at, " +// 10
        "created_at" +   // 11
        ") VALUES (?, ?, ?, ?, ?, ?, ?,1, NOW(), NOW(), NOW() )";

    // Crear un PreparedStatement con la sentencia SQL
    PreparedStatement preparedStatement = connection.prepareStatement(sentenciaSql);

    preparedStatement.setInt(1, this.getId_provedor());
    preparedStatement.setString(2, this.getCodigo());
    preparedStatement.setString(3, this.getNombre());
    preparedStatement.setDouble(4, this.getValorUnitario());
    preparedStatement.setString(5, this.getCategoria());
    preparedStatement.setInt(6, this.getCantidad());
    preparedStatement.setDate(7, java.sql.Date.valueOf("2023-12-12"));  // Reemplaza con la fecha de vencimiento que desees

    // Ejecutar la sentencia SQL
    preparedStatement.executeUpdate();

    // Cerrar la conexión
    connection.close();

    System.out.println("Inserción exitosa en la tabla productos.");
} catch (SQLException e) {
    e.printStackTrace();
}


}

    
               
    

    @Override
    public void modificar() {
        try {
            java.sql.Connection connection = conn.getConnection();
            
            String sentenciaSql = "UPDATE Producto"+
                    " WHERE ID = ? "+
                    "SET codigo, " +
                    "nombre, " +
                    "precio, " +
                    "cantidad, ";
            
            
            
        PreparedStatement preparedStatement = connection.prepareStatement(sentenciaSql);
        preparedStatement.setString(1, this.getCodigo());
        preparedStatement.setString(2, this.getNombre());
        preparedStatement.setDouble(3, this.getValorUnitario());
        preparedStatement.setInt(4, this.getCantidad());
        preparedStatement.setDate(5, new java.sql.Date(new Date().getTime()));  // Usamos una fecha actual

        // Ejecutar la sentencia para agregar el registro
        preparedStatement.executeUpdate();

        // Cerrar la conexión
        connection.close();
        } catch (SQLException e) {
        e.printStackTrace(); // Maneja el error adecuadamente, podrías lanzar una excepción personalizada si lo deseas.
    }
    
    }

    @Override
    public void eliminar() {
              try {
            java.sql.Connection connection = conn.getConnection();
            
            String sentenciaSql = "DELETE FROM Producto WHERE ID = ?";
            
            
            
        PreparedStatement preparedStatement = connection.prepareStatement(sentenciaSql);
        preparedStatement.setLong(1, this.getId());


        // Ejecutar la sentencia para agregar el registro
        preparedStatement.executeUpdate();

        // Cerrar la conexión
        connection.close();
        } catch (SQLException e) {
        e.printStackTrace(); // Maneja el error adecuadamente, podrías lanzar una excepción personalizada si lo deseas.
    }
    }

    @Override
    public Object consultar() {
               List<Producto> productos = new ArrayList<>();
        java.sql.Connection connection = conn.getConnection();
        String sentenciaSql = "SELECT * FROM Producto";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sentenciaSql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Producto productoEntrante = new Producto();
                productoEntrante.setCodigo(resultSet.getString("Codigo"));
                productoEntrante.setNombre(resultSet.getString("Nombre"));
                productoEntrante.setValorUnitario(resultSet.getDouble("Precio"));
                productoEntrante.setCantidad(resultSet.getInt("Cantidad"));
                productoEntrante.setVencimiento(resultSet.getDate("Vencimiento"));
                productos.add(productoEntrante);
               System.out.println("  Codigo: "+productoEntrante.getCodigo()+"  Nombre: "+productoEntrante.getNombre()+"  ValorUnitario: "+productoEntrante.getValorUnitario()+"  cantidad: "+productoEntrante.getCantidad()+"  vencimiento: "+productoEntrante.getVencimiento());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productos;
    }
}
    
    

