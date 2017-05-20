/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import napakalaki.Treasure;

/**
 *
 * @author Ocete
 */
public class TreasureView extends javax.swing.JPanel {

    Treasure treasureModel;
    
    public TreasureView() {
        initComponents();
    }

    public void setTreasure(Treasure t) {
        treasureModel = t;
        this.name.setText("Nombre: " + t.getName());
        this.bonus.setText("Bonus: " + Integer.toString(t.getBonus()));
        String s = "Tipo: ";
        switch (t.getType()) {
            case BOTHHANDS: 
                s += "BOTHHANDS";
                break;
            case ONEHAND: 
                s += "ONEHAND";
                break;
            case SHOE: 
                s += "SHOE";
                break;
            case HELMET: 
                s += "HELMET";
                break;
            default:
                s += "ARMOR";
        }
        this.treasureKind.setText(s);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        name = new javax.swing.JLabel();
        bonus = new javax.swing.JLabel();
        treasureKind = new javax.swing.JLabel();

        name.setText("Name");

        bonus.setText("Bonus");

        treasureKind.setText("Type");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(name)
                    .addComponent(bonus)
                    .addComponent(treasureKind))
                .addContainerGap(121, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(name)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(bonus, javax.swing.GroupLayout.PREFERRED_SIZE, 14, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(treasureKind)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel bonus;
    private javax.swing.JLabel name;
    private javax.swing.JLabel treasureKind;
    // End of variables declaration//GEN-END:variables
}
