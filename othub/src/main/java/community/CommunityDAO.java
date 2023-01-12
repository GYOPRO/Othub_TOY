package community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import comment.CommentDTO;
import product.ProductDTO;

@Mapper
@Repository("commu")
public interface CommunityDAO {
	
	// 전체 게시물 조회
		public List<CommunityDTO> communityList();
	
	// 전체 게시물 갯수 조회
		public int countCommunity();
	
	// 페이징(최신순)
		public List<CommunityDTO> limitCommunity(int page);
	
	// 게시판 저장
		public int insertCommunity(CommunityDTO dto);
		
	// 페이징(좋아요)
		public List<CommunityDTO> likeCommunity(int page);
		
	// 페이징(내 게시물)
		public List<CommunityDTO> myCommunity(String s_writer);
	
	// 좋아요한 게시물
		public List<CommunityDTO> myLikeCommunity(String m_id);
	
	// 좋아요 중복 확인
		public int likeCount(int seq);
		
	// 게시물 디테일
		public CommunityDTO oneCommunity(int s_seq);
		
	// 게시물 수정
		public int updateWriting(CommunityDTO dto);
		
	// 조회수 업데이트
		public void viewCount(int s_seq);
		
	// 게시물 삭제
		public void deleteCommunity(int s_seq);
		
	// 좋아요 중복 체크
		public int likeCheck(int s_seq, String m_id);
	
	// insert 좋아요
		public void insertLike(int s_seq, String m_id);
		
	// max
		public int maxLike();
		
	// 좋아요 수 업데이트
		public void updateLike(int s_seq);
	
	// update 좋아요 체크
		public void updateLikeCheck(int s_seq,String m_id);
		
	// update 좋아요 취소 체크
		public void updateLikeCheckCancel(int s_seq, String m_id);
		
	// update 좋아요 취소
		public void updateLikeCancel(int s_seq);
		
	// delete 좋아요
		public void deleteLike(int s_seq,String m_id);
	
	// list like 가져오기
		public int likeCheck_main(int s_seq,String m_id);
		
	// 비슷한 색상 가져오기
		public List<ProductDTO> similarcolor(String p_color);
		
	// 비슷한 색상 가져오기
		public List<ProductDTO> similarcolorbackpack(String p_color);

	// 비슷한 색상 가져오기
		public List<ProductDTO> similarcolorbottom(String p_color);
		
	// 비슷한 색상 가져오기
		public List<ProductDTO> productTag1();
		
	// 상품 태그 가져오기
		public List<ProductDTO> selectProductTag1(String p_name1);
		public List<ProductDTO> selectProductTag2(String p_name2);
		public List<ProductDTO> selectProductTag3(String p_name3);
		public List<ProductDTO> selectProductTag4(String p_name4);
		
	// 검색기능
		//제목
		public List<CommunityDTO> searchtitle(String s_title);
		//내용
		public List<CommunityDTO> searchcontents(String s_contents);
		//작성자
		public List<CommunityDTO> searchwriter(String s_writer);
	
	//내가 쓴 댓글
		public List<CommentDTO> mycomment(String m_id);

}
