package com.project.bean;

public class Categorie_tariffa {
private int id_categoria_tariffa;
private String categoria_tariffa;
private String moltiplicatore_tariffa;

public int getId_categoria_tariffa() {
	return id_categoria_tariffa;
}

public void setId_categoria_tariffa(int id_categoria_tariffa) {
	this.id_categoria_tariffa = id_categoria_tariffa;
}


public String getCategoria_tariffa() {
	return categoria_tariffa;
}
public void setCategoria_tariffa(String categoria_tariffa) {
	this.categoria_tariffa = categoria_tariffa;
}



public String getMoltiplicatore_tariffa() {
	return moltiplicatore_tariffa;
}
public void setMoltiplicatore_tariffa(String moltiplicatore_tariffa) {
	this.moltiplicatore_tariffa = moltiplicatore_tariffa;
}



public Categorie_tariffa(int id_categoria_tariffa, String categoria_tariffa, String moltiplicatore_tariffa) {
	super();
	this.id_categoria_tariffa = id_categoria_tariffa;
	this.categoria_tariffa = categoria_tariffa;
	this.moltiplicatore_tariffa = moltiplicatore_tariffa;
}

public Categorie_tariffa() {
	super();
	
}
@Override
public String toString() {
	return "{id_categoria_tariffa:" + id_categoria_tariffa + ", categoria_tariffa:'" + categoria_tariffa + "', moltiplicatore_tariffa:" + moltiplicatore_tariffa + "}";
}

}
