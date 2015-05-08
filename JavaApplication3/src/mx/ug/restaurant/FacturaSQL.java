/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.ug.restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.ug.main.Factura;
import mx.ug.utilidades.Conexion;

/**
 *
 * @author bruja1
 */
public class FacturaSQL {

   public static List<Factura> obtenerFactura(){
        List<Factura> lstFactura=new ArrayList<>();
        String query = "Select NumMesa,NumPersonas, Nombre FROM orden O INNER JOIN factura F ON O.idOrden=F.idOrden";
        Connection cn=Conexion.getConexion();
        try{
            PreparedStatement pst=cn.prepareStatement(query);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                int id=rs.getInt(1);
                String nombre=rs.getString(2);
                String entrada=rs.getString(3);
                String especialidad=rs.getString(4);
                String tipoEsp=rs.getString(5);
                String postre=rs.getString(6);
                
                Factura f=new Factura();
                
                f.setNombreCliente(nombre);
                f.setEntrada(entrada);
                f.setEspecialidad(especialidad);
                f.setTipoEspecialidad(tipoEsp);
                f.setPostre(postre);
                
                lstFactura.add(f);
                }
            }
        catch (SQLException ex){
            ex.printStackTrace();        
    }      
        return lstFactura;
        
    }    
    public static void main(String[] args) {
        List<Factura> lstFactura= obtenerFactura();
        for (Factura factura : lstFactura) {
            System.out.println(factura);
        } 
}
}
