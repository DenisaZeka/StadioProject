package com.project.bean;

public class Biglietti {
private int id_biglietto;
private int FK_id_utente;
private int FK_id_posto_evento;
private int FK_id_categoria_tariffa;
private String data_di_acquisto;
private Float prezzo_finale;
private int quantita_posti;



public int getQuantita_posti() {
	return quantita_posti;
}

public void setQuantita_posti(int quantita_posti) {
	this.quantita_posti = quantita_posti;
}

private Utente utente ;
private Categorie_tariffa categoria_tariffa ;
private Posti_evento posto_evento ;
public Utente getUtente() {
	return utente;
}

public void setUtente(Utente utente) {
	this.utente = utente;
}

public int getId_biglietto() {
	return id_biglietto;
}
public void setId_biglietto(int id_biglietto) {
	this.id_biglietto = id_biglietto;
}
public int getFK_id_utente() {
	return FK_id_utente;
}
public void setFK_id_utente(int fK_id_utente) {
	FK_id_utente = fK_id_utente;
}
public int getFK_id_posto_evento() {
	return FK_id_posto_evento;
}
public void setFK_id_posto_evento(int fK_id_posto_evento) {
	FK_id_posto_evento = fK_id_posto_evento;
}
public int getFK_id_categoria_tariffa() {
	return FK_id_categoria_tariffa;
}
public void setFK_id_categoria_tariffa(int fK_id_categoria_tariffa) {
	FK_id_categoria_tariffa = fK_id_categoria_tariffa;
}
public String getData_di_acquisto() {
	return data_di_acquisto;
}
public void setData_di_acquisto(String data_di_acquisto) {
	this.data_di_acquisto = data_di_acquisto;
}
public Float getPrezzo_finale() {
	return prezzo_finale;
}
public void setPrezzo_finale(Float prezzo_finale) {
	this.prezzo_finale = prezzo_finale;
}
public Biglietti(int id_bilgietto, int fK_id_utente, int fK_id_posto_evento, int fK_id_categoria_tariffa,
		String data_di_acquisto, Float prezzo_finale) {
	super();
	this.id_biglietto = id_biglietto;
	FK_id_utente = fK_id_utente;
	FK_id_posto_evento = fK_id_posto_evento;
	this.FK_id_categoria_tariffa = fK_id_categoria_tariffa;
	this.data_di_acquisto = data_di_acquisto;
	this.prezzo_finale = prezzo_finale;
}



public Biglietti() {
	super();
}
@Override
public String toString() {
	return "{id_biglietto:" + id_biglietto + ", FK_id_utente:" + FK_id_utente + ", FK_id_posto_evento:"
			+ FK_id_posto_evento + ", FK_id_categoria_tariffa:" + FK_id_categoria_tariffa + ", data_di_acquisto:'"
			+ data_di_acquisto + "', prezzo_finale:" + prezzo_finale + ",quantita_posti :"+ quantita_posti+ ", utente:" + utente + ", categoria_tariffa:"
			+ categoria_tariffa + ", posto_evento:" + posto_evento + "}";
}
public Categorie_tariffa getCategoria_tariffa() {
	return categoria_tariffa;
}
public void setCategoria_tariffa(Categorie_tariffa categoria_tariffa) {
	this.categoria_tariffa = categoria_tariffa;
}

public Posti_evento getPosto_evento() {
	return posto_evento;
}

public void setPosto_evento(Posti_evento posto_evento) {
	this.posto_evento = posto_evento;
}

}
