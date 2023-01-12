package reserv;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberDTO;
import showroom.ShowroomDTO;

@Controller 
public class ReserveController {
	@Autowired
	@Qualifier("reservservice")
	ReservService r_service;
	
	//예약 페이지
	@RequestMapping("/reserv")
	public String reservMain(ReservDTO dto,String m_id, int sr_num,String r_date,  Model model) throws Exception{
		//예약임시저장
		r_service.temporarilyReserv(dto);
		//예약페이지
		ReservDTO reservView = r_service.reservView(m_id);
		MemberDTO memberInfo = r_service.sr_memberInfo(m_id);
		ShowroomDTO showroomInfo = r_service.sr_showroomInfo(sr_num);
		model.addAttribute("reservView", reservView);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("showroomInfo", showroomInfo);
		return "reserv/r_main";
	}
	
	//예약
	@PostMapping("/reservprocess")
	public String reservProcess(ReservDTO dto, String m_id) throws Exception {
		r_service.reservShowroom(dto);
		r_service.deleteTemporarily2(m_id);
		return "redirect:/showroom";
	}
	
	//예약 취소
	@RequestMapping("/cenclereserv")
	public String cencleReserv(int r_id, String m_id) throws Exception{
		r_service.deleteTemporarily(r_id);
		r_service.deleteTemporarily2(m_id);
		return "redirect:/showroom";
	}
	
	//mypage My예약
	@RequestMapping("/myreserv")
	public String myReserv(String m_id, Model model) throws Exception{
		r_service.deleteTemporarily2(m_id);
		List<ReservDTO> myr_list = r_service.myReservList(m_id);
		model.addAttribute("myList", myr_list);
		return "reserv/myreserv";
	}
	
	
}
