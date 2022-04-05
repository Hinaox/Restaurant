/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.Mere;

/**
 *
 * @author amboa
 */
public class Ingredient extends Mere{
    String idPlat;
    String nom;
    Double prix;//par gramme
    int qte;
    Double somme;

    public Ingredient() {
    }

    public Ingredient(String idPlat, String nom, Double prix, int quantite, Double somme) {
        this.idPlat = idPlat;
        this.nom = nom;
        this.prix = prix;
        this.qte = quantite;
        this.somme = somme;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
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

    public int getQte() {
        return qte;
    }

    public void setQte(int quantite) {
        this.qte = quantite;
    }

    public Double getSomme() {
        return somme;
    }

    public void setSomme(Double somme) {
        this.somme = somme;
    }
    
}
