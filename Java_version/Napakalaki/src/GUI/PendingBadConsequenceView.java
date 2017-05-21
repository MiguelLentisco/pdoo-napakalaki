package GUI;

import napakalaki.BadConsequence;
import napakalaki.NumericBadConsequence;
import napakalaki.SpecificBadConsequence;

public class PendingBadConsequenceView extends javax.swing.JPanel {

    BadConsequence pendingBadConsequenceModel;
    
    public PendingBadConsequenceView() {
        initComponents();
    }

    public void setPendingBadConsequence (BadConsequence bC) {
        pendingBadConsequenceModel = bC;
        this.text.setText(pendingBadConsequenceModel.getText());
        String treasuresText;
        if (pendingBadConsequenceModel instanceof NumericBadConsequence) {
            treasuresText = "Visibles: " + Integer.toString(
                ((NumericBadConsequence) pendingBadConsequenceModel).
                getNVisibleTreasures()) + "\nHidden: " + Integer.toString(
                ((NumericBadConsequence) pendingBadConsequenceModel).
                getNHiddenTreasures());            
        } else {
            treasuresText = "Visibles: " + 
                ((SpecificBadConsequence) pendingBadConsequenceModel).
                getSpecificVisibleTreasures() + "\nHidden: " + 
                ((SpecificBadConsequence) pendingBadConsequenceModel).
                getSpecificHiddenTreasures();
        }
        this.treasuresView.setText(treasuresText);
        repaint();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        text = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        treasuresView = new javax.swing.JLabel();

        text.setText("Text");

        jLabel2.setText("Treasures to discard:");

        treasuresView.setText("Treasures");
        treasuresView.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(treasuresView, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(text)
                    .addComponent(jLabel2))
                .addContainerGap(66, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(text)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(treasuresView, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(43, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel text;
    private javax.swing.JLabel treasuresView;
    // End of variables declaration//GEN-END:variables
}
