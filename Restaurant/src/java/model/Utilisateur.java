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
public class Utilisateur extends Mere{
    String id;
    String idProfil;
    String login;
    String mot_de_passe;

    public Utilisateur(String id, String idProfil, String login, String mot_de_passe) {
        this.id = id;
        this.idProfil = idProfil;
        this.login = login;
        this.mot_de_passe = mot_de_passe;
    }

    public Utilisateur() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdProfil() {
        return idProfil;
    }

    public void setIdProfil(String idProfil) {
        this.idProfil = idProfil;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMot_de_passe() {
        return mot_de_passe;
    }

    public void setMot_de_passe(String mot_de_passe) {
        this.mot_de_passe = mot_de_passe;
    }
    
}
