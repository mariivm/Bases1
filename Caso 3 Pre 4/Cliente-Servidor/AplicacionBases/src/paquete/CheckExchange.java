package paquete;
import paquete.Clase;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.util.Date;
import java.text.SimpleDateFormat;



public class CheckExchange extends javax.swing.JFrame {

    public Clase objeto2 = new Clase();
    public ArrayList<Collector> array = objeto2.getRegisteredCollector();
    public Clase objeto3 = new Clase();
    public Clase objeto4 = new Clase();
    public Clase objeto5 = new Clase();
    public int Recid, locid,userid;
    
    /**
     * Creates new form CheckExchange
     * @param userid
     */
    public CheckExchange() {
        initComponents();
        this.setLocationRelativeTo(null);
    }
    
    public CheckExchange(int userid_) {
        initComponents();
        this.setLocationRelativeTo(null);
        
        for(int i = 0; i<array.size(); i++){  
             jComboBox1.addItem(array.get(i).descripcion);
        }      
        userid = userid_;
        Recid = 0;
        locid = 0;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jComboBox3 = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jComboBox5 = new javax.swing.JComboBox<>();
        jButton2 = new javax.swing.JButton();
        jPanel5 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel12 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jTextField2 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jLabel9 = new javax.swing.JLabel();
        jComboBox6 = new javax.swing.JComboBox<>();
        jButton6 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Microsoft JhengHei UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("ESENCIAL VERDE | Recoleccion y Canje");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 370, 40));

        jPanel2.setBackground(new java.awt.Color(51, 153, 255));

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 190, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 40, Short.MAX_VALUE)
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 190, 40));

        jLabel2.setFont(new java.awt.Font("Microsoft JhengHei UI", 0, 14)); // NOI18N
        jLabel2.setText("Seleccione un Recolector a cargo");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 70, 240, 40));

        jPanel3.setBackground(new java.awt.Color(51, 153, 255));
        jPanel3.setForeground(new java.awt.Color(51, 153, 255));

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 460, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 40, Short.MAX_VALUE)
        );

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 0, 460, 40));

        jPanel1.add(jComboBox1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 110, 180, -1));

        jLabel3.setFont(new java.awt.Font("Microsoft JhengHei UI", 0, 14)); // NOI18N
        jLabel3.setText("Peso en kilogramos");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 450, 180, 30));

        jComboBox2.setEnabled(false);
        jComboBox2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox2ActionPerformed(evt);
            }
        });
        jPanel1.add(jComboBox2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 260, 180, -1));

        jLabel5.setFont(new java.awt.Font("Microsoft JhengHei UI", 1, 12)); // NOI18N
        jLabel5.setText("Paso 3");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 60, 80, -1));

        jLabel6.setFont(new java.awt.Font("Microsoft JhengHei UI", 1, 12)); // NOI18N
        jLabel6.setText("Paso 1");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 60, 80, -1));

        jLabel7.setFont(new java.awt.Font("Microsoft JhengHei UI", 0, 14)); // NOI18N
        jLabel7.setText("Categoria de recipientes ");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 370, 260, 40));

        jComboBox3.setEnabled(false);
        jPanel1.add(jComboBox3, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 330, 180, -1));

        jLabel8.setFont(new java.awt.Font("Microsoft JhengHei UI", 0, 14)); // NOI18N
        jLabel8.setText("Desecho que se recoge");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 290, 160, 40));

        jTextField1.setEnabled(false);
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextField1KeyTyped(evt);
            }
        });
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 480, 180, -1));

        jButton1.setBackground(new java.awt.Color(51, 204, 0));
        jButton1.setForeground(new java.awt.Color(255, 255, 255));
        jButton1.setText("Recolectar");
        jButton1.setEnabled(false);
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 540, 180, -1));

        jLabel10.setFont(new java.awt.Font("Microsoft JhengHei UI", 1, 12)); // NOI18N
        jLabel10.setText("Paso 2");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 210, 80, -1));

        jLabel11.setFont(new java.awt.Font("Microsoft JhengHei UI", 0, 14)); // NOI18N
        jLabel11.setText("Seleccione al productor de residuo");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 220, 260, 40));

        jComboBox5.setEnabled(false);
        jPanel1.add(jComboBox5, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 410, 170, -1));

        jButton2.setBackground(new java.awt.Color(51, 204, 0));
        jButton2.setForeground(new java.awt.Color(255, 255, 255));
        jButton2.setText("Entregar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 150, 180, -1));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Tipo", "Recipiente", "Desecho", "Peso/Cant"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTable1);

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 340, Short.MAX_VALUE)
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 300, Short.MAX_VALUE)
        );

        jPanel1.add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 230, 340, 300));

        jLabel12.setFont(new java.awt.Font("Microsoft JhengHei UI", 1, 12)); // NOI18N
        jLabel12.setText("Registro");
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 210, 60, -1));

        jButton3.setBackground(new java.awt.Color(51, 204, 0));
        jButton3.setForeground(new java.awt.Color(255, 255, 255));
        jButton3.setText("Seleccionar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 150, 180, -1));

        jTextField2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextField2KeyTyped(evt);
            }
        });
        jPanel1.add(jTextField2, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 110, 60, -1));

        jLabel4.setText(" Cant");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(580, 110, 40, 30));

        jButton4.setBackground(new java.awt.Color(51, 153, 255));
        jButton4.setForeground(new java.awt.Color(255, 255, 255));
        jButton4.setText("OK");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton4, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 260, 50, -1));

        jButton5.setBackground(new java.awt.Color(204, 0, 0));
        jButton5.setForeground(new java.awt.Color(255, 255, 255));
        jButton5.setText("Finalizar");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton5, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 550, 130, -1));

        jLabel9.setFont(new java.awt.Font("Microsoft JhengHei UI", 0, 14)); // NOI18N
        jLabel9.setText("Categoria de recipientes a Entregar");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 70, 260, 40));

        jComboBox6.setEnabled(false);
        jPanel1.add(jComboBox6, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 110, 170, -1));

        jButton6.setForeground(new java.awt.Color(204, 0, 0));
        jButton6.setText("Eliminar ");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton6, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 550, 130, -1));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 645, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 585, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jComboBox2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        jComboBox1.setEnabled(false);
        String descp = jComboBox1.getSelectedItem().toString();
        int id=1;
        for(int i = 0; i<array.size(); i++){  
             if(descp.equals(array.get(i).descripcion)){
                 id = array.get(i).id;
                 Recid= id;
             }
        }
        System.out.println(id);
        ArrayList<Productor> array2 = objeto3.getProducers(id);
        ArrayList<Categoria> array4 = objeto4.getCategorias();
        
        jComboBox2.enable(true);
        jComboBox5.setEnabled(true);
        jComboBox6.setEnabled(true);
        jComboBox2.removeAllItems();
        jComboBox6.removeAllItems();
        jComboBox5.removeAllItems();
        
        
        for(int i = 0; i<array2.size(); i++){  
             jComboBox2.addItem(array2.get(i).descripcion);
        }
        
        for(int i = 0; i<array4.size(); i++){  
             jComboBox5.addItem(array4.get(i).descripcion);
             jComboBox6.addItem(array4.get(i).descripcion);
        }
        
 
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        jComboBox2.setEnabled(false);
//llenar productores 
        String descp = jComboBox2.getSelectedItem().toString();
        int id=1;
        ArrayList<Productor> array2 = objeto3.getProducers(Recid);
        for(int i = 0; i<array2.size(); i++){  
             if(descp.equals(array2.get(i).descripcion)){
                 id = array2.get(i).id;
                 locid=id;
             }
        }
        jComboBox3.setEnabled(true);
        jTextField1.setEnabled(true);
        jButton1.setEnabled(true);
        System.out.println(id);
        ArrayList<Producto> array3 = objeto4.getProducts(locid);
        
        jComboBox3.removeAllItems();
        for(int i = 0; i<array3.size(); i++){  
             jComboBox3.addItem(array3.get(i).nombre);
        }
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
       

        String nomb = jComboBox3.getSelectedItem().toString();
        int prodid = 1;
        ArrayList<Producto> array3 = objeto4.getProducts(locid);
         for(int i = 0; i<array3.size(); i++){  
             if(nomb.equals(array3.get(i).nombre)){
                 prodid = array3.get(i).id;                
             }
        }

         
         //Validar Categoria correspondiente
         int catid = 0;
         ArrayList<Categoria> array4 = objeto4.getCategorias();
         String catnom = jComboBox5.getSelectedItem().toString();
         for(int i = 0; i<array4.size(); i++){  
             if(catnom.equals(array4.get(i).descripcion)){
                 catid = array4.get(i).id;
             }
        }
         
         Clase a = new Clase();
         boolean result = a.checkCat(prodid, catid);
         if(!result){
             JOptionPane.showMessageDialog(null,"Ese desecho no corresponde a esa categoria","ERROR", JOptionPane.ERROR_MESSAGE);
         }
         else if(jTextField1.getText().equals("")){
             JOptionPane.showMessageDialog(null,"Digite el peso","ERROR", JOptionPane.ERROR_MESSAGE);
         }
                 else{
             
                    Clase obj5 = new Clase();
                    int recId = obj5.searchContainer(prodid, "r");       
                    obj5.updateContainer(recId, 2);

                    String desecho = jComboBox3.getSelectedItem().toString();
                    String peso = jTextField1.getText();

                    String[] row = {"R",Integer.toString(recId), desecho, peso};
                    DefaultTableModel model = (DefaultTableModel) jTable1.getModel();

                    model.addRow(row);  

                    jComboBox3.removeAllItems();
                    jTextField1.setText("");
             }


    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        int respuesta = JOptionPane.showConfirmDialog(null, "¿Está seguro de que desea finalizar?", "Confirmación", JOptionPane.YES_NO_OPTION);
        if (respuesta == JOptionPane.YES_OPTION) {
            if (locid == 0){
                JOptionPane.showMessageDialog(null,"No ha seleccionado un local","ERROR", JOptionPane.ERROR_MESSAGE);
            }
            else{
                if(jTable1.getRowCount() <1 ){
                    JOptionPane.showMessageDialog(null,"No hay nada registrado","ERROR", JOptionPane.ERROR_MESSAGE);
                }
                else{
                    ArrayList<Movimiento> Movimiento =  new ArrayList<Movimiento>();
                    int accion;
                    int recipienteid;
                    Clase obj = new Clase();

                    //fecha
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                    Date currentDate = new Date();
                    String formattedDate = dateFormat.format(currentDate);
                    //


                    for (int i = 0; i < jTable1.getRowCount(); i++) {
                        if (jTable1.getValueAt(i, 0).equals("R")){
                            accion = 1;
                        }
                        else{
                            accion =2;
                        }
                       recipienteid = Integer.parseInt((String)jTable1.getValueAt(i, 1));
                       Movimiento.add(new Movimiento(userid, recipienteid, accion, Recid,locid, formattedDate ));
                    }
                    obj.insertintoTVP(Movimiento);
                    Login frame = new Login();
                    frame.setVisible(true);
                    this.dispose();
                }
            }
        } 
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jTextField1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyTyped
        if(jTextField1.getText().length() >= 6)
    {
        evt.consume();
    }
        int key = evt.getKeyChar();

        boolean numeros = key >= 48 && key <= 57;

        if (!numeros)
        {
            evt.consume();
        }

        if (jTextField1.getText().trim().length() == 10) {
            evt.consume();
        }
    }//GEN-LAST:event_jTextField1KeyTyped

    private void jTextField2KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField2KeyTyped
        if(jTextField2.getText().length() >= 6)
    {
        evt.consume();
    }
        int key = evt.getKeyChar();

        boolean numeros = key >= 48 && key <= 57;

        if (!numeros)
        {
            evt.consume();
        }

        if (jTextField2.getText().trim().length() == 10) {
            evt.consume();
        }
    }//GEN-LAST:event_jTextField2KeyTyped

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        if(jTable1.getSelectedRow() != -1){
            Clase obj = new Clase();
            int recId = Integer.parseInt((String) jTable1.getValueAt(jTable1.getSelectedRow(), 1));
            if(jTable1.getValueAt(jTable1.getSelectedRow(), 0).equals("R")){
                obj.updateContainer(recId, 1);
            }
            else{
                obj.updateContainer(recId, 2);
            }
            model.removeRow(jTable1.getSelectedRow());
        }
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        if (jTextField2.getText().equals("")){
            JOptionPane.showMessageDialog(null,"Digite una cantidad","ERROR", JOptionPane.ERROR_MESSAGE);

        }else{
            String catnom = jComboBox6.getSelectedItem().toString();
            int catid = 0;
            ArrayList<Categoria> array4 = objeto4.getCategorias();
            for(int i = 0; i<array4.size(); i++){  
                if(catnom.equals(array4.get(i).descripcion)){
                    catid = array4.get(i).id;
                }
            }
            int cant = Integer.parseInt(jTextField2.getText()); 
            Clase obj5 = new Clase();
            for (int i = 1; i<= cant; i++){
                int recId = obj5.searchContainer(catid, "e");  
                obj5.updateContainer(recId, 1);
                String[] row = {"E",Integer.toString(recId), catnom, "1"};
                DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
                model.addRow(row); 
            }
             
            jTextField2.setText("");
        
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(CheckExchange.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(CheckExchange.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(CheckExchange.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(CheckExchange.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CheckExchange().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JComboBox<String> jComboBox5;
    private javax.swing.JComboBox<String> jComboBox6;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    // End of variables declaration//GEN-END:variables
}
