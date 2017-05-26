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
        this.text.setText("<html>" + pendingBadConsequenceModel.getText()
                + "<html>");
        this.treasuresView.setText("<html>" + bC.toDiscard() + "<html>");
        repaint();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        text = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        treasuresView = new javax.swing.JLabel();

        text.setText("Text");
        text.setBorder(new javax.swing.border.MatteBorder(null));

        jLabel2.setText("Treasures to discard:");

        treasuresView.setText("Treasures");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addComponent(text, javax.swing.GroupLayout.PREFERRED_SIZE, 188, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGroup(layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addComponent(jLabel2))
            .addGroup(layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addComponent(treasuresView, javax.swing.GroupLayout.PREFERRED_SIZE, 188, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(text, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2)
                .addGap(6, 6, 6)
                .addComponent(treasuresView, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel text;
    private javax.swing.JLabel treasuresView;
    // End of variables declaration//GEN-END:variables
}
