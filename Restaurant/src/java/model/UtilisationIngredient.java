/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author amboa
 */
public class UtilisationIngredient {
    String idIngredient;
    String nom;
    double prix;
    double quantite;

    public UtilisationIngredient() {
    }

    public UtilisationIngredient(String idIngredient, double quantite) {
        this.idIngredient = idIngredient;
        this.quantite = quantite;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getPrix() {
        return prix * this.quantite;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
    
    public String getIdIngredient() {
        return idIngredient;
    }

    public void setIdIngredient(String idIngredient) {
        this.idIngredient = idIngredient;
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }
    
}
