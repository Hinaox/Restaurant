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
public class Livraison extends Mere{
    String id;
    String idDetailsCommande;

    public Livraison() {
    }

    public Livraison(String id, String idDetailsCommande) {
        this.id = id;
        this.idDetailsCommande = idDetailsCommande;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdDetailsCommande() {
        return idDetailsCommande;
    }

    public void setIdDetailsCommande(String idDetailsCommande) {
        this.idDetailsCommande = idDetailsCommande;
    }
    
}
