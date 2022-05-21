/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package springhibernate;

import config.SpringConfig;
import dao.HibernateDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employe;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import service.DeptService;

/**
 *
 * @author amboa
 */
public class SpringHibernate {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            ApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
            DeptService service = context.getBean(DeptService.class);
            Employe e = new Employe();
            List<Employe> liste = service.listeEmploye(e);
            for(Employe emp: liste) {
                System.out.println(emp.getId()+" "+emp.getNom());
            }
        } catch (Exception ex) {
            Logger.getLogger(SpringHibernate.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
