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
import java.util.List;
import java.util.Vector;
import model.AdditionParTable;
import model.Commande;
import model.DetailsCommande;
import model.DetailsCommandeNonLivre;
import model.Pourboire;
import model.PrixDeVente;
import model.Tables;
import static services.Service.database;
import static services.Service.password;
import static services.Service.user;

/**
 *
 * @author amboa
 */
public class CommandeService extends Service{
    
    public static void platEnPreparation(DetailsCommande d) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            d.enPreparation(con);
            con.close();
        } catch(Exception e ){
            e.printStackTrace();
        }
    }
    
    public static void platPrepare(DetailsCommande d) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            d.estPrepare(con);
            con.close();
        } catch(Exception e ){
            e.printStackTrace();
        }
    }
    
    public static DetailsCommande[] getListeLivraisonExterieur() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            DetailsCommande d = new DetailsCommande();
            Object[] result = d.getFromView(con, "detailsCommandePret", " WHERE idTables = 'Tables1'");
            DetailsCommande[] listeNonPrepare = new DetailsCommande[result.length];
            for(int i=0; i<result.length; i++) listeNonPrepare[i] = (DetailsCommande) result[i];
            con.close();
            return listeNonPrepare;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static DetailsCommande[] listeDetailsCommandePret() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            DetailsCommande d = new DetailsCommande();
            Object[] result = d.getFromView(con, "detailsCommandePret", " WHERE idTables != 'Tables1'");
            DetailsCommande[] listeNonPrepare = new DetailsCommande[result.length];
            for(int i=0; i<result.length; i++) listeNonPrepare[i] = (DetailsCommande) result[i];
            con.close();
            return listeNonPrepare;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static List<DetailsCommande> commandeEnAttente() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            DetailsCommande d = new DetailsCommande();
            d.setEtape(0);
            Object[] result = d.getFromView(con, "detailsCommandeNonLivre", "");
            List<DetailsCommande> listeNonPrepare = new ArrayList();
            for(Object elt: result) listeNonPrepare.add((DetailsCommande) elt);
            con.close();
            return listeNonPrepare;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static List<DetailsCommande> commandeEnCours() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            DetailsCommande d = new DetailsCommande();
            d.setEtape(1);
            Object[] result = d.getFromView(con, "detailsCommandeNonLivre", "");
            List<DetailsCommande> listeNonPrepare = new ArrayList();
            for(Object elt: result) listeNonPrepare.add((DetailsCommande) elt);
            con.close();
            return listeNonPrepare;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Vector<Tables> getTables() {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Tables model = new Tables();
            Object[] result = model.findAll(con, "");
            Vector<Tables> listeDetailsCommande = new Vector();
            for(Object  elt: result) {
                listeDetailsCommande.add((Tables) elt);
            }
            con.close();
            return listeDetailsCommande;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static String nouvelleCommande(String numTable) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Statement stmt = con.createStatement();
            String req = "INSERT INTO commande(id, numTable, dateCommande) VALUES (CONCAT('CMD', NEXTVAL('commandeSeq')), '"+numTable+"', (SELECT CURRENT_DATE)) RETURNING id";
            System.out.println("=====================================");
            System.out.println(req);
            ResultSet res = stmt.executeQuery(req);
            String retour = null;
            while(res.next())
                retour = res.getString("id");
            stmt.close();
            con.close();
            return retour;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static void insertCommande(Vector<DetailsCommande> listeDetailsCommande) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            for(DetailsCommande d: listeDetailsCommande) {
                /*Statement stmt = con.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
                stmt.executeQuery(user);
                stmt.close();*/
                d.insert(con);
            }
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void supprimerDetailsCommande(Vector<DetailsCommande> listeDetailsCommande, DetailsCommande d) {
        for(DetailsCommande temp: listeDetailsCommande) {
            if(temp.getId() == d.getId()) listeDetailsCommande.remove(temp);
        }
    }
    
    public static void ajouterDetailsCommande(Vector<DetailsCommande> listeDetailsCommande, DetailsCommande d) {
        listeDetailsCommande.add(d);
    }
    
    public static Vector<AdditionParTable> getAddition(String numTable) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            AdditionParTable model = new AdditionParTable();
            if(!numTable.equals("all")) model.setNumTable(numTable);
            Object[] result = model.findAll(con, "");
            Vector<AdditionParTable> listeDetailsCommande = new Vector();
            for(Object  elt: result) {
                listeDetailsCommande.add((AdditionParTable) elt);
            }
            con.close();
            return listeDetailsCommande;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public static Vector<Commande> getCommande(String numTable) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Commande model = new Commande();
            if(!numTable.equals("")) model.setNumTable(numTable);
            Object[] result = model.findAll(con, "");
            Vector<Commande> listeDetailsCommande = new Vector();
            for(Object  elt: result) {
                listeDetailsCommande.add((Commande) elt);
            }
            con.close();
            return listeDetailsCommande;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public static DetailsCommande findDetailsCommande(String id) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            DetailsCommande model = new DetailsCommande();
            model.setId(id);
            Object[] result = model.findAll(con, "");
            Vector<DetailsCommande> listeDetailsCommande = new Vector();
            for(Object  elt: result) {
                listeDetailsCommande.add((DetailsCommande) elt);
            }
            con.close();
            return listeDetailsCommande.get(0);
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public static Vector<DetailsCommande> getDetailsCommande(String idCommande) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            DetailsCommande model = new DetailsCommande();
            model.setIdCommande(idCommande);
            Object[] result = model.findAll(con, "");
            Vector<DetailsCommande> listeDetailsCommande = new Vector();
            for(Object  elt: result) {
                listeDetailsCommande.add((DetailsCommande) elt);
            }
            con.close();
            return listeDetailsCommande;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public static Vector<Pourboire> getPourboire(String idServeur, String dateDebut, String dateFin) {
        try {
            Connection con = ManipDb.pgConnect(user, database, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String req = "SELECT idServeur, nom, SUM(prix)*0.02 as totalPourboire FROM additionDetails ";
            if((dateFin!= null) && (dateDebut!= null)) req += " WHERE dateCommande BETWEEN '"+dateDebut+"' AND '"+dateFin+"'";
            if(!idServeur.equals("all")) {
                if((dateFin!= null) && (dateDebut!= null)) req += " AND idServeur = '"+idServeur+"'";
                else req += " WHERE idServeur = '"+idServeur+"'";
            }
            req += " GROUP BY idServeur, nom ";
            System.out.println(req);
            ResultSet res = stmt.executeQuery(req);
            Vector<Pourboire> listePourboire = new Vector();
            while(res.next()) {
                Pourboire temp = new Pourboire();
                temp.setIdServeur(res.getString("idServeur"));
                temp.setNom(res.getString("nom"));
                temp.setTotalPourboire(res.getDouble("totalPourboire"));
                listePourboire.add(temp);
            }
            stmt.close();
            con.close();
            return listePourboire;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
