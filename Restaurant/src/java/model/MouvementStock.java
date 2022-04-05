/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.Mere;
import java.util.Date;

/**
 *
 * @author amboa
 */
public class MouvementStock extends Mere{
    String idProduit;
    Date daty;
    String mouvement;
    double qte;

    public MouvementStock() {
    }

    public MouvementStock(String idProduit, Date daty, String mouvement, double quantite) {
        this.idProduit = idProduit;
        this.daty = daty;
        this.mouvement = mouvement;
        this.qte = quantite;
    }

    public String getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(String idProduit) {
        this.idProduit = idProduit;
    }

    public Date getDaty() {
        return daty;
    }

    public void setDaty(Date daty) {
        this.daty = daty;
    }

    public String getMouvement() {
        return mouvement;
    }

    public void setMouvement(String mouvement) {
        this.mouvement = mouvement;
    }

    public double getQte() {
        return qte;
    }

    public void setQte(double qte) {
        this.qte = qte;
    }

    
    
}
