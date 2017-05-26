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
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();

        badConsequencePanel.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        prizePanel.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        name.setText("Name");

        combatLevel.setText("Combat Level");

        levelChangeAgainstCultistPlayer.setText("Level Changed Against Cultist");

        jLabel1.setText("Prize:");

        jLabel2.setText("Bad Consequence:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(combatLevel)
                    .addComponent(levelChangeAgainstCultistPlayer)
                    .addComponent(name))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 106, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1)
                    .addComponent(prizePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(30, 30, 30))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(badConsequencePanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(11, 11, 11)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(name)
                    .addComponent(jLabel1))
                .addGap(11, 11, 11)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(combatLevel)
                        .addGap(11, 11, 11)
                        .addComponent(levelChangeAgainstCultistPlayer))
                    .addComponent(prizePanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(badConsequencePanel, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(20, 20, 20))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private GUI.BadConsequenceView badConsequencePanel;
    private javax.swing.JLabel combatLevel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel levelChangeAgainstCultistPlayer;
    private javax.swing.JLabel name;
    private GUI.PendingBadConsequenceView pendingBadConsequenceView1;
    private GUI.PrizeView prizePanel;
    // End of variables declaration//GEN-END:variables
}
