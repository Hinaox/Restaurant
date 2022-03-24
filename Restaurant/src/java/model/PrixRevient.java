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
public class PrixRevient extends Mere{
    String idPlat;
    Double revient;

    public PrixRevient() {
    }

    public PrixRevient(String idPlat, Double revient) {
        this.idPlat = idPlat;
        this.revient = revient;
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
    
}
