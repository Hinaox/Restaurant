/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import db.ManipDb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
    
    public static Vector<Plat> listePlatCategorie(String id) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String req = "SELECT * FROM plat WHERE id IN (SELECT idPlat FROM categoriePlat WHERE idCategorie ='"+id+"' )";
            System.out.println(req);
            ResultSet res = stmt.executeQuery(req);
            Vector<Plat> listePlat = new Vector();
            while(res.next()) {
                Plat p = new Plat();
                p.setId(res.getString("id"));
                p.setNom(res.getString("nom"));
                p.setPrix(res.getDouble("prix"));
                listePlat.add(p);
            }
            return listePlat;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }  
    }
}