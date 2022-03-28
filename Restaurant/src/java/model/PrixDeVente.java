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
public class PrixDeVente extends Mere {
    String id;
    Double montant1;
    Double montant2;
    Double marge;
    String idPlat;
    Double revient;
    Double prixVente;

    public PrixDeVente() {
    }

    public PrixDeVente(String id, Double montant1, Double montant2, Double marge, String idPlat, Double revient, Double prixVente) {
        this.id = id;
        this.montant1 = montant1;
        this.montant2 = montant2;
        this.marge = marge;
        this.idPlat = idPlat;
        this.revient = revient;
        this.prixVente = prixVente;
    }

    public Double getMarge() {
        return marge;
    }

    public void setMarge(Double marge) {
        this.marge = marge;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Double getMontant1() {
        return montant1;
    }

    public void setMontant1(Double montant1) {
        this.montant1 = montant1;
    }

    public Double getMontant2() {
        return montant2;
    }

    public void setMontant2(Double montant2) {
        this.montant2 = montant2;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public Double getRevient() {
        return revient;
    }

    public void setRevient(Double revient) {
        this.revient = revient;
    }

    public Double getPrixVente() {
        return prixVente;
    }

    public void setPrixVente(Double prixVente) {
        this.prixVente = prixVente;
    }
    
}
