package GUI;

import napakalaki.BadConsequence;

public class BadConsequenceView extends javax.swing.JPanel {

    private BadConsequence badConsequenceModel;
    
    public BadConsequenceView() {
        initComponents();
    }

    public void setBadConsequence(BadConsequence bC) {
        badConsequenceModel = bC;
        this.badConsequencePanel.setText("<html>" + 
                badConsequenceModel.getText() + "<html>");
        repaint();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        badConsequencePanel = new javax.swing.JLabel();

        badConsequencePanel.setText("Mal Rollo");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(badConsequencePanel)
                .addContainerGap(78, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(badConsequencePanel)
                .addContainerGap(50, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel badConsequencePanel;
    // End of variables declaration//GEN-END:variables
}
