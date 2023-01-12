package csanswere;

import java.util.List;

public interface CSAnswereDAO {
	
	// 댓글 조회
	public List<CSAnswereDTO> answere(int cs_seq) throws Exception;

	// 댓글  작성
	public void answerewrite(CSAnswereDTO dto) throws Exception;

	// 댓글 수정
	public void answeremodify(CSAnswereDTO dto) throws Exception;

	// 댓글 삭제
	public void answeredelete(CSAnswereDTO dto) throws Exception;

}
