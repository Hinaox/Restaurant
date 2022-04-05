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
public class Commande extends Mere{
    String id;
    String numTable;
    String dateCommande;

    public Commande() {
    }

    public Commande(String id, String idServeur, String idTable, String dateCommande) {
        this.id = id;
        this.numTable = idTable;
        this.dateCommande = dateCommande;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNumTable() {
        return numTable;
    }

    public void setNumTable(String idTable) {
        this.numTable = idTable;
    }

    public String getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(String dateCommande) {
        this.dateCommande = dateCommande;
    }
    
}
