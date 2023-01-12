package cart;

import java.util.List;


public interface CartDAO {

	//cart에 추가
	public void insertCart(CartDTO dto);
	
	//cart 조회
	public List<CartDTO> getCart(String m_id);
	
	//product id조회
	public int getProductid(int cart_id);
	
	public CartDTO getProductdetail(int p_id);
	
	public List<CartDTO> getCart2(String m_id);
	
	//중복시 cart update
	public void updateCart(int p_id, int sum);
	
	//cart 수량 수정
	public void updateCartAmount(int cart_id, int amount);
	
	//cart 품목 삭제
	public void deleteOne(int cart_id);
}
