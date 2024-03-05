package com.project.service;
import java.util.List;

import com.project.bean.Amministratori;
import com.project.bean.Biglietti;
import com.project.bean.Posti_evento;
import com.project.bean.Settori_e_sottosettori;
import com.project.bean.Utente;
import com.project.dao.EventiDao;
import com.project.dao.utentiDao;

public class utentiService {
    utentiDao dao = new utentiDao();

    public Integer create(Utente utente) {
       return dao.create(utente);
    }
    
    public Utente checkLogin(String email,String pasword) {
		 Utente utente = dao.findByEmailAndPassword(email, pasword);
		 return utente; 
    }
    public Amministratori checkAdmin(String admin_name,String admin_pasword) {
		 Amministratori amministratore = dao.checkAdmin(admin_name,admin_pasword);
		 return amministratore; 
		
   }
  
}