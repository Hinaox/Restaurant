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
public class AdditionParTable extends Mere{
    String idCommande;
    String numTable;
    Double total;

    public AdditionParTable() {
    }

    public AdditionParTable(String idCommande, String numTable, Double total) {
        this.idCommande = idCommande;
        this.numTable = numTable;
        this.total = total;
    }

    public String getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(String idCommande) {
        this.idCommande = idCommande;
    }

    public String getNumTable() {
        return numTable;
    }

    public void setNumTable(String numTable) {
        this.numTable = numTable;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
}
