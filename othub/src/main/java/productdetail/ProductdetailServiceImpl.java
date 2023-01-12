package productdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productdetailservice")
public class ProductdetailServiceImpl implements ProductdetailService {
	@Autowired
	ProductdetailDAO dao;
	
	public ProductdetailDTO getProductdetail(int p_id){
		return dao.getProductdetail(p_id);
	}
	
	public void viewcountIncrement(int p_id) {
		dao.viewcountIncrement(p_id);
	}
}
