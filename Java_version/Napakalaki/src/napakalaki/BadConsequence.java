package napakalaki;


import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mike
 */

public class BadConsequence {
    private String text;
    private int levels;
    private int nVisibleTreasures;
    private int nHiddenTreasures;
    private boolean death;
    private ArrayList<TreasureKind> specificHiddenTreasures = new ArrayList();
    private ArrayList<TreasureKind> specificVisibleTreasures = new ArrayList();
    
    public BadConsequence(String text, int levels, int nVisible, int nHidden)
    {
        this.text = text;
        this.levels = levels;
        this.nVisibleTreasures = nVisible;
        this.nHiddenTreasures = nHidden;
        this.death = false;
    }
    
    public BadConsequence(String text, boolean death)
    {
        this.text = text;
        this.levels = 0;
        this.nVisibleTreasures = 0;
        this.nHiddenTreasures = 0;
        this.death = death;
    }
    
    public BadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible,
                               ArrayList<TreasureKind> tHidden)
    {
        this.text = text;
        this.levels = levels;
        this.nHiddenTreasures = 0;
        this.nVisibleTreasures = 0;
        this.specificHiddenTreasures = tHidden;
        this.specificVisibleTreasures = tVisible;
        this.death = false;
    }
    
    public String getText()
    {
        return text;
    }
    
    public int getLevels()
    {
        return levels;
    }
    
    public int getNVisibleTreasures()
    {
        return nVisibleTreasures;
    }
        
    public int getNHiddenTreasures()
    {
        return nHiddenTreasures;
    }
    
    public boolean getDeath()
    {
        return death;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures()
    {
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures()
    {
        return specificVisibleTreasures;
    }
    
    public String toString()
    {
        String message = "Text = " + text;
        if (!death)
        {
            message += " levels = " + Integer.toString(levels);
            message += " hiddenTreasures = "; 
            if (specificHiddenTreasures.size() > 0)
               message += specificHiddenTreasures.toString();
            else
                message += Integer.toString(nHiddenTreasures);
            message += "visibleTreasures = ";
            if (specificVisibleTreasures.size() > 0)
                message += specificVisibleTreasures.toString();
            else
                message += Integer.toString(nVisibleTreasures);
            
        }
       message += " death = " + Boolean.toString(death);
       
       return message;
    }
    
}