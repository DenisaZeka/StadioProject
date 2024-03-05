package com.project.dao;

import com.project.bean.Biglietti;
import com.project.bean.Categorie_tariffa;
import com.project.bean.Eventi;
import com.project.bean.Posti_evento;
import com.project.bean.Settori_e_sottosettori;
import com.project.bean.Utente;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class EventiDao {
    
    private static SessionFactory factory;

    static {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
	
    public List<Eventi> getAllEvent() {
        Session session = factory.openSession();
        Transaction tx = null;
        List<Eventi> events = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("FROM Eventi");
            events = query.list(); 
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return events;
    }
        
    
 
    
    public List<Posti_evento> getAllSettori() {
        Session session = factory.openSession();
        Transaction tx = null;
        List<Posti_evento> settori = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("FROM Posti_evento");
            
            settori = query.list(); 
            
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return settori;
    }
    
    public List<Categorie_tariffa> getAllCategorieTariffa() {
        Session session = factory.openSession();
        Transaction tx = null;
        List<Categorie_tariffa> categorie_tariffa = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("FROM Categorie_tariffa");
            
            categorie_tariffa = query.list(); 
            
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return categorie_tariffa;
    }
   

    public boolean isUserLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null;
    }

    
    
   // Method to create new ticket
  	public Biglietti CreateNewTickets(int FK_id_utente, int FK_id_posto_evento, int FK_id_categoria_tariffa,String data_di_aquisto, Float prezzo_finale, String quanita_posti ) {
  		return null;
  	}
    // Method to create new ticket
    public Integer create(Biglietti biglietti) {
        Session session = factory.openSession();
        Transaction tx = null;
        Integer bigliettoID = null;

        try {
            tx = session.beginTransaction();
            bigliettoID = (Integer) session.save(biglietti);
         
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return bigliettoID;
    }
}
