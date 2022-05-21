/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.util.List;
import static javafx.scene.input.KeyCode.T;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author amboa
 */
@Component
public class HibernateDAO {
    @Autowired
    SessionFactory sessionFactory;

    public HibernateDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public void save(Object elt) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        try {
            Transaction transact = session.beginTransaction();
            session.save(elt);
            transact.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public List<Object> findByExample(Object elt) throws Exception {
        List<Object> list = null;
        Session session = sessionFactory.getCurrentSession();
        try {
            Transaction transact = session.beginTransaction();
            Example eltExample = Example.create(elt);
            Criteria criteria = session.createCriteria(elt.getClass()).add(eltExample);
            list = criteria.list();
            transact.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
            return list;
        }
    }
    
    public <T extends BaseModel> List<T> find(Object elt) throws Exception {
        List<T> list = null;
        Session session = sessionFactory.getCurrentSession();
        try {
            Transaction transact = session.beginTransaction();
            Example eltExample = Example.create(elt);
            Criteria criteria = session.createCriteria(elt.getClass()).add(eltExample);
            list = criteria.list();
            transact.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
            return list;
        }
    }
}
