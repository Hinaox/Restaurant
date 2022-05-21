/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import db.ManipDb;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.PayementCommande;

/**
 *
 * @author amboa
 */
public class PayementService extends Service{
    
    public static HashMap<String, List<PayementCommande>> listePaiement(String dateDebut, String dateFin) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            PayementCommande model = new PayementCommande();
            String extra = "";
            if(dateDebut!=null && dateFin!=null)
                extra = " datePayement BETWEEN '"+dateDebut+"' AND '"+dateFin+"'";
            else if(dateDebut!=null && dateFin==null)
                extra = " datePayement > '"+dateDebut+"'";
            if(dateDebut==null && dateFin!=null)
                extra = " datePayement < '"+dateFin+"'";
            Object[] result = model.findAll(con, extra);
            HashMap<String, List<PayementCommande>> retour = new HashMap();
            for(Object elt: result) {
                PayementCommande temp = (PayementCommande) elt;
                if(retour.get(temp.getIdTypePayement()) == null) {
                    List<PayementCommande> liste = new ArrayList();
                    liste.add(temp);
                    retour.put(temp.getIdTypePayement(), liste);
                } else {
                    List<PayementCommande> liste = retour.get(temp.getIdTypePayement());
                    liste.add(temp);
                }
            }
            con.close();
            return retour;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static HashMap<String, Double> listeTotal(HashMap<String, List<PayementCommande>> listePayementGroupe) {
        HashMap<String, Double> retour = new HashMap();
        String[] keys = listePayementGroupe.keySet().toArray(new String[listePayementGroupe.size()]);
        for(String key: keys) {
            retour.put(key, new Double(totalPaiement(listePayementGroupe.get(key))));
        }
        return retour;
    }
    
    public static double totalPaiement(List<PayementCommande> listePayement) {
        double count = 0;
        for(PayementCommande p: listePayement) {
            count += p.getMontant();
        }
        return count;
    }
}
