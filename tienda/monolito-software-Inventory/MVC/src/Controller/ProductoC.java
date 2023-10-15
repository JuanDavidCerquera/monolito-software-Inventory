/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.entity.Producto;
import java.util.Date;


/**
 *
 * @author ariel
 */
public class ProductoC {
    public void GuardarRegistro(String codigo, String nombre, String Categoria, Date fvencimiento, Double valorUnitario, int cantidad){
        Producto producto = new Producto();
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setCategoria(Categoria);
        producto.setVencimiento(fvencimiento);
        producto.setPrecio(valorUnitario);
        producto.setCantidad(cantidad);
        producto.agregar();
    }
    
    public void ModificarRegistro(Long  id, String codigo, String nombre, Double precio, int cantidad){
        Producto producto = new Producto();
        producto.setId(id);
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.modificar();
    }
    
   
    public void EliminarRegistro(Long  id, String codigo, String nombre, Double precio, int cantidad){
        Producto producto = new Producto();
        producto.setId(id);
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.eliminar();
    }
    public void ConsultarRegistro(Long  id, String codigo, String nombre, Double precio, int cantidad){
        Producto producto = new Producto();
        producto.setId(id);
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.consultar();
    }
}