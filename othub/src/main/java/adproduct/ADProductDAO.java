package adproduct;

import java.util.List;


public interface ADProductDAO {
	
	// 상품 입력
	public void insertproduct(ADProductDTO dto) throws Exception;
	
	// review 조회
	public ADProductDTO getproduct(int p_id);
	
	// 게시물 총 갯수
	public int adpcount() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<ADProductDTO> adplistPage(int displayPost, int postNum) throws Exception;
	
	// 상품 최종 입력
	public void insertdata(ProductDTO2 dto) throws Exception;
	
	// 상품 수정
	public void adpmodify(ADProductDTO dto) throws Exception;
	
	// 게시물 삭제
	public void adpdelete(int p_id) throws Exception;

}
