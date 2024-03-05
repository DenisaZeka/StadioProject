package com.project.bean;

public class Amministratori {
private int id_amministratore;
private String admin_name;
private String admin_password;


public Amministratori() {
	super();
	
}
public int getId_amministratore() {
	return id_amministratore;
}
public void setId_amministratore(int id_amministratore) {
	this.id_amministratore = id_amministratore;
}
public String getAdmin_name() {
	return admin_name;
}
public void setAdmin_name(String admin_name) {
	this.admin_name = admin_name;
}
public String getAdmin_password() {
	return admin_password;
}
public void setAdmin_password(String admin_password) {
	this.admin_password = admin_password;
}
public Amministratori(int id_amministratore, String admin_name, String admin_password) {
	super();
	this.id_amministratore = id_amministratore;
	this.admin_name = admin_name;
	this.admin_password = admin_password;
}


@Override
public String toString() {
	return "Amministratore [id_amministratore=" + id_amministratore + ", admin_name=" + admin_name
			+ ", admin_password=" + admin_password + "]";
}

}
