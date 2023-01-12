package adproduct;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ADProductDAOImpl implements ADProductDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "adproduct";

	@Override
	public void insertproduct(ADProductDTO dto) throws Exception {
		sql.insert(namespace + ".insertproduct", dto);

	}

	@Override
	public ADProductDTO getproduct(int p_id){
		return sql.selectOne(namespace + ".getproduct", p_id);
	}

	@Override
	public int adpcount() throws Exception {
		return sql.selectOne(namespace + ".adpcount"); 
	}

	@Override
	public List<ADProductDTO> adplistPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		return sql.selectList(namespace + ".adplistPage", data);
	}

	@Override
	public void insertdata(ProductDTO2 dto) throws Exception {
		sql.insert(namespace + ".insertdata", dto);
		
	}

	@Override
	public void adpmodify(ADProductDTO dto) throws Exception {
		sql.insert(namespace + ".adpmodify", dto);
		
	}

	@Override
	public void adpdelete(int p_id) throws Exception {
		sql.delete(namespace + ".adpdelete", p_id);
		
	}
	

}
