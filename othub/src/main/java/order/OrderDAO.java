package order;

import java.util.List;

import productdetail.ProductdetailDTO;

public interface OrderDAO {

	//order table에 입력
	public void insertOrder(OrderDTO dto);
	
	//product 조회
	public OrderDTO getProductdetail(int p_id);
	
	//orderid 조회2
	public int getOrderid();
	
	//orderid 조회2
	public List<OrderDTO> getOrderid2(String m_id);
	
	//produdct id 조회
	public int getProductid(int o_id);
	
	//orders table 조회
	public List<OrderDTO> getOrders(int o_id);
	
	//member tabel 조회
	public OrderDTO getMember(String m_id);
	
	//주문 등록
	public void doOrder(int order_id); 
	
	//주문 등록 카트
	public void doOrderC(String m_id);
	
	//주문 삭제
	public void cancleOrder(int order_id);
	
	//주문 조회
	public List<OrderDTO> getOrdered(String m_id);
	
	//장바구니에서 주문
	public OrderDTO cartToOrder(int cart_id);
	
	//주문완료시 장바구니 삭제
	public void orderComplete(int p_id);
	
	//주문완료시 재고 변경
	public void orderStock(int p_id, int p_stock);
	
	//선교 수정 회원 등급 변경(골드)
	public void updateRoleGold(String m_id);
	
	//선교 수정 회원 등급 변경(골드)
		public void updateRoleVip(String m_id);
		
	// 지호 order id 조회
	public int getOrderid3(int order_id);
			
	// 지호 리뷰  확인
	public void reviewcheck(OrderDTO dto);
}
