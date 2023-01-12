package reserv;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import member.MemberDTO;
import showroom.ShowroomDTO;

@Mapper
@Repository("reservdao")
public interface ReservDAO {
	//임시예약
	public void temporarilyReserv(ReservDTO dto) throws Exception;
	
	//예약 취소
	public void deleteTemporarily(int r_id) throws Exception;
	
	//예약 취소
	public void deleteTemporarily2(String m_id) throws Exception;
	
	//예약
	public void reservShowroom(ReservDTO dto) throws Exception;
	
	//예약페이지 조회
	public ReservDTO reservView(String m_id) throws Exception;
	
	//예약조회
	public ReservDTO oneReserv(int r_id) throws Exception;
	
	//내 예약 조회
	public List<ReservDTO> myReservList(String m_id) throws Exception;
	
	//전체 예약 조회
	public List<ReservDTO> reservAllList(int page) throws Exception;
	
	//전체 예약 개수
	public int reservTotalCount() throws Exception;
	
	//상품별 예약 조회
	public List<ReservDTO> sr_reservList(int sr_num) throws Exception;
	
	//회원정보 조회
	public MemberDTO sr_memberInfo(String m_id) throws Exception;
	
	//쇼룸정보 조회
	public ShowroomDTO sr_showroomInfo(int sr_num) throws Exception;
	
}
