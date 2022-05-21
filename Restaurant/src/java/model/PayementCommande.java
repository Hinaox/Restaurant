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
public class PayementCommande extends Mere {
    String idCommande;
    String idTypePayement;
    String idClient;
    Date datePayement;
    double montant;
    String numTable;
    String nomType;

    public PayementCommande() {
    }

    public PayementCommande(String idCommande, String idTypePaiement, String idClient, Date datePayement, double montant, String numTable, String nomType) {
        this.idCommande = idCommande;
        this.idTypePayement = idTypePaiement;
        this.idClient = idClient;
        this.datePayement = datePayement;
        this.montant = montant;
        this.numTable = numTable;
        this.nomType = nomType;
    }

    public String getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(String idCommande) {
        this.idCommande = idCommande;
    }

    public String getIdTypePayement() {
        return idTypePayement;
    }

    public void setIdTypePayement(String idTypePaiement) {
        this.idTypePayement = idTypePaiement;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }

    public Date getDatePayement() {
        return datePayement;
    }

    public void setDatePayement(Date datePayement) {
        this.datePayement = datePayement;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public String getNumTable() {
        return numTable;
    }

    public void setNumTable(String numTable) {
        this.numTable = numTable;
    }

    public String getNomType() {
        return nomType;
    }

    public void setNomType(String nomType) {
        this.nomType = nomType;
    }
    
}
