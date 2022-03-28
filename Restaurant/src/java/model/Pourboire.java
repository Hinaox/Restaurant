/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author amboa
 */
public class Pourboire {
    String idServeur;
    String nom;
    Double totalPourboire;

    public Pourboire() {
    }

    public Pourboire(String idServeur, String nom, Double totalPourboire) {
        this.idServeur = idServeur;
        this.nom = nom;
        this.totalPourboire = totalPourboire;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    

    public Double getTotalPourboire() {
        return totalPourboire;
    }

    public void setTotalPourboire(Double totalPourboire) {
        this.totalPourboire = totalPourboire;
    }

    public String getIdServeur() {
        return idServeur;
    }

    public void setIdServeur(String idServeur) {
        this.idServeur = idServeur;
    }

    
}
