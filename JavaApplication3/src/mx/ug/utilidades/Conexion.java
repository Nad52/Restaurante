/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.ug.utilidades;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author bruja1
 */
public class Conexion {
    private static final String URL ="jdbc:mysql://localhost/Restaurant";
            
    private static final String USER = "root";
    private static final String PASS = "123456";

    public static Connection getConexion() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void main(String[] args) {
        if(getConexion()!=null){
            System.out.println("Sucess!");
        }
        else{
            System.out.println("Error!");
       }
   }
    
}
