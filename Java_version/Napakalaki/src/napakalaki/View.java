/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

import GUI.Dice;
import GUI.NapakalakiView;
import GUI.PlayerNamesCapture;
import java.util.ArrayList;

/**
 *
 * @author Ocete
 */
public class View {
    public static void main (String[] args) {
        // Instanciamos el juego
        Napakalaki game = Napakalaki.getInstance();
        // Instanciamos la vista del juego
        NapakalakiView napakalakiView = new NapakalakiView();
        // Instanciamos el dado
        Dice.createInstance(napakalakiView);
        // Creamos un string con los nombres
        ArrayList<String> names = new ArrayList<>();
        
        // Enlazamos el juego y su vista
        napakalakiView.setNapakalaki(game);
        // Obtenemos los nombres de los jugadores
        // La ejecución no continúa hasta que se cierre esta ventana por el valor "true"
        PlayerNamesCapture namesCapture = new PlayerNamesCapture(napakalakiView,true);
        // Obetenemos los nombres de los jugadores
        names = namesCapture.getNames();
        game.initGame(names);

        
        
        napakalakiView.setVisible(true);
    }
}
