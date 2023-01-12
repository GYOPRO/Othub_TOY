package productdetail;

import java.util.List;

import shop.ShopDTO;

public interface ProductdetailService {

	public ProductdetailDTO getProductdetail(int p_id);
	
	//조회수 증가
	public void viewcountIncrement(int p_id);
}
