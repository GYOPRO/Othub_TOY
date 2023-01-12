package comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("commentdao")
public interface CommentDAO {

	//댓글 등록
	public int registComment(CommentDTO dto);
	
	//댓글 조회
	public List<CommentDTO> getList(int b_seq);
	
	//댓글 갯수 조회
	public int countComment(int b_seq);
}
