/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.Mere;
import java.util.Vector;

/**
 *
 * @author amboa
 */
public class Plat extends Mere{
    String id;
    String nom;
    Double prix;

    public Plat() {
    }

    public Plat(String id, String nom, Double prix) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
    }
    
    public Vector<Ingredient> getIngredient() {
        return null;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }
    
}
