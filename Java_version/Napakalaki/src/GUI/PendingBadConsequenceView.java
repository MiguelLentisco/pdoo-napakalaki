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
        this.text.setText("<html>" + pendingBadConsequenceModel.getText() +
                "<html>");
        String treasuresText;
        if (pendingBadConsequenceModel instanceof NumericBadConsequence) {
            treasuresText = "Visibles: " + Integer.toString(
                ((NumericBadConsequence) pendingBadConsequenceModel).
                getNVisibleTreasures()) + " Hidden: " + Integer.toString(
                ((NumericBadConsequence) pendingBadConsequenceModel).
                getNHiddenTreasures());            
        } else {
            treasuresText = "Visibles: " + 
                ((SpecificBadConsequence) pendingBadConsequenceModel).
                getSpecificVisibleTreasures() + " Hidden: " + 
                ((SpecificBadConsequence) pendingBadConsequenceModel).
                getSpecificHiddenTreasures();
        }
        this.treasuresView.setText("<html>" + treasuresText + "<html>");
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
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(91, 96, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(treasuresView, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(text, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(text)
                .addGap(18, 18, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(4, 4, 4)
                .addComponent(treasuresView, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel text;
    private javax.swing.JLabel treasuresView;
    // End of variables declaration//GEN-END:variables
}
