/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.ManipDb;
import db.Mere;
import java.sql.Connection;
import java.sql.SQLException;
import services.Service;

/**
 *
 * @author amboa
 */
public class DetailsCommande extends Mere{
    String id;
    String idCommande;
    String idPlat;
    String idServeur;
    Double prix;
    Integer etape;

    public DetailsCommande(String id, String idCommande, String idPlat, String idServeur, Double prix, Integer etape) {
        this.id = id;
        this.idCommande = idCommande;
        this.idPlat = idPlat;
        this.idServeur = idServeur;
        this.prix = prix;
        this.etape = etape;
    }
    
    public void enPreparation(Connection con) throws SQLException {
        this.setEtape(1);
        this.update(con, this);
    }
    
    public void estPrepare(Connection con) throws SQLException {
        this.setEtape(2);
        this.update(con, this);
    }

    public DetailsCommande() {
    }

    public Integer getEtape() {
        return etape;
    }

    public void setEtape(Integer etape) {
        this.etape = etape;
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

    public String getIdServeur() {
        return idServeur;
    }

    public void setIdServeur(String idServeur) {
        this.idServeur = idServeur;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }
    
}
