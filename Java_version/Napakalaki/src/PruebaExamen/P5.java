/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PruebaExamen;

import PruebaExamen.VentanaPrincipal;

/**
 *
 * @author Laura
 */
public class P5 {
    public static void main(String[] args) {
        VentanaPrincipal ventana=new VentanaPrincipal();
        ControladorP5 controller;
        controller=ControladorP5.getInstance();
        
        ventana.setControlador(controller);
        ventana.setVisible(true);
        
    }
}
