package paquete;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import paquete.Users;


public class Clase implements Interfaz {

    public static Clase instance;
    public static Connection conexion; 

    public Clase() {
        try {
            conexion = DriverManager.getConnection(CONN_STRING);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public synchronized static Clase getInstance() {
        if (instance==null) {
            instance = new Clase();
        }
        return instance;
    }

    public ArrayList<Users> getRegisteredUsers() {
        ArrayList<Users> result =  new ArrayList<Users>();
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "SELECT usuario, password FROM dbo.RegisterUsers";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                Users newUser = new Users(rs.getString("usuario"), rs.getString("password"));
                result.add(newUser);
                System.out.println(rs.getString("usuario"));
              
            }
            System.out.println(rs);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public ArrayList<Collector> getRegisteredCollector() {
        ArrayList<Collector> result =  new ArrayList<Collector>();
        try {

             Statement stmt = conexion.createStatement();
            String SQL = "SELECT actorid, descripcion FROM dbo.actores where tipoactorid =2;";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    Collector newCollector = new Collector(rs.getInt("actorid"), rs.getString("descripcion"));
                    result.add(newCollector);
                
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public ArrayList<Productor> getProducers(int idC) {
        ArrayList<Productor> result =  new ArrayList<Productor>();
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "SELECT distinct l.localid\n" +
                        "from localesXproductor l \n" +
                        "left join actoresXcontratoXproducto a on\n" +
                        "a.contratoId = l.actorId\n" +
                        "where a.actorid ="+idC;
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    Productor newProductor = new Productor(rs.getInt("localid"), "local "+rs.getInt("localid"));
                    result.add(newProductor);
                    
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public ArrayList<Producto> getProducts(int idL) {
        ArrayList<Producto> result =  new ArrayList<Producto>();
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "Select distinct a.productoid, p.nombre\n" +
                        "from actoresXcontratoXproducto a\n" +
                        "join localesXproductor l on\n" +
                        "l.actorId = a.actorid\n" +
                        "join productos p on \n" +
                        "a.productoId = p.productoId\n" +
                        "where l.localId = "+idL;
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    Producto newProducto = new Producto(rs.getInt("productoid"), rs.getString("nombre"));
                    result.add(newProducto);
                    
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public ArrayList<Categoria> getCategorias() {
        ArrayList<Categoria> result =  new ArrayList<Categoria>();
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "Select distinct c.categoriaId, t.textOrg\n" +
                        "from categoriaProducto c\n" +
                        "join Traducciones t \n" +
                        "on t.traduccionId= c.descripcion  \n" +
                        "where c.categoriaId <> 23";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    Categoria newCategoria = new Categoria(rs.getInt("categoriaid"), rs.getString("textOrg"));
                    result.add(newCategoria);
                    
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public int searchContainer(int idP) {
        int result = 0;
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "select top 1 recipienteid from recipientes where productoId ="+idP+" and estado =1";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    result = rs.getInt("recipienteid");                 
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public int updateContainer(int idP) {
        int result = 0;
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "select top 1 recipienteid from recipientes where productoId ="+idP+" and estado =1";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    result = rs.getInt("recipienteid");                 
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    
}