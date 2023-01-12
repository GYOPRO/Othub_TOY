package order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.convert.DtoInstantiatingConverter;
import org.springframework.stereotype.Service;

@Service("orderservice")
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;
	
	@Override
	public void insertOrder(OrderDTO dto) {
		dao.insertOrder(dto);
		//return dao.주소조회메소드();
	}
	
	@Override
	public OrderDTO getProductdetail(int p_id) {
		return dao.getProductdetail(p_id);
	}
	
	@Override
	public int getOrderid() {
		return dao.getOrderid();
	}
	
	@Override
	public int getProductid(int o_id) {
		return dao.getProductid(o_id);
	}
	
	@Override
	public List<OrderDTO> getOrders(int o_id) {
		return dao.getOrders(o_id);
	}
	
	@Override
	public OrderDTO getMember(String m_id) {
		return dao.getMember(m_id);
	}
	
	@Override
	public void doOrder(int order_id) {
		dao.doOrder(order_id);
	}
	
	@Override
	public void cancleOrder(int order_id) {
		dao.cancleOrder(order_id);
	}
	
	@Override
	public List<OrderDTO> getOrdered(String m_id) {
		return dao.getOrdered(m_id);
	}
	
	@Override
	public OrderDTO cartToOrder(int cart_id){
		return dao.cartToOrder(cart_id);
	}
	
	@Override
	public void doOrderC(String m_id) {
		dao.doOrderC(m_id);
	}
	
	@Override
	public List<OrderDTO> getOrderid2(String m_id) {
		return dao.getOrderid2(m_id);
	}
	
	@Override
	public void orderComplete(int p_id) {
		dao.orderComplete(p_id);
	}
	
	@Override
	public void orderStock(int p_id, int p_stock) {
		dao.orderStock(p_id, p_stock);
	}

	// 선교 수정
	@Override
	public void updateRoleGold(String m_id) {
		dao.updateRoleGold(m_id);
	}
	
	@Override
	public void updateRoleVip(String m_id) {
		dao.updateRoleVip(m_id);
	}
	
	//지호
	@Override
	public int getOrderid3(int order_id) {
		return dao.getOrderid3(order_id);
	}
	
	//지호
	@Override
	public void reviewcheck(OrderDTO dto){
		dao.reviewcheck(dto);
		
	}
	
}
