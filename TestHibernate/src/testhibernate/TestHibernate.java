/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testhibernate;

import dao.HibernateDAO;
import java.util.List;
import model.Employe;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author amboa
 */
public class TestHibernate {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Employe e = new Employe();
            e.setId(4);
            Configuration config = new Configuration();
            config.configure("hibernate.cfg.xml");
            SessionFactory sessionFactory = config.buildSessionFactory();
            HibernateDAO hibernateDAO = new HibernateDAO(sessionFactory);
            List<Employe> liste = hibernateDAO.find(e);
            System.out.println(liste.get(0).getNom());
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
}
