/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import db.ManipDb;
import java.sql.Connection;
import java.util.Vector;
import model.Categorie;
import model.CategorieDetail;
import model.CategoriePlat;
import model.Plat;

/**
 *
 * @author amboa
 */
public class PlatService extends Service{
    public static Vector<Plat> listePlat() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Plat p = new Plat();
            Object[] result = p.findAll(con, "");
            Vector<Plat> listePlat = new Vector();
            for(Object elt: result) {
                listePlat.add((Plat) elt);
            }
            con.close();
            return listePlat;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }  
    }
    
    public static Vector<CategorieDetail> getCategories(String id) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            CategorieDetail model = new CategorieDetail();
            model.setIdPlat(id);
            Object[] result = model.findAll(con,"");
            Vector<CategorieDetail> listeCategorie = new Vector();
            for(Object elt: result) {
                listeCategorie.add((CategorieDetail) elt);
            }
            con.close();
            return listeCategorie;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }  
    }
}
