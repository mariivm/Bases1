/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paquete;

public class Movimiento {
    int userid, recipienteid, accion,recid,locid;
    String fecha;
    
    
    Movimiento(int userid_, int recipienteid_, int accion_, int recid_, int locid_,String fecha_ ){
        userid=userid_;
        recipienteid=recipienteid_;
        accion= accion_;
        recid= recid_;
        locid = locid_;
        fecha = fecha_;     
    }
}
