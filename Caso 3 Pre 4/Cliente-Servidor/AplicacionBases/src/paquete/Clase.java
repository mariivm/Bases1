package paquete;

import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
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
            String SQL = "SELECT id,usuario, password FROM dbo.RegisterUsers";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                Users newUser = new Users(rs.getInt("id"),rs.getString("usuario"), rs.getString("password"));
                result.add(newUser);
              
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
    
    public boolean checkCat(int prodid, int catid) {
        int result = 1;
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "Select categoriaid from categoriaxproductos where productoid = "+prodid ;
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                result = rs.getInt("categoriaid");
                                      
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result == catid;
       
    }
    
    
    public int searchContainer(int id, String type) {
        int result = 0;
        try {

            Statement stmt = conexion.createStatement();
            String SQL;
            if (type.equals("r")){
                SQL = "select top 1 recipienteid from recipientes where productoId ="+id+" and estado =1";
            }else{
                SQL = "select top 1 recipienteid from recipientes where categoriaId ="+id+" and estado =2";
            }
            
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()) {
                    result = rs.getInt("recipienteid");                 
              
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    //Agregar recipiente en caso de q no hayan disponibles 
    public int addContainer(int idP) {
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
    
    public int updateContainer(int idR, int status) {
        int result = 0;
        try {

            Statement stmt = conexion.createStatement();
            String SQL = "update recipientes set estado = "+status+" where recipienteId ="+idR;
            stmt.executeUpdate(SQL);          
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
       
    }
    
    public void insertintoTVP(ArrayList<Movimiento> registro) {
        
        try {
            SQLServerDataTable movimientos = new SQLServerDataTable();
            movimientos.addColumnMetadata("userid", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("recipienteid", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("accion", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("recolectora", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("localid", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("fecha", java.sql.Types.DATE);
            movimientos.addColumnMetadata("checksum", java.sql.Types.VARBINARY);
            for(Movimiento mov:registro){
                movimientos.addRow(mov.userid, mov.recipienteid,
                            mov.accion, mov.recid, mov.locid, mov.fecha, new byte[]{0x00});
            }
 
            
            
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.GetnExchange(?)}");
            spGetProductorForRecolector.setObject(1, movimientos);
            spGetProductorForRecolector.execute();       
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
       
    }
    
    
}