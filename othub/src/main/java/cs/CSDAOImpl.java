package cs;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import csanswere.CSAnswereDTO;

@Repository
public class CSDAOImpl implements CSDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "cs";

	@Override
	public List<CSDTO> cslist() throws Exception {
		return sql.selectList(namespace + ".cslist");
	}

	@Override
	public void cswrite(CSDTO dto) throws Exception {
		sql.insert(namespace + ".cswrite", dto);
		
	}

	@Override
	public CSDTO cswview(int cs_seq) throws Exception {
		return sql.selectOne(namespace + ".csview", cs_seq);
	}

	@Override
	public void csmodify(CSDTO dto) throws Exception {
		sql.insert(namespace + ".csmodify", dto);
		
	}

	@Override
	public void csdelete(int cs_seq) throws Exception {
		sql.delete(namespace + ".csdelete", cs_seq);
		
	}

	@Override
	public int cscount() throws Exception {
		return sql.selectOne(namespace + ".cscount"); 
	}
	
	@Override
	public int mycscount(String m_id) throws Exception {
		return sql.selectOne(namespace + ".mycscount", m_id); 
	}

	@Override
	public List<CSDTO> cslistPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		return sql.selectList(namespace + ".cslistPage", data);
	}

	@Override
	public void answerecheck(CSDTO dto) throws Exception {
		sql.update(namespace + ".answerecheck", dto);
		
	}

	@Override
	public List<CSDTO> mycslist(String cs_writer) throws Exception {
		
		  return sql.selectList(namespace + ".mycslist");
	}


}
