package com.project.prova;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.project.bean.Utente;
import com.project.service.utentiService;

public class utentiTest {
    private static SessionFactory factory;

    public static void main(String[] args) {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }

        utentiService service = new utentiService();

       // Utente denisa = new Utente(20, "Denisa", "zeka", "deudgu93881039", "d@gmail.com", "d34");
        //Utente albi = new Utente(21, "albi", "luis", "jsqjn", "sjnqsin@gmail.com", "775");
        //Utente a = new Utente(22, "denisa", "lus", "jsj938ur93ur", "jnqsi@gmail.com", "95");
        Utente b = new Utente(23, "deni", "z", "den", "den@gmail.com", "1024");
        
       
      // service.create(denisa);
      // service.create(albi);
       service.create(b);
        
             
       //Utente utente = service.checkLogin("jnqsi@gmail.com", "95");
      // System.out.println("utente trovato" + utente);

    }
}
