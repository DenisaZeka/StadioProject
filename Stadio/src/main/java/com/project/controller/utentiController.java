package com.project.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mysql.cj.callback.UsernameCallback;
import com.project.bean.Utente;
import com.project.service.utentiService;
import com.project.bean.Amministratori;

@Controller
public class utentiController {

    //Method to check user when it does the login	
    @GetMapping("/check-login")
	 public String hola (@RequestParam String email, @RequestParam String password, Model model, HttpSession session)  {   
    	
    	System.out.println( "controllo login con " + email + " " + password );
    		
		utentiService  us = new utentiService() ;	
		Utente utente = us.checkLogin( email, password );
		
		if (utente!= null ){	
		 model.addAttribute("message", "Benvenuto "+ utente.getNome());
		 session.setAttribute("loggedInUser",utente);
		 session.setAttribute("password",password);
		 System.out.println( "Login effettuato correttamente, benvenuto "+ utente.getNome());		 
		 return "home";	 
		}
		else {
			 model.addAttribute("message", "Login non effettuato, riprova!" );
			 System.out.println( "Login non effettuato, riprova!" );
			 return "login";
		}	       
    }  
    
    //Log out user method
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        // Invalidate the session
        session.invalidate();
        
        // Add a logout message to the model
        model.addAttribute("message", "You are logged out.");
        
        // Redirect to the home page
        System.out.println( "LogOut effettuato correttamente ");
        return "home";
    }
    
    
    //Method to register an user
    @PostMapping("/registration")
	 public String registration (@RequestParam String nome,@RequestParam String cognome,@RequestParam String email,@RequestParam String codice_fiscale, @RequestParam String password, Model model, HttpSession session)  {   
   	
   	System.out.println( "controllo login con " + email + " " + password + email);
   		
		utentiService  us = new utentiService() ;
		
		Utente u = new Utente();
		u.setNome(nome);
		u.setCognome(cognome);
		u.setEmail(email);
		u.setPassword(password);
		u.setCodice_fiscale(codice_fiscale);
		
		us.create(u);
		
		System.out.println(u);
		model.addAttribute("succes", "Your registration went succesfully");
		return "home";
	       
   } 
    
  //Method to check login for admin
    @GetMapping ("/loginAdmin")
    public String helloAdmin (@RequestParam String admin_name , @RequestParam String admin_password, Model model , HttpSession session) {
    	System.out.println("controllo login con " + admin_name + " " + admin_password );
    	utentiService  us = new utentiService() ;
		Amministratori admin = us.checkAdmin(admin_name, admin_password );
		
		if (admin!= null ){	
		 model.addAttribute("message", "Login effettuato correttamente, benvenuto "+ admin.getAdmin_name());
		 session.setAttribute("password",admin_password);
		 System.out.println( "Login effettuato correttamente, benvenuto "+ admin.getAdmin_name());
	 	 
		 return "LogedAdmin";
		 
		}
		else {
			 model.addAttribute("message", "Login non effettuato, riprova!" );
			 System.out.println( "Login non effettuato, riprova!" );
			 return "admin";
		}
	       
    }  

    @GetMapping("/home")
	public String display(){   
    	
    	System.out.println( "Apertura Home " );
    	return "home";
    }  
    
    @GetMapping("/ticket")
    public String ticket() {
    	System.out.println( "Apertura ticket Page " );
       return "ticket";
    }
    
    @GetMapping("/admin")
    public String admin() {
    	System.out.println( "Aperutra pagina Admin" );
        return "admin";
    }
    
 @GetMapping("/ticketDescription")
 public String ticketDescription() {
	 System.out.println( "Apertura ticket Page Description " );
	 return "ticketDescription";
 }
 
 @GetMapping("/pitch")
 public String pitch() {
	 System.out.println( "pitch" );
	 return "pitch";
 }
 @GetMapping("/login")
 public String login() {
 	System.out.println( "Aperutra pagina per inserire credenziali" );
 	
     return "login";
 }
 
 @GetMapping("/contacts")
 public String contacts() {
 	System.out.println( "Aperutra pagina di conttati" );
 	
     return "contacts";
 }
}
