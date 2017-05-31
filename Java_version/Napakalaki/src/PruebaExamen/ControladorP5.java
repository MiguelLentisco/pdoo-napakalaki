/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PruebaExamen;

import GUI.PendingBadConsequenceView;
import GUI.BadConsequenceView;
import GUI.TreasureView;
import NapakalakiGame.BadConsequence;
import NapakalakiGame.DeathBadConsequence;
import NapakalakiGame.NumericBadConsequence;
import NapakalakiGame.SpecificBadConsequence;
import NapakalakiGame.Treasure;
import NapakalakiGame.TreasureKind;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Laura
 */
public class ControladorP5 {
    private static ControladorP5 instance=null;
    private ArrayList<Treasure> tesoros;
    private ArrayList<BadConsequence> badcons;
    
    private ControladorP5(){
        tesoros = new ArrayList (0);
        badcons = new ArrayList (0);
    }
    
    public static ControladorP5 getInstance(){
        if(instance==null){
            instance = new ControladorP5();
        }
        return instance;
    }
    
    public TreasureView getTreasure(TreasureKind type){
        Treasure t=new Treasure("Treasure", 0, type);
        TreasureView tV = new TreasureView();
        tV.setTreasure(t);
        tesoros.add(t);
        return tV;
    }
    
    public BadConsequenceView getDeathBadConsequence(){
       DeathBadConsequence deathBC = new DeathBadConsequence("Death bad consequence");
       BadConsequenceView bCV = new BadConsequenceView();
       bCV.setBadConsequence(deathBC);
       badcons.add(deathBC);
       return bCV;
    }
    
    public BadConsequenceView getNumericBadConsequence(){
       NumericBadConsequence numericBC = new NumericBadConsequence("bc", 1, 2, 3);
       BadConsequenceView bCV = new BadConsequenceView();
       bCV.setBadConsequence(numericBC);
       badcons.add(numericBC);
       return bCV;
    }
        
    public BadConsequenceView getSpecificBadConsequence(){
        SpecificBadConsequence specificBC = new SpecificBadConsequence("bc",0,
                new ArrayList(0), new ArrayList(Arrays.
                asList(TreasureKind.ONEHAND, TreasureKind.ONEHAND, 
                TreasureKind.SHOE)));
       BadConsequenceView bCV = new BadConsequenceView();
       bCV.setBadConsequence(specificBC);
       badcons.add(specificBC);
       return bCV;
    }
    
    public ArrayList<PendingBadConsequenceView> adjust(){
        ArrayList<PendingBadConsequenceView> array = new ArrayList(0);
        BadConsequence bC;
        for(BadConsequence b: badcons){
            bC = b.adjustToFitTreasureLists(new ArrayList(0), tesoros);
            PendingBadConsequenceView pendingView = new PendingBadConsequenceView();
            pendingView.setPendingBadConsequence(bC);
            array.add(pendingView);
        }
        return array;
    }
}
