/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author toavi
 */
public class EtatIngredient {
    String nom;
    double quantite;

    public EtatIngredient() {
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nomString) {
        this.nom = nomString;
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }
    
    
}
