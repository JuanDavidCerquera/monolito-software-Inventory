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
import java.sql.SQLException;


/**
 *
 * @author bonil
 */
public class Producto implements Accion{
    public long id;
    public String codigo;
    public String nombre;
    public Double precio;
    public int cantidad;
    public String categoria;
    public Date vencimiento;
    public conexion conn;

    public Producto() {
        this.conn = conn;
    }   

        public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
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
        String sentenciaSql = "INSERT INTO producto(" +
            "codigo, " +
            "nombre, " +
            "precio, " +
            "cantidad, " +
            "created_at" +
            ") VALUES (?, ?, ?, ?, ?)";

        // Crear un PreparedStatement con la sentencia SQL
        PreparedStatement preparedStatement = connection.prepareStatement(sentenciaSql);
        preparedStatement.setString(1, this.getCodigo());
        preparedStatement.setString(2, this.getNombre());
        preparedStatement.setDouble(3, this.getPrecio());
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
    public void modificar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void eliminar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object consultar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
