/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Vector;
import services.PlatService;

/**
 *
 * @author amboa
 */
public class PlatDetail {
    String id;
    String nom;
    Double prix;
    Vector<CategorieDetail> listeCategorie;

    public PlatDetail() {
    }
    
    public PlatDetail(String id, String nom, Double prix) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
        this.listeCategorie = PlatService.getCategories(id);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        this.listeCategorie = PlatService.getCategories(id);
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

    public Vector<CategorieDetail> getListeCategorie() {
        return listeCategorie;
    }

    public void setListeCategorie(Vector<CategorieDetail> listeCategorie) {
        this.listeCategorie = listeCategorie;
    }
    
}
