package csanswere;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CSAnswereServiceImpl implements CSAnswereService {
	
	@Inject
	private CSAnswereDAO dao;

	@Override
	public List<CSAnswereDTO> answere(int cs_seq) throws Exception {
		return dao.answere(cs_seq);
	}

	@Override
	public void answerewrite(CSAnswereDTO dto) throws Exception {
		dao.answerewrite(dto);
		
	}

	@Override
	public void answeremodify(CSAnswereDTO dto) throws Exception {
		dao.answeremodify(dto);
		
	}

	@Override
	public void answeredelete(CSAnswereDTO dto) throws Exception {
		dao.answeredelete(dto);
		
	}

}
