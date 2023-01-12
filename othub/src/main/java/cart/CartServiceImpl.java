package cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cartservice")
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO dao;
	
	//cart에 추가
	@Override
	public void insertCart(CartDTO dto) {
		dao.insertCart(dto);
	}
	
	//cart 조회
	@Override
	public List<CartDTO> getCart(String m_id) {
		return dao.getCart(m_id);
	}
	
	//product id 조회
	@Override
	public int getProductid(int cart_id) {
		return dao.getProductid(cart_id);
	}
	
	//product 정보 조회
	@Override
	public CartDTO getProductdetail(int p_id){
		return dao.getProductdetail(p_id);
	}
	
	//중복체크용 cart조회
	@Override
	public List<CartDTO> getCart2(String m_id) {
		return dao.getCart2(m_id);
	}

	//중복시 cart update
	@Override
	public void updateCart(int p_id, int sum) {
		dao.updateCart(p_id, sum);
	}
	
	//cart 수량 수정
	@Override
	public void updateCartAmount(int cart_id, int amount) {
		dao.updateCartAmount(cart_id, amount);
	}
	
	//cart 품목 삭제
	@Override
	public void deleteOne(int cart_id) {
		dao.deleteOne(cart_id);
	}
}
