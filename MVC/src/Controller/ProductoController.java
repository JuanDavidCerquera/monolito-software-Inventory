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
public class ProductoController {
    public void GuardarRegistro(String codigo, String nombre, Double precio, int cantidad,String categoria, Date vencimiento){
        Producto producto = new Producto();
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.setCategoria(categoria);
        producto.setVencimiento(vencimiento);

        producto.agregar();
    }
    
    public void ModificarRegistro(Long  id, String codigo, String nombre, Double precio, int cantidad,String categoria, Date vencimiento){
        Producto producto = new Producto();
        producto.setId(id);
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.setCategoria(categoria);
        producto.setVencimiento(vencimiento);
        producto.modificar();
    }
}