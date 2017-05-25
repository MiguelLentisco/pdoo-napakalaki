/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import napakalaki.Napakalaki;

/**
 *
 * @author Ocete
 */
public class NapakalakiView extends javax.swing.JFrame {

    Napakalaki napakalakiModel;
            
    public void setNapakalaki (Napakalaki n) {
        napakalakiModel = n;
        currentPlayerView.setNapakalakiModel(napakalakiModel);
        currentPlayerView.setPlayer(n.getCurrentPlayer());
        monsterView.setVisible(false);
        combatResult.setText("Combat result: NO COMBAT");
        combatButton.setEnabled(false);
        nextTurnButton.setEnabled(false);
        currentPlayerView.setStealTreasureButton(false);
        repaint();
        revalidate();
    }
    
    public NapakalakiView() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        playerView = new GUI.PlayerView();
        monsterView = new GUI.MonsterView();
        jLabel1 = new javax.swing.JLabel();
        meetTheMonsterButton = new javax.swing.JButton();
        combatButton = new javax.swing.JButton();
        nextTurnButton = new javax.swing.JButton();
        combatResult = new javax.swing.JLabel();
        currentPlayerView = new GUI.PlayerView();
        jLabel2 = new javax.swing.JLabel();

        playerView.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        monsterView.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel1.setText("Current Monster");

        meetTheMonsterButton.setText("Meet the monster");
        meetTheMonsterButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                meetTheMonsterButtonActionPerformed(evt);
            }
        });

        combatButton.setText("Combat");
        combatButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                combatButtonActionPerformed(evt);
            }
        });

        nextTurnButton.setText("Next turn");

        combatResult.setText("Combat Result");

        currentPlayerView.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        currentPlayerView.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                currentPlayerViewKeyPressed(evt);
            }
        });

        jLabel2.setText("Current Player");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(currentPlayerView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(38, 38, 38)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(monsterView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(meetTheMonsterButton)
                            .addComponent(nextTurnButton))
                        .addGap(104, 104, 104)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(combatResult, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(combatButton, javax.swing.GroupLayout.Alignment.TRAILING))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(371, 371, 371)
                .addComponent(jLabel2)
                .addGap(516, 516, 516)
                .addComponent(jLabel1)
                .addGap(118, 118, 118))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 14, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(monsterView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(74, 74, 74)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(meetTheMonsterButton)
                            .addComponent(combatButton))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(nextTurnButton)
                            .addComponent(combatResult)))
                    .addComponent(currentPlayerView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(34, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void combatButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_combatButtonActionPerformed
        
    }//GEN-LAST:event_combatButtonActionPerformed

    private void meetTheMonsterButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_meetTheMonsterButtonActionPerformed
        
    }//GEN-LAST:event_meetTheMonsterButtonActionPerformed

    private void currentPlayerViewKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_currentPlayerViewKeyPressed
        // TODO add your handling code here:
    }//GEN-LAST:event_currentPlayerViewKeyPressed

    public void showView() {
        this.setVisible(true);
        repaint();
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton combatButton;
    private javax.swing.JLabel combatResult;
    private GUI.PlayerView currentPlayerView;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JButton meetTheMonsterButton;
    private GUI.MonsterView monsterView;
    private javax.swing.JButton nextTurnButton;
    private GUI.PlayerView playerView;
    // End of variables declaration//GEN-END:variables
}
