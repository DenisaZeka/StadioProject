package com.project.bean;

public class Posti_evento {
  
  
  private int id_posto_evento;
  private int FK_id_settore_e_sottosettore;
  private int FK_id_evento;
  private int numero_posti_disponibili_per_sottosettore;
  
  private Eventi evento; 
  private Settori_e_sottosettori settore_e_sottosettore ;
  public Settori_e_sottosettori getSettore_e_sottosettore() {
	return settore_e_sottosettore;
}
public void setSettore_e_sottosettore(Settori_e_sottosettori settore_e_sottosettore) {
	this.settore_e_sottosettore = settore_e_sottosettore;
}
public int getId_posto_evento() {
    return id_posto_evento;
  }
  public void setId_posto_evento(int id_posto_evento) {
    this.id_posto_evento = id_posto_evento;
  }
  public int getFK_id_settore_e_sottosettore() {
    return FK_id_settore_e_sottosettore;
  }
  public void setFK_id_settore_e_sottosettore(int fK_id_settore_e_sottosettore) {
    FK_id_settore_e_sottosettore = fK_id_settore_e_sottosettore;
  }
  public int getFK_id_evento() {
    return FK_id_evento;
  }
  public void setFK_id_evento(int fK_id_evento) {
    FK_id_evento = fK_id_evento;
  }
  public int getNumero_posti_disponibili_per_sottosettore() {
    return numero_posti_disponibili_per_sottosettore;
  }
  public void setNumero_posti_disponibili_per_sottosettore(int numero_posti_disponibili_per_sottosettore) {
    this.numero_posti_disponibili_per_sottosettore = numero_posti_disponibili_per_sottosettore;
  }
  public Posti_evento(int id_posto_evento, int fK_id_settore_e_sottosettore, int fK_id_evento,int numero_posti_disponibili_per_sottosettore) {
    super();
    this.id_posto_evento = id_posto_evento;
    FK_id_settore_e_sottosettore = fK_id_settore_e_sottosettore;
    FK_id_evento = fK_id_evento;
    this.numero_posti_disponibili_per_sottosettore = numero_posti_disponibili_per_sottosettore;
  }
  public Posti_evento() {
    super();
  }
  

  @Override
public String toString() {
	return "{id_posto_evento:" + id_posto_evento + ", FK_id_settore_e_sottosettore:"
			+ FK_id_settore_e_sottosettore + ", FK_id_evento:" + FK_id_evento
			+ ", numero_posti_disponibili_per_sottosettore:" + numero_posti_disponibili_per_sottosettore + ", evento:"
			+ evento + ", settore_e_sottosettore:" + settore_e_sottosettore + "}";
}
public Eventi getEvento() {
    return evento;
  }
  public void setEvento(Eventi evento) {
    this.evento = evento;
  }  
  
  
  

}