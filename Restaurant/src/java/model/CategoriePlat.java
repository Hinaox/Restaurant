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
public class CategoriePlat {
    String id;
    String idPlat;
    String idCategorie;

    public CategoriePlat() {
    }

    public CategoriePlat(String id, String idPlat, String idCategorie) {
        this.id = id;
        this.idPlat = idPlat;
        this.idCategorie = idCategorie;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public String getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(String idCategorie) {
        this.idCategorie = idCategorie;
    }
    
}
