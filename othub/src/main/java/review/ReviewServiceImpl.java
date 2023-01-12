package review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cs.CSDTO;
import order.OrderDTO;
import productdetail.ProductdetailDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDAO dao;

	@Override
	public List<ReviewDTO> reviewlist() throws Exception {
		return dao.reviewlist();
	}

	@Override
	public void reviewwrite(ReviewDTO dto) throws Exception {
		dao.reviewwrite(dto);
		
	}

	@Override
	public ReviewDTO reviewview(int review_seq) throws Exception {
		return dao.reviewview(review_seq);
	}

	@Override
	public void reviewmodify(ReviewDTO dto) throws Exception {
		dao.reviewmodify(dto);
		
	}

	@Override
	public void reviewdelete(int review_seq) throws Exception {
		dao.reviewdelete(review_seq);
		
	}

	@Override
	public int reviewcount() throws Exception {
		return dao.reviewcount();
	}
	
	@Override
	public int myreviewcount(String m_id) throws Exception {
		return dao.myreviewcount(m_id);
	}

	@Override
	public ProductdetailDTO pcheck(int p_id) throws Exception {
		return dao.pcheck(p_id);
	}

	@Override
	public List<OrderDTO> getOrderlist(int p_id) {
		return dao.getOrderlist(p_id);
	}

	@Override
	public ReviewDTO getOrder(int order_id) throws Exception {
		return dao.getOrder(order_id);
	}

	@Override
	public String getname(int p_id) {
		return dao.getname(p_id);
	}
	
	@Override
	public List<ReviewDTO> reviewlistPage(int displayPost, int postNum) throws Exception {
		return dao.reviewlistPage(displayPost, postNum);
	}

	@Override
	public void pointcheck(ReviewDTO dto) {
		dao.pointcheck(dto);
		
	}


}
