package GUI;

import java.util.ArrayList;
import javax.swing.JPanel;
import napakalaki.CultistPlayer;
import napakalaki.Player;
import napakalaki.Treasure;

public class PlayerView extends javax.swing.JPanel {

    private Player playerModel;
    
    public PlayerView() {
        initComponents();
    }

    public void setPlayer(Player p) {
        playerModel = p;
        this.name.setText("Name: " + playerModel.getName());
        this.level.setText("Level: " + 
                Integer.toString(playerModel.getLevels()));
        this.death.setText("Dead: " + 
                Boolean.toString(playerModel.isDead()));
        this.canISteal.setText("CanISteal: " + 
                Boolean.toString(playerModel.canISteal()));
        this.enemy.setText("Enemy: " + playerModel.getEnemyName());
        this.cultist.setText("Cultist: " + 
                Boolean.toString(p instanceof CultistPlayer));
        this.pendingBadConsequenceView.setPendingBadConsequence(
                p.getPendingBadConsequence());
        fillTreasurePanel(visibleTreasures, playerModel.getVisibleTreasures());
        fillTreasurePanel(hiddenTreasures, playerModel.getHiddenTreasures());        
        repaint();
        revalidate();
    }
    
    private void fillTreasurePanel (JPanel aPanel, ArrayList<Treasure> aList) {
        // Se elimina la información antigua
        aPanel.removeAll();
        // Se recorre la lista de tesoros construyendo y añadiendo sus vistas
        // al panel
        for (Treasure t : aList) {
            TreasureView aTreasureView = new TreasureView();
            aTreasureView.setTreasure (t);
            aTreasureView.setVisible (true);
            aPanel.add (aTreasureView);
        }
        // Se fuerza la actualización visual del panel
        aPanel.repaint();
        aPanel.revalidate();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        name = new javax.swing.JLabel();
        level = new javax.swing.JLabel();
        death = new javax.swing.JLabel();
        canISteal = new javax.swing.JLabel();
        enemy = new javax.swing.JLabel();
        cultist = new javax.swing.JLabel();
        visibleTreasures = new javax.swing.JPanel();
        hiddenTreasures = new javax.swing.JPanel();
        stealTreasure = new javax.swing.JButton();
        makeVisible = new javax.swing.JButton();
        discardTreasures = new javax.swing.JButton();
        discardAllTreasures = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        pendingBadConsequenceView = new GUI.PendingBadConsequenceView();
        jLabel1 = new javax.swing.JLabel();

        name.setText("Name");

        level.setText("Level");

        death.setText("Death");

        canISteal.setText("CanISteal");

        enemy.setText("Enemy");

        cultist.setText("Cultist");

        visibleTreasures.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        hiddenTreasures.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        stealTreasure.setText("Steal Treasure");
        stealTreasure.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                stealTreasureActionPerformed(evt);
            }
        });

        makeVisible.setText("Make Visible");

        discardTreasures.setText("Discard Treasures");

        discardAllTreasures.setText("Discard All Treasures");

        jLabel2.setText("Visible Treasures");

        jLabel3.setText("Hidden Treasures");

        pendingBadConsequenceView.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel1.setText("Pending Bad Consequence");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(stealTreasure)
                        .addGap(78, 78, 78)
                        .addComponent(makeVisible)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 67, Short.MAX_VALUE)
                        .addComponent(discardTreasures)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 34, Short.MAX_VALUE)
                        .addComponent(discardAllTreasures))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(death)
                            .addComponent(canISteal)
                            .addComponent(enemy)
                            .addComponent(cultist)
                            .addComponent(level)
                            .addComponent(name))
                        .addGap(55, 55, 55)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(pendingBadConsequenceView, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel1))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(hiddenTreasures, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(visibleTreasures, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3)
                            .addComponent(jLabel2))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(visibleTreasures, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(14, 14, 14)
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(hiddenTreasures, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(name)
                            .addComponent(jLabel1))
                        .addGap(8, 8, 8)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(level)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(death)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(canISteal)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(enemy)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(cultist))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addComponent(pendingBadConsequenceView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 25, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(stealTreasure)
                    .addComponent(makeVisible)
                    .addComponent(discardTreasures)
                    .addComponent(discardAllTreasures))
                .addGap(24, 24, 24))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void stealTreasureActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_stealTreasureActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_stealTreasureActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel canISteal;
    private javax.swing.JLabel cultist;
    private javax.swing.JLabel death;
    private javax.swing.JButton discardAllTreasures;
    private javax.swing.JButton discardTreasures;
    private javax.swing.JLabel enemy;
    private javax.swing.JPanel hiddenTreasures;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel level;
    private javax.swing.JButton makeVisible;
    private javax.swing.JLabel name;
    private GUI.PendingBadConsequenceView pendingBadConsequenceView;
    private javax.swing.JButton stealTreasure;
    private javax.swing.JPanel visibleTreasures;
    // End of variables declaration//GEN-END:variables
}
