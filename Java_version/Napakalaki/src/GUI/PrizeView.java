package GUI;

import NapakalakiGame.Prize;

public class PrizeView extends javax.swing.JPanel {

    private Prize prizeModel;
    
    public PrizeView() {
        initComponents();
    }

    public void setPrize(Prize p) {
        prizeModel = p;
        this.treasures.setText("Treasures: " + 
                Integer.toString(prizeModel.getTreasures()));
        this.levels.setText("Levels: " + 
                Integer.toString(prizeModel.getLevels()));
        repaint();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        treasures = new javax.swing.JLabel();
        levels = new javax.swing.JLabel();

        treasures.setText("Treasures");

        levels.setText("Levels");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(treasures)
                    .addComponent(levels))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(treasures)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(levels)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel levels;
    private javax.swing.JLabel treasures;
    // End of variables declaration//GEN-END:variables
}
