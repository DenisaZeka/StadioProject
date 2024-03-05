package com.project.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.bean.Biglietti;
import com.project.bean.Categorie_tariffa;
import com.project.bean.Eventi;
import com.project.bean.Posti_evento;
import com.project.bean.Settori_e_sottosettori;
import com.project.bean.Utente;
import com.project.dao.EventiDao;
import com.project.service.BigliettiService;
import com.project.service.utentiService;

@Controller
public class EventiController {

	
	 EventiDao dao = new EventiDao(); 
		
	
	 @GetMapping("/events")
	 public String getEventString (Model m) {
		 
			List<Eventi> eventi= dao.getAllEvent(); 
			
			for(int i=0; i<eventi.size();i++) {
				System.out.println(eventi.get(i));
			}
			
			m.addAttribute("eventi", eventi);
			
			return "ticket"; 
	 }
	 
	 @GetMapping ("/settori")
	 public String getSettorString (Model m, HttpSession session) {
		 List<Posti_evento> settori= dao.getAllSettori(); 
	      
	      for(int i=0; i<settori.size();i++) {
	        System.out.println(settori.get(i));
	      }
	
			session.setAttribute("settori", settori);
		 m.addAttribute("settori",settori );
		 System.out.println(" settori "+ settori);
		 
		 return "ticketDescription";
		 
	 }

	 @GetMapping ("/cart")
	 public String getCategorie (Model m, HttpSession session) {
	     List<Categorie_tariffa> categorie_tariffa= dao.getAllCategorieTariffa(); 
	      
	      for(int i=0; i<categorie_tariffa.size();i++) {
	        System.out.println(categorie_tariffa.get(i));
	      }
			session.setAttribute("categorie_tariffa", categorie_tariffa);
		 m.addAttribute("categorie_tariffa",categorie_tariffa );
		 System.out.println(" categorie_tariffa "+ categorie_tariffa);
		 
		 return "cart";
		 
	 }
	 

	 
	 @GetMapping("/payment")
	 public String payNow(HttpSession session, Model model) {
	     boolean loggedIn = false; // Set this value based on the user's login status
	     // Example: Check if the user is logged in based on a session attribute
	     if (session.getAttribute("loggedInUser") != null) {
	         loggedIn = true;
	     }

	     if (loggedIn) {
	         // User is logged in, proceed with payment process
	         return "payment"; // Return the name of the payment form view
	     } else {
	         // User is not logged in, display a message and redirect to the login page
	         model.addAttribute("message", "Please log in first.");
	         return "redirect:/login"; // Replace "/login" with the actual URL of your login page
	     }
	 }
	 
	 @GetMapping("/pay")
	 public String pay(@RequestParam String tickets,HttpSession session, Model model) {
		 
		 Utente utente = (Utente) session.getAttribute("loggedInUser");
		 int utenteId= utente.getId_utente();
		 
		 
		BigliettiService  bs = new BigliettiService() ;

		 
		 	String[] parts = tickets.split(",");
	        int length = parts.length;
	        double[][] result = new double[length][];
	        
	        for (int i = 0; i < length; i++) {
	            String[] subparts = parts[i].split("-");
	            int subLength = subparts.length;
	            result[i] = new double[subLength];
	            
	            for (int j = 0; j < subLength; j++) {
	                result[i][j] = Double.parseDouble(subparts[j]);
	            }
	        }
	        for (int i = 0; i < length; i++) {
	        	int FK_id_categoria_tariffa = (int) result[i][0];
	        	int FK_id_posto_evento = (int) result[i][1];
	        	float prezzo_finale = (float) result[i][2];
	        	int quantita_posti = (int) result[i][3];
	        	LocalDateTime currentDateTime = LocalDateTime.now();
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            String formattedDateTime = currentDateTime.format(formatter);
	            System.out.println(FK_id_categoria_tariffa);
	    		Biglietti b = new Biglietti();
	    		Categorie_tariffa ct = new Categorie_tariffa();
	    		ct.setId_categoria_tariffa(FK_id_categoria_tariffa);
	    		Posti_evento pe = new Posti_evento();
	    		pe.setId_posto_evento(FK_id_posto_evento);
	    		
				b.setUtente(utente);
				b.setCategoria_tariffa(ct);
				b.setPosto_evento(pe);
				b.setPrezzo_finale(prezzo_finale);
				b.setQuantita_posti(quantita_posti);
				b.setData_di_acquisto(formattedDateTime);
				
				bs.create(b);
	        	
	            System.out.println(Arrays.toString(result[i]));
	        }		 
		 return "home";
}
	 

}
