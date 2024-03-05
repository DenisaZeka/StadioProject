package com.project.service;

import java.util.List;

import com.project.bean.*;

import com.project.dao.EventiDao;
import com.project.dao.utentiDao;

public class SettoriService {
	EventiDao dao = new EventiDao();

	  public List<Posti_evento> getAllSettori() {
	    	return dao.getAllSettori();
	    }
}
