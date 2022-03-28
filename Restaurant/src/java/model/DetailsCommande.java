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
public class DetailsCommande extends Mere{
    String id;
    String idCommande;
    String idPlat;
    String prix;

    public DetailsCommande(String idCommande, String idPlat, String prix) {
        this.idCommande = idCommande;
        this.idPlat = idPlat;
        this.prix = prix;
    }

    public DetailsCommande(String id, String idCommande, String idPlat, String prix) {
        this.id = id;
        this.idCommande = idCommande;
        this.idPlat = idPlat;
        this.prix = prix;
    }
    
    public DetailsCommande() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(String idCommande) {
        this.idCommande = idCommande;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public String getPrix() {
        return prix;
    }

    public void setPrix(String prix) {
        this.prix = prix;
    }
    
}
