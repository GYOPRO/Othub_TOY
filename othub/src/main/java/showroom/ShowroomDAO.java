package showroom;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository("showroomdao")
public interface ShowroomDAO {
	//전체 게시물 조회
	public List<ShowroomDTO> showroomList() throws Exception;
	
	//카테고리 조회
	public List<ShowroomDTO> cateList(Map<String, Object> map)throws Exception;
	
	//카테고리 게시물 총 개수
	public int cateCount(int sr_kind) throws Exception;

	//전체 게시물 최신순
	public List<ShowroomDTO> newList(int page) throws Exception;
	
	//전체 게시물 조회순
	public List<ShowroomDTO> viewCountList(int page) throws Exception;
	
	//게시물 총 개수
	public int TotalCountShowroom() throws Exception;
	
	//조회수 업데이트
	public void viewCount(int sr_num) throws Exception;
	
	//게시물 하나 조회
	public ShowroomDTO onePost(int sr_num) throws Exception;
	
	//게시물 등록
	public void insertShowroom(ShowroomDTO dto) throws Exception;
	
	//게시물 수정
	public void updateShowroom(ShowroomDTO dto) throws Exception;
	
	//게시물 삭제
	public void deleteShowroom(int sr_num) throws Exception;
	
	//오늘의 추천 쇼룸
	public List<ShowroomDTO> todayShowroom() throws Exception;
	
}
