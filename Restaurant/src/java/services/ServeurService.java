/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import db.ManipDb;
import java.sql.Connection;
import java.util.Vector;
import model.DetailsCommande;
import model.Serveur;
import static services.Service.database;
import static services.Service.password;
import static services.Service.user;

/**
 *
 * @author amboa
 */
public class ServeurService {
    
    public static Vector<Serveur> listeServeur() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Serveur model = new Serveur();
            Object[] result = model.findAll(con, "");
            Vector<Serveur> listeDetailsCommande = new Vector();
            for(Object  elt: result) {
                listeDetailsCommande.add((Serveur) elt);
            }
            con.close();
            return listeDetailsCommande;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
