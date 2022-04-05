/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import db.ManipDb;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.MouvementStock;
import static services.Service.database;
import static services.Service.password;
import static services.Service.user;

/**
 *
 * @author amboa
 */
public class StockService extends Service{
    public static void ajoutStock(String idProduit, Date daty, double quantite) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            MouvementStock mouvement = new MouvementStock();
            mouvement.setDaty(daty);
            mouvement.setIdProduit(idProduit);
            mouvement.setQte(quantite);
            mouvement.setMouvement("ajout");
            mouvement.insert(con);
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void retraitStock(String idProduit, Date daty, double quantite) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            MouvementStock mouvement = new MouvementStock();
            mouvement.setDaty(daty);
            mouvement.setIdProduit(idProduit);
            mouvement.setQte(-quantite);
            mouvement.setMouvement("retrait");
            mouvement.insert(con);
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
