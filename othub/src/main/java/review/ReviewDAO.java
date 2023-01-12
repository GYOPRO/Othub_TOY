package review;

import java.util.List;

import cs.CSDTO;
import order.OrderDTO;
import productdetail.ProductdetailDTO;

public interface ReviewDAO {
	
	//review list
	public List<ReviewDTO> reviewlist() throws Exception; 
	
	// review 작성
	public void reviewwrite(ReviewDTO dto) throws Exception;
		
	// review 조회
	public ReviewDTO reviewview(int review_seq) throws Exception;
		
	// review 수정
	public void reviewmodify(ReviewDTO dto) throws Exception;
		
	// review 삭제
	public void reviewdelete(int review_seq) throws Exception;
		
	// review 총 갯수
	public int reviewcount() throws Exception;
	
	// my review 총 갯수
	public int myreviewcount(String m_id) throws Exception;
	
	// p_id 체크
	public ProductdetailDTO pcheck(int p_id) throws Exception;
	
	//주문 조회
	public List<OrderDTO> getOrderlist(int p_id);
	
	//주문
	public ReviewDTO getOrder(int order_id) throws Exception;
	
	// p_name 조회
	public String getname(int p_id);
		
	// 게시물 목록 + 페이징
	public List<ReviewDTO> reviewlistPage(int displayPost, int postNum) throws Exception;
	
	// 지호 포인트  확인
	public void pointcheck(ReviewDTO dto);


}
