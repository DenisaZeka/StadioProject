package com.project.bean;

public class Categorie_eventi {
private int id_categoria_evento;
private String nome_categoria;

public int getId_categoria_evento() {
	return id_categoria_evento;
}
public void setId_categoria_evento(int id_categoria_evento) {
	this.id_categoria_evento = id_categoria_evento;
}
public String getNome_categoria() {
	return nome_categoria;
}
public void setNome_categoria(String nome_categoria) {
	this.nome_categoria = nome_categoria;
}
public Categorie_eventi(int id_categoria_evento, String nome_categoria) {
	super();
	this.id_categoria_evento = id_categoria_evento;
	this.nome_categoria = nome_categoria;
}
public Categorie_eventi() {
	super();
}
@Override
public String toString() {
	return "{id_categoria_evento:" + id_categoria_evento + ", nome_categoria:'" + nome_categoria + "'}";
}

}
