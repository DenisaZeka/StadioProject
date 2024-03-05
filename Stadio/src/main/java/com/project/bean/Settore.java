package com.project.bean;

public class Settore {
private int id_settore;
private String nome_settore;
private String moltiplicatore_tariffa_settore;


public String getMoltiplicatore_tariffa_settore() {
	return moltiplicatore_tariffa_settore;
}
public void setMoltiplicatore_tariffa_settore(String moltiplicatore_tariffa_settore) {
	this.moltiplicatore_tariffa_settore = moltiplicatore_tariffa_settore;
}
public int getId_settore() {
	return id_settore;
}
public void setId_settore(int id_settore) {
	this.id_settore = id_settore;
}
public String getNome_settore() {
	return nome_settore;
}
public void setNome_settore(String nome_settore) {
	this.nome_settore = nome_settore;
}

public Settore(int id_settore, String nome_settore, String moltiplicatore_tariffa_settore) {
	super();
	this.id_settore = id_settore;
	this.nome_settore = nome_settore;
	this.moltiplicatore_tariffa_settore = moltiplicatore_tariffa_settore;
}


public Settore() {
	super();
}

@Override
public String toString() {
	return "{id_settore:" + id_settore + ", nome_settore:'" + nome_settore + "', moltiplicatore_tariffa_settore:"
			+ moltiplicatore_tariffa_settore + "}";
}

}
