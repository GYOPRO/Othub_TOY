package cs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CSServiceImpl implements CSService {
	
	@Inject
	private CSDAO dao;

	@Override
	public List<CSDTO> cslist() throws Exception {
		return dao.cslist();
	}

	@Override
	public void cswrite(CSDTO dto) throws Exception {
		dao.cswrite(dto);
		
	}

	@Override
	public CSDTO cswview(int cs_seq) throws Exception {
		return dao.cswview(cs_seq);
	}

	@Override
	public void csmodify(CSDTO dto) throws Exception {
		dao.csmodify(dto);
		
	}

	@Override
	public void csdelete(int cs_seq) throws Exception {
		dao.csdelete(cs_seq);
		
	}

	@Override
	public int cscount() throws Exception {
		return dao.cscount();
	}
	
	@Override
	public int mycscount(String m_id) throws Exception {
		return dao.mycscount(m_id);
	}

	@Override
	public List<CSDTO> cslistPage(int displayPost, int postNum) throws Exception {
		return dao.cslistPage(displayPost, postNum);
	}

	@Override
	public void answerecheck(CSDTO dto) throws Exception {
		dao.answerecheck(dto);
		
	}

	@Override
	public List<CSDTO> mycslist(String cs_writer) throws Exception {
		return dao.mycslist(cs_writer);
	}

}
