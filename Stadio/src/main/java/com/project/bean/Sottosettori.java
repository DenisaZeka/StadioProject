package com.project.bean;

public class Sottosettori {
private int id_sottosettore;
private String sottosettore;
public int getId_sottosettore() {
	return id_sottosettore;
}
public void setId_sottosettore(int id_sottosettore) {
	this.id_sottosettore = id_sottosettore;
}
public String getSottosettore() {
	return sottosettore;
}
public void setSottosettore(String sottosettore) {
	this.sottosettore = sottosettore;
}
public Sottosettori(int id_sottosettore, String sottosettore) {
	super();
	this.id_sottosettore = id_sottosettore;
	this.sottosettore = sottosettore;
}

public Sottosettori() {
	super();

}
@Override
public String toString() {
	return "{id_sottosettore:" + id_sottosettore + ", sottosettore:'" + sottosettore + "'}";
}


}
