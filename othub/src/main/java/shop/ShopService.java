package shop;

import java.util.List;

import org.springframework.stereotype.Service;



public interface ShopService {
	
	public List<ShopDTO> getProduct();
}
