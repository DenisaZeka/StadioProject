package com.project.bean;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
public class Utente {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_utente;  
	private String nome;
	private String cognome;  
	private String codice_fiscale;
	private String email; 
	private String password;
	
	
	public int getId_utente() {
		return id_utente;
	}
	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getCodice_fiscale() {
		return codice_fiscale;
	}
	public void setCodice_fiscale(String codice_fiscale) {
		this.codice_fiscale = codice_fiscale;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	} 
	public Utente(int id_utente, String nome, String cognome ,String codice_fiscale ,String email,String password) {
		super();
		this.id_utente = id_utente;
		this.nome = nome;
		this.cognome = cognome;
		this.codice_fiscale = codice_fiscale;
		this.email = email;
		this.password=password;
	}
	public Utente() {
		super();
	
	}
	@Override
	public String toString() {
		return "[id_utente=" + id_utente + ", nome='" + nome + "', cognome='" + cognome + "', codice_fiscale='"
				+ codice_fiscale + "', email='" + email + "', password='" + password + "']";
	}
	
}
