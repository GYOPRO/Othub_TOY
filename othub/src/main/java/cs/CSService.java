package cs;

import java.util.List;

public interface CSService {
	
	//cslist
	public List<CSDTO> cslist() throws Exception; 
	
	// 게시물 작성
	public void cswrite(CSDTO dto) throws Exception;
	
	// 게시물 조회
	public CSDTO cswview(int cs_seq) throws Exception;
	
	// 게시물 수정
	public void csmodify(CSDTO dto) throws Exception;
	
	// 게시물 삭제
	public void csdelete(int cs_seq) throws Exception;
	
	// 게시물 총 갯수
	public int cscount() throws Exception;
	
	// my 게시물 총 갯수
	public int mycscount(String m_id) throws Exception;
	
	// 게시물 목록 + 페이징
	public List<CSDTO> cslistPage(int displayPost, int postNum) throws Exception;
	
	// 답변  확인
	public void answerecheck(CSDTO dto) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<CSDTO> mycslist(String cs_writer) throws Exception;

}
