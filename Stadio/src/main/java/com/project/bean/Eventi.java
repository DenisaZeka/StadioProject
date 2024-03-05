package com.project.bean;

public class Eventi {
private int id_evento;
private String nome_evento;
private String data_ora_evento;
private String prezzo_base_evento;
private int FK_id_categoria_evento;
private String immagine_evento;

public Categorie_eventi getCategoria() {
	return categoria;
}
public void setCategoria(Categorie_eventi categoria) {
	this.categoria = categoria;
}
private Categorie_eventi categoria; 


public int getId_evento() {
	return id_evento;
}
public void setId_evento(int id_evento) {
	this.id_evento = id_evento;
}
public String getNome_evento() {
	return nome_evento;
}
public void setNome_evento(String nome_evento) {
	this.nome_evento = nome_evento;
}
public String getData_ora_evento() {
	return data_ora_evento;
}
public void setData_ora_evento(String data_ora_evento) {
	this.data_ora_evento = data_ora_evento;
}
public String getPrezzo_base_evento() {
	return prezzo_base_evento;
}
public void setPrezzo_base_evento(String prezzo_base_evento) {
	this.prezzo_base_evento = prezzo_base_evento;
}
public int getFK_id_categoria_evento() {
	return FK_id_categoria_evento;
}
public void setFK_id_categoria_evento(int fK_id_categoria_evento) {
	FK_id_categoria_evento = fK_id_categoria_evento;
}
public String getImmagine_evento() {
	return immagine_evento;
}
public void setImmagine_evento(String immagine_evento) {
	this.immagine_evento = immagine_evento;
}
public Eventi(int id_evento, String nome_evento, String data_ora_evento, String prezzo_base_evento,
		int fK_id_categoria_evento, String immagine_evento) {
	super();
	this.id_evento = id_evento;
	this.nome_evento = nome_evento;
	this.data_ora_evento = data_ora_evento;
	this.prezzo_base_evento = prezzo_base_evento;
	FK_id_categoria_evento = fK_id_categoria_evento;
	this.immagine_evento = immagine_evento;
}

public Eventi() {
	super();

}
@Override
public String toString() {
	return "{id_evento:" + id_evento + ", nome_evento:'" + nome_evento + "', data_ora_evento:'" + data_ora_evento
			+ "', prezzo_base_evento:" + prezzo_base_evento + ", FK_id_categoria_evento:" + FK_id_categoria_evento
			+ ", immagine_evento:'" + immagine_evento + "', categoria:" + categoria + "}";
}


}
