package EventiTest;

import java.util.List;

import com.project.bean.Posti_evento;
import com.project.dao.EventiDao;

public class PostiEventoTest {

	public static void main(String[] args) {
		
		 EventiDao dao = new EventiDao(); 
			
		 List<Posti_evento> objects =  dao.getAllSettori();	
	    
	    for(int i = 0;i <objects.size();i++){
				
				Object pe = objects.get(i); 
				System.out.println(pe);
	    }
	}

}
