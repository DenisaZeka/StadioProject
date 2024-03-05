package com.project.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.logicalcobwebs.proxool.admin.Admin;
import com.project.bean.Utente;
import com.project.bean.Amministratori;
import com.project.bean.Biglietti;


public class utentiDao {
    private static SessionFactory factory;

    static {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
// Method to add a user in database 
    public Integer create(Utente utenti) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer utentiID = null;

        try {
            tx = session.beginTransaction();
            utentiID = (Integer) session.save(utenti);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return utentiID;
    }

    
    //Method to check user when it does the login
    public Utente findByEmailAndPassword(String email, String password) {
        Session session = factory.openSession();
        Transaction tx = null;
        Utente utente = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            utente = (Utente) session.createQuery("FROM Utente WHERE email = :email AND password = :password")
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return utente;
    }
    
    
  //Method to register an user
  	public Utente registrationUtente(String nome, String cognome, String codice_fiscale, String email, String pasword) {
  		return null;
  	}
  	
    
    
    //Method to login an admin
    public Amministratori checkAdmin(String admin_name, String admin_password) {
        Session session = factory.openSession();
        Transaction tx = null;
       
        Amministratori amministratori = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            amministratori = (Amministratori) session.createQuery("FROM Amministratori WHERE admin_name = :admin_name AND admin_password = :admin_password")
                    .setParameter("admin_name", admin_name)
                    .setParameter("admin_password", admin_password)
                    .uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return amministratori;
    }

	
	
	
}
