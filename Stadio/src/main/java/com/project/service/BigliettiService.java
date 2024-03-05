package com.project.service;

import com.project.bean.Biglietti;
import com.project.dao.EventiDao;

public class BigliettiService {

	EventiDao dao = new EventiDao();
	
	
    public Integer create(Biglietti biglietti) {
        return dao.create(biglietti);
     }

}
