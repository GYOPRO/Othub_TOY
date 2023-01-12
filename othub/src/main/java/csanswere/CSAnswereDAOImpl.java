package csanswere;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CSAnswereDAOImpl implements CSAnswereDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "cs_answere";
	
	
	@Override
	public List<CSAnswereDTO> answere(int cs_seq) throws Exception {
		return sql.selectList(namespace + ".answere", cs_seq);
	}

	@Override
	public void answerewrite(CSAnswereDTO dto) throws Exception {
		sql.insert(namespace + ".answereWrite", dto);
		
	}

	@Override
	public void answeremodify(CSAnswereDTO dto) throws Exception {
		sql.update(namespace + ".answereModify", dto);
		
	}

	@Override
	public void answeredelete(CSAnswereDTO dto) throws Exception {
		sql.delete(namespace + ".answereDelete", dto);
		
	}

}
