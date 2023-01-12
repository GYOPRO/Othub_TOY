package comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("commentservice")
public class CommentService {
	
	@Autowired
	@Qualifier("commentdao")
	CommentDAO dao;
	
	public int  registComment(CommentDTO dto) {
		return dao.registComment(dto);
	}
	
	public List<CommentDTO> getList(int b_seq){
		return dao.getList(b_seq);
	}
	
	public int commentCount(int b_seq) {
		return dao.countComment(b_seq);
	}
}
