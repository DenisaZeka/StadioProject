package com.project.bean;

public class Settori_e_sottosettori {
private int id_settore_e_sottosettore;
public int FK_id_settore;
public int FK_id_sottosettore;
public String numero_posti_massimo;

private Settore settore ;
private Sottosettori sottosettore ;


public Sottosettori getSottosettore() {
	return sottosettore;
}
public void setSottosettore(Sottosettori sottosettore) {
	this.sottosettore = sottosettore;
}
public Settore getSettore() {
	return settore;
}
public void setSettore(Settore settore) {
	this.settore = settore;
}
public Sottosettori getSottosettori() {
	return sottosettore;
}
public void setSottosettori(Sottosettori sottosettore) {
	this.sottosettore = sottosettore;
}
public int getId_settore_e_sottosettore() {
	return id_settore_e_sottosettore;
}
public void setId_settore_e_sottosettore(int id_settore_e_sottosettore) {
	this.id_settore_e_sottosettore = id_settore_e_sottosettore;
}
public int getFK_id_settore() {
	return FK_id_settore;
}
public void setFK_id_settore(int fK_id_settore) {
	FK_id_settore = fK_id_settore;
}
public int getFK_id_sottosettore() {
	return FK_id_sottosettore;
}
public void setFK_id_sottosettore(int fK_id_sottosettore) {
	FK_id_sottosettore = fK_id_sottosettore;
}
public String getNumero_posti_massimo() {
	return numero_posti_massimo;
}
public void setNumero_posti_massimo(String numero_posti_massimo) {
	this.numero_posti_massimo = numero_posti_massimo;
}
public Settori_e_sottosettori(int id_settore_e_sottosettore, int fK_id_settore, int fK_id_sottosettore,
		String numero_posti_massimo) {
	super();
	this.id_settore_e_sottosettore = id_settore_e_sottosettore;
	FK_id_settore = fK_id_settore;
	FK_id_sottosettore = fK_id_sottosettore;
	this.numero_posti_massimo = numero_posti_massimo;
}


public Settori_e_sottosettori() {
	super();
	
}
@Override
public String toString() {
	return "{id_settore_e_sottosettore:" + id_settore_e_sottosettore + ", FK_id_settore:"
			+ FK_id_settore + ", FK_id_sottosettore:" + FK_id_sottosettore + ", numero_posti_massimo:"
			+ numero_posti_massimo + ", settore:" + settore + ", sottosettori:" + sottosettore + "}";
}

}
