package EventiTest;

import java.util.List;

import com.project.bean.Categorie_tariffa;
import com.project.bean.Eventi;
import com.project.bean.Posti_evento;
import com.project.bean.Settori_e_sottosettori;
import com.project.dao.EventiDao;

public class EventiTest {

		public static void main (String args[]) {
			
			
			EventiDao dao = new EventiDao(); 
			/*
			List<Posti_evento> settori = dao.getAllSettori();
			//System.out.print("settori: " + settori);
			System.out.print("settori size: " + settori.size());
			System.out.print("settori i=0: " + settori.get(0).getFK_id_settore_e_sottosettore());
			*/
			//List<Eventi> eventi= dao.getAllEvent2(); 
		
			//for(int i=0; i<eventi.size();i++) {
				//System.out.println(eventi.get(i).getCategoria());
			//}
			
			//List<Posti_evento> settori= dao.getAllSettori(); 
		      
		      //for(int i=0; i<settori.size();i++) {
		      //  System.out.println(settori.get(i));
		      //}
		      
		      
		      
		      List<Categorie_tariffa> categorie_tariffa= dao.getAllCategorieTariffa(); 
		      
		      for(int i=0; i<categorie_tariffa.size();i++) {
		        System.out.println(categorie_tariffa.get(i));
		      }
			}
		
		
}
