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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import model.Categorie;
import model.CategorieDetail;
import model.CategoriePlat;
import model.Ingredient;
import model.Plat;
import model.PrixDeVente;
import model.PrixRevient;
import model.UtilisationIngredient;

/**
 *
 * @author amboa
 */
public class PlatService extends Service{
    
    /*public static Double getPrixVente(Double prixRevient, Double limite1, Double limite2) {
        
    }*/
    
    public static List<UtilisationIngredient> getUtilisationIngredient() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String req = "select ingredient.idProduit, ingredient.nom, sum(ingredient.qte) as quantite, sum(ingredient.prix) as prix " +
                        "    from ingredient join detailsCommande on ingredient.idPlat=detailsCommande.idPlat " +
                        "    where detailsCommande.dateCommande between '2022-04-03' and '2022-04-10'";
            ResultSet res = stmt.executeQuery(req);
            List<UtilisationIngredient> listeUtilisation = new ArrayList();
            while(res.next()) {
                UtilisationIngredient utilisation = new UtilisationIngredient();
                utilisation.setIdIngredient(res.getString("idProduit"));
                utilisation.setNom(res.getString("nom"));
                utilisation.setPrix(res.getDouble("prix"));
                utilisation.setQuantite(res.getDouble("quantite"));
                listeUtilisation.add(utilisation);
            }
            stmt.close();
            con.close();
            return listeUtilisation;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Double getPrixRevient(String idPlat) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            PrixRevient model = new PrixRevient();
            model.setIdPlat(idPlat);
            Object[] result = model.findAll(con, "");
            model = (PrixRevient) result[0];
            con.close();
            return model.getRevient();
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Vector<PrixDeVente> allPrixDeVente() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            PrixDeVente model = new PrixDeVente();
            Object[] result = model.findAll(con, "");
            Vector<PrixDeVente> listePrixRevient = new Vector();
            for(Object elt: result) {
                listePrixRevient.add((PrixDeVente) elt);
            }
            con.close();
            return listePrixRevient;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Vector<PrixRevient> allPrixRevient() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            PrixRevient model = new PrixRevient();
            Object[] result = model.findAll(con, "");
            Vector<PrixRevient> listePrixRevient = new Vector();
            for(Object elt: result) {
                listePrixRevient.add((PrixRevient) elt);
            }
            con.close();
            return listePrixRevient;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Vector<Ingredient> getIngredient(String idPlat) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Ingredient p = new Ingredient();
            if(idPlat!=null)p.setIdPlat(idPlat);
            Object[] result = p.findAll(con, "");
            Vector<Ingredient> listePlat = new Vector();
            for(Object elt: result) {
                listePlat.add((Ingredient) elt);
            }
            con.close();
            return listePlat;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }  
    }
    
    public static Vector<Plat> getPlat(String id) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Plat p = new Plat();
            if(id!=null)p.setId(id);
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
            if(id == null) {
                req = "SELECT * FROM plat";
            }
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
    
    public static HashMap<String, Plat> listePlatParId() {
        Vector<Plat> listePlat = listePlat();
        HashMap<String, Plat> retour = new HashMap();
        for(Plat p: listePlat) {
            retour.put(p.getId(), p);
        }
        return retour;
    }
}
