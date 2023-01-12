package community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import comment.CommentDTO;
import member.couponDTO;
import product.ProductDTO;

@Service("commuservice")
public class CommunityService {

	@Autowired
	@Qualifier("commu")
	CommunityDAO dao;
	
	// 전체 게시물 조회
	public List<CommunityDTO> communityList() {
		return dao.communityList();
	}
	
	// 최대 페이지 수
	public int countCommunity() {
		int countCommunity = dao.countCommunity();
		int limitPage = 0;
		if(countCommunity % 16 ==0) {
			limitPage = countCommunity/16;
		}else {
			limitPage = countCommunity/16 + 1;
		}
		return limitPage;
	};
	
	//전체 게시물 갯수
	public int amountCommunity() {
		int totalboard =  dao.countCommunity();
		return totalboard;
	}

	// 페이징(최신순)
	public List<CommunityDTO> limitCommunity(int page){
		int limit = (page - 1) * 16;
		return dao.limitCommunity(limit);
	}
	//페이징(좋아요순)
	public List<CommunityDTO> likeCommunity(int page){
		int limit = (page - 1) * 16;
		return dao.likeCommunity(limit);
	}
	//페이징(내 게시물)
	public List<CommunityDTO> myCommunity(String s_writer){
		return dao.myCommunity(s_writer);
	}
	
	//페이징(좋아요한 게시물)
	public List<CommunityDTO> myLikeCommunity(String m_id) {
		return dao.myLikeCommunity(m_id);
	}
	
	//게시판 저장
	public int insertCommunity(CommunityDTO dto) {
		return dao.insertCommunity(dto);
	}
	
	
	//게시물 디테일
	public CommunityDTO oneCommunity(int s_seq){
		return dao.oneCommunity(s_seq);
	}
	
	//게시물 수정
	public int updateWriting(CommunityDTO dto) {
		return dao.updateWriting(dto);
	}
	
	//게시물 조회수
	public void viewCount(int s_seq) {
		 dao.viewCount(s_seq);
	}
	//게시물 삭제
	public void deleteCommunity(int s_seq) {
		dao.deleteCommunity(s_seq);
	}
	
	//좋아요 중복 확인
	public int likeCount(int s_seq) {
		return dao.likeCount(s_seq);
	}
	
	//좋아요 중복 체크
	public int likeCheck(int s_seq, String m_id) throws Exception{
		return dao.likeCheck(s_seq,m_id);
	}
	
	//insert 좋아요
	public void insertLike(int s_seq, String m_id) throws Exception{
		dao.insertLike(s_seq,m_id);
	}
	
	//update 좋아요
	public void updateLike(int s_seq) throws Exception{
		dao.updateLike(s_seq);
	}
	
	//update 좋아요 체크
	public void updateLikeCheck(int s_seq, String m_id) {
		dao.updateLikeCheck(s_seq, m_id);
	}
	
	//update 좋아요 취소 체크
	public void updateLikeCheckCancel(int s_seq, String m_id) {
		dao.updateLikeCheckCancel(s_seq,m_id);
	}
	
	public void updateLikeCancel(int s_seq) {
		dao.updateLikeCancel(s_seq);
	}
	
	//delete 좋아요
	public void deleteLike(int s_seq, String m_id) {
		dao.deleteLike(s_seq,m_id);
	}
	
	public int likeCheck_main(int s_seq,String m_id){
		return dao.likeCheck_main(s_seq,m_id);
	}
	
	//비슷한 색상 가져오기(상의)
	public List<ProductDTO> similarcolor(String p_color){
		return dao.similarcolor(p_color);
	}
	
	//비슷한 색상 가져오기(가방)
	public List<ProductDTO> similarcolorbackpack(String p_color){
		return dao.similarcolorbackpack(p_color);
	}
	//비슷한 색상 가져오기(가방)
	public List<ProductDTO> similarcolorbottom(String p_color){
		return dao.similarcolorbottom(p_color);
	}
	
	//비슷한 색상 가져오기(가방)
	public List<ProductDTO> productTag1(){
			return dao.productTag1();
	}
	// 상품 태그 가져오기
	public List<ProductDTO> selectProductTag1(String p_name1){
			return dao.selectProductTag1(p_name1);
	}
	public List<ProductDTO> selectProductTag2(String p_name2){
			return dao.selectProductTag2(p_name2);
	}
	public List<ProductDTO> selectProductTag3(String p_name3){
			return dao.selectProductTag3(p_name3);
	}
	public List<ProductDTO> selectProductTag4(String p_name4){
		return dao.selectProductTag4(p_name4);
	}
	
	//검색 기능
	//제목
	public  List<CommunityDTO> searchtitle(String s_title) {
		return dao.searchtitle(s_title);
	}
	//내용
	public  List<CommunityDTO> searchcontents(String s_contents) {
		return dao.searchcontents(s_contents);
	}
	//작성자
	public  List<CommunityDTO> searchwriter(String s_writer) {
		return dao.searchwriter(s_writer);
	}
	//내가 쓴 댓글
	public List<CommentDTO> mycomment(String m_id){
		return dao.mycomment(m_id);
	}
}
