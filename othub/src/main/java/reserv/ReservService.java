package reserv;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import member.MemberDTO;
import showroom.ShowroomDTO;

@Service("reservservice")
public class ReservService {
	@Autowired
	@Qualifier("reservdao")
	ReservDAO dao;
	
	//임시예약
	public void temporarilyReserv(ReservDTO dto) throws Exception{
		dao.temporarilyReserv(dto);
	};
	
	//예약 취소
	public void deleteTemporarily(int r_id) throws Exception{
		dao.deleteTemporarily(r_id);
	};
	
	//예약 취소2
	public void deleteTemporarily2(String m_id) throws Exception{
		dao.deleteTemporarily2(m_id);
	};
	
	//예약
	public void reservShowroom(ReservDTO dto) throws Exception{
		dao.reservShowroom(dto);
	};
	
	//예약페이지 조회
	public ReservDTO reservView(String m_id) throws Exception{
		return dao.reservView(m_id);
	};
	
	//예약조회
	public ReservDTO oneReserv(int r_id) throws Exception{
		return dao.oneReserv(r_id);
	};
	
	//내 예약 조회
	public List<ReservDTO> myReservList(String m_id) throws Exception{
		return dao.myReservList(m_id);
	};
	
	//전체 예약 조회
	public List<ReservDTO> reservAllList(int page) throws Exception{
		return dao.reservAllList(page);
	};
	
	//전체 예약 개수
	public int reservTotalCount() throws Exception{
		return dao.reservTotalCount();
	};
	
	//상품별 예약 조회
	public List<ReservDTO> sr_reservList(int sr_num) throws Exception{
		return dao.sr_reservList(sr_num);
	};
	
	//회원정보 조회
	public MemberDTO sr_memberInfo(String m_id) throws Exception{
		return dao.sr_memberInfo(m_id);
	};
	
	//쇼룸정보 조회
	public ShowroomDTO sr_showroomInfo(int sr_num) throws Exception{
		return dao.sr_showroomInfo(sr_num);
	};
}
