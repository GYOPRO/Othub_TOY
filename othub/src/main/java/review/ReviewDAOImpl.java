package review;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cs.CSDTO;
import order.OrderDTO;
import productdetail.ProductdetailDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "review";

	@Override
	public List<ReviewDTO> reviewlist() throws Exception {
		return sql.selectList(namespace + ".reviewlist");
	}
	
	@Override
	public void reviewwrite(ReviewDTO dto) throws Exception {
		sql.insert(namespace + ".reviewwrite", dto);
		
	}

	@Override
	public ReviewDTO reviewview(int review_seq) throws Exception {
		return sql.selectOne(namespace + ".reviewview", review_seq);
	}

	@Override
	public void reviewmodify(ReviewDTO dto) throws Exception {
		sql.insert(namespace + ".reviewmodify", dto);
		
	}

	@Override
	public void reviewdelete(int review_seq) throws Exception {
		sql.delete(namespace + ".reviewdelete", review_seq);
		
	}

	@Override
	public int reviewcount() throws Exception {
		return sql.selectOne(namespace + ".reviewcount"); 
	}
	
	@Override
	public int myreviewcount(String m_id) throws Exception {
		return sql.selectOne(namespace + ".myreviewcount", m_id); 
	}

	@Override
	public ProductdetailDTO pcheck(int p_id) throws Exception {
		return sql.selectOne(namespace + ".pcheck", p_id);
	}

	@Override
	public List<OrderDTO> getOrderlist(int p_id) {
		return sql.selectList(namespace + ".getOrdered");
	}

	@Override
	public ReviewDTO getOrder(int order_id) throws Exception{
		return sql.selectOne(namespace + ".getOrder", order_id);
	}

	@Override
	public String getname(int p_id) {
		return sql.selectOne(namespace + ".getname", p_id);
	}
	
	@Override
	public List<ReviewDTO> reviewlistPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		return sql.selectList(namespace + ".reviewlistPage", data);
	}

	@Override
	public void pointcheck(ReviewDTO dto) {
		sql.update(namespace + ".pointcheck", dto);
		
	}

}
