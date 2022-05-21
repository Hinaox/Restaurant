/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author amboa
 */
@Service
public class DeptService {
    @Autowired
    HibernateDAO hibernateDAO;
    
    public List<Employe> listeEmploye(Employe e) throws Exception {
        try {
            return hibernateDAO.find(e);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        }
    }
}
