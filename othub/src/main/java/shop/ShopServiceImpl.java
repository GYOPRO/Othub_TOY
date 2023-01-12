package shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("shopservice")
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopDAO dao;
	
	public List<ShopDTO> getProduct(){
		return dao.getProduct();
	}
	
}
