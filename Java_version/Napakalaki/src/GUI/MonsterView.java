package GUI;

import napakalaki.Monster;

public class MonsterView extends javax.swing.JPanel {

    Monster monsterModel;
    
    public MonsterView() {
        initComponents();
    }
    
    public void setMonster(Monster m) {
        monsterModel = m;
        this.name.setText("Name: " + monsterModel.getName());
        this.combatLevel.setText("Combat level: " + 
                Integer.toString(monsterModel.getCombatLevel()));
        this.levelChangeAgainstCultistPlayer.setText(
                "Level change against cultist: " + 
                monsterModel.getLevelChangeAgainstCultistPlayer());
        this.prizePanel.setPrize(m.getPrize());
        this.badConsequencePanel.setBadConsequence(
                monsterModel.getBadConsequence());
        repaint();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pendingBadConsequenceView1 = new GUI.PendingBadConsequenceView();
        badConsequencePanel = new GUI.BadConsequenceView();
        prizePanel = new GUI.PrizeView();
        name = new javax.swing.JLabel();
        combatLevel = new javax.swing.JLabel();
        levelChangeAgainstCultistPlayer = new javax.swing.JLabel();

        badConsequencePanel.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        prizePanel.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        name.setText("Name");

        combatLevel.setText("Combat Level");

        levelChangeAgainstCultistPlayer.setText("Level Changed Against Cultist");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(name)
                    .addComponent(combatLevel)
                    .addComponent(levelChangeAgainstCultistPlayer)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(prizePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(69, 69, 69)
                        .addComponent(badConsequencePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(11, 11, 11)
                .addComponent(name)
                .addGap(11, 11, 11)
                .addComponent(combatLevel)
                .addGap(11, 11, 11)
                .addComponent(levelChangeAgainstCultistPlayer)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(prizePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(badConsequencePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private GUI.BadConsequenceView badConsequencePanel;
    private javax.swing.JLabel combatLevel;
    private javax.swing.JLabel levelChangeAgainstCultistPlayer;
    private javax.swing.JLabel name;
    private GUI.PendingBadConsequenceView pendingBadConsequenceView1;
    private GUI.PrizeView prizePanel;
    // End of variables declaration//GEN-END:variables
}
