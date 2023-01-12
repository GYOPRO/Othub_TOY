 package showroom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("showroomservice")
public class ShowroomServiceImpl implements ShowroomService {
	@Autowired
	@Qualifier("showroomdao")
	ShowroomDAO dao;
	
	
	//전체 게시물 조회
	@Override
	public List<ShowroomDTO> showroomList() throws Exception {
		return dao.showroomList();
	}
	
	//카테고리 조회
	@Override
	public List<ShowroomDTO> cateList(Map<String, Object> map) throws Exception {
		return dao.cateList(map);
	}
	
	//카테고리 게시물 총 개수
	@Override
	public int cateCount(int sr_kind) throws Exception {
		int totalPost = dao.cateCount(sr_kind);
		int countPage = 0;
		if(totalPost % 12 == 0) {
			countPage = totalPost/12;
		}
		else {
			countPage = totalPost/12 + 1;
		}
		return countPage;
	}
	
	//전체 게시물 최신순
	@Override
	public List<ShowroomDTO> newList(int page) throws Exception {
		int countpage = (page - 1) * 12;
		return dao.newList(countpage);
	}

	//전체 게시물 조회순
	@Override
	public List<ShowroomDTO> viewCountList(int page) throws Exception {
		int countpage = (page - 1) * 12;
		return dao.viewCountList(countpage);
	}

	//게시물 총 개수
	@Override
	public int TotalCountShowroom() throws Exception {
		return dao.TotalCountShowroom();
	}
	
	//전체 페이지 수 - 페이징 
	@Override
	public int countPage() throws Exception {
		int totalPost = dao.TotalCountShowroom();
		int countPage = 0;
		if(totalPost % 12 == 0) {
			countPage = totalPost/12;
		}
		else {
			countPage = totalPost/12 + 1;
		}
		return countPage;
	}

	//조회수 업데이트
	@Override
	public void viewCount(int sr_num) throws Exception {
		dao.viewCount(sr_num);
	}
	
	//게시물 하나 조회
	@Override
	public ShowroomDTO onePost(int sr_num) throws Exception {
		return dao.onePost(sr_num);
	}
	
	//게시글 등록
	@Override
	public void insertShowroom(ShowroomDTO dto) throws Exception {
		dao.insertShowroom(dto);
	}

	//게시글 수정
	@Override
	public void updateShowroom(ShowroomDTO dto) throws Exception {
		dao.updateShowroom(dto);
	}
	
	//게시글 삭제
	@Override
	public void deleteShowroom(int sr_num) throws Exception {
		dao.deleteShowroom(sr_num);
	}
	
	//오늘의 추천 쇼룸
	@Override
	public List<ShowroomDTO> todayShowroom() throws Exception {
		return dao.todayShowroom();
	}
	

}
