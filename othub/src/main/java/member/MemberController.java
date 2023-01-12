package member;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	//로그인 페이지
		@RequestMapping("/login")
		public String loginform() {
			return "member/login";
		}
	//콜백 페이지 페이지
		@RequestMapping("/callback")
		public String callbackform() {
			return "member/callback";
		}
				
	//로그인 페이지
		@RequestMapping("/login2")
		public String loginform2() {
			return "member/login2";
		}
				
	//로그인
		@PostMapping("/loginprocess")
		public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session, HttpServletRequest request) {
			String name = service.insertCheck(dto);
			MemberDTO m_dto = service.selectOneMember(dto.getM_id());
			ModelAndView mv = new ModelAndView();
			session = request.getSession();

			if (name != null) { // 로그인 성공 시
				session.setAttribute("m_id", dto.getM_id());
				session.setAttribute("role1", m_dto.getRole1());
				session.setAttribute("role2", m_dto.getRole2());
				mv.setViewName("member/main");
			} else { // 로그인 실패 시
				mv.setViewName("member/login");
				mv.addObject("message", "error");
			}
			return mv;
		}
		
	//로그아웃
		@RequestMapping("/logout")
		public String logout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.invalidate();
			return "main/index";
		}
		
	 
	//회원가입폼 이동
		@GetMapping("/signin")
		public String signin() {
			return "member/singinform";
		}
		

		
	//회원가입
	      @RequestMapping(value = "/signin", method = RequestMethod.POST)
	      public String insertMember(MemberDTO dto) throws Exception{
	            service.insertMember(dto);
	            int cpcheck = service.couponCheckSilver(dto.m_id);
	            if(cpcheck == 0 ) {
	            	service.insertCouponSilver(dto.m_id);
	            }
	            
	            couponDTO dto2 = new couponDTO();
				LocalDate now = LocalDate.now();
				String nowdate = now.getYear()+"-"+now.getMonthValue()+"-"+now.getDayOfMonth();
				Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(nowdate); //지금시간
				List<couponDTO> couponlist = service.selectCoupon(dto.m_id);
				for(int i=0; i<couponlist.size(); i++) {
					String enddate = couponlist.get(i).cp_endAt;
					Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(enddate); //db시간
					long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
					long diffDays = diffSec / (24*60*60); //일자수 차이
					dto2.setPeriod(Long.toString(diffDays));
					String period = dto2.getPeriod();
					System.out.println(period);
					service.updateDate(dto.m_id, period);
				}
				
	            return "main/index";
	      }
	 //idcheck
		
	//마이페이지 접속
		@RequestMapping("/mypage")
		public String mypage(HttpServletRequest request,String m_id,Model model) throws Exception{
			
			couponDTO dto = new couponDTO();
			HttpSession session = request.getSession();
			m_id = (String)session.getAttribute("m_id");
			MemberDTO mdto = service.selectOneMember(m_id);
			List<couponDTO> couponlist = service.selectCoupon(m_id);
			model.addAttribute("couponcount",couponlist.size());
			
			//지호
			PointDTO pdto = service.countPoint(m_id);
			model.addAttribute("countPoint", pdto); 

			String role2 = mdto.role2;

			model.addAttribute("role2",role2);
			if(couponlist.isEmpty()) {
			LocalDate now = LocalDate.now();
			String nowdate = now.getYear()+"-"+now.getMonthValue()+"-"+now.getDayOfMonth();
			Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(nowdate); //지금시간
			
			for(int i=0; i<couponlist.size(); i++) {
				String enddate = couponlist.get(i).cp_endAt;
				Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(enddate); //db시간
				long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
				long diffDays = diffSec / (24*60*60); //일자수 차이
				dto.setPeriod(Long.toString(diffDays));
				String period = dto.getPeriod();
				System.out.println(period);
				service.updateDate(m_id, period);
				System.out.println(diffDays);
			}
			}
			
			return "member/mypage";
		}
		
	//회원정보수정 폼
		@RequestMapping("/updateform")
		public ModelAndView updateMember(String m_id, HttpServletRequest request) {
			HttpSession session = request.getSession();
			m_id = (String)session.getAttribute("m_id");
			MemberDTO dto = service.selectOneMember(m_id);
			ModelAndView mv = new ModelAndView();
			mv.addObject("memberdto",dto);
			mv.setViewName("member/updateform");
			return mv;
		}
	// 회원정보수정
		@PostMapping("/updatemember")
		public String updateBoard(MemberDTO dto) {
			service.updateMember(dto);
			return "member/mypage";
		}
		
	//아이디중복확인 - 하.. 안댐
		@RequestMapping("/idCheck")
		@ResponseBody
		public int idCheck(@RequestParam("m_id") String m_id) {
			int cnt = service.checkId(m_id);
			return cnt;
		}
	
	//회원탈퇴
		@RequestMapping("/deletemember")
		public String deleteprocess(String m_id, HttpServletRequest request) {
			HttpSession session = request.getSession();
			m_id = (String) session.getAttribute("m_id");
			service.deleteMember(m_id);
			session.invalidate();
			return "main/index";
		}
		
	//회원 리스트 불러오기(가입일자 순)
		@RequestMapping("/memberlist")
		public ModelAndView memberlist() throws Exception {
			List<MemberDTO> memberlist = service.selectMemberList();
			ModelAndView mv = new ModelAndView();
			mv.addObject("memberlist",memberlist);
			mv.setViewName("admin/memberlist");
			return mv;
		}
		
	//회원 리스트 불러오기(id 순)
		@RequestMapping("/memberlistid")
		public ModelAndView memberlistId() throws Exception {
			List<MemberDTO> memberlist = service.selectMemberListId();
			ModelAndView mv = new ModelAndView();
			mv.addObject("memberlist",memberlist);
			mv.setViewName("admin/memberlist");
			return mv;
		}
		
	//회원 리스트 불러오기(이름 순)
		@RequestMapping("/memberlistname")
		public ModelAndView memberlistName() throws Exception {
			List<MemberDTO> memberlist = service.selectMemberListName();
			ModelAndView mv = new ModelAndView();
			mv.addObject("memberlist",memberlist);
			mv.setViewName("admin/memberlist");
			return mv;
		}
		
	// 관리자 회원 수정
		@PostMapping("/updateMemberByAdmin")
		public String updateMemberByAdmin(MemberDTO dto) {
			service.updateMemberByAdmin(dto);
			return "redirect:/memberlist";
		}
	// 관리자 회원 탈퇴
		@PostMapping("/deleteMemberByAdmin")
		public String deleteMemberByAdmin(MemberDTO dto) {
			service.deleteMemberByAdmin(dto.m_id);
			return "redirect:/memberlist";
		}
		
	//회원 리스트 불러오기(일반회원)
		@RequestMapping("/userlist")
		public ModelAndView userlistName() throws Exception {
			List<MemberDTO> userlist = service.selectUserList();
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("memberlist",userlist);
			mv.setViewName("admin/userlist");
			return mv;
		}
	//일반 회원 등급 변경
		@PostMapping("/updateUserRole")
		public String updateUserRole(MemberDTO dto) {
			service.updateUserRole(dto);
			return "redirect:/userlist";
		}
		
	// 쿠폰함
		@RequestMapping("mycoupon")
		public ModelAndView mycoupon(String m_id, HttpServletRequest request) throws Exception{
			couponDTO dto = new couponDTO();
			HttpSession session = request.getSession();
			m_id = (String)session.getAttribute("m_id");
			List<couponDTO> couponlist = service.selectCoupon(m_id);
			ModelAndView mv = new ModelAndView();
			mv.addObject("couponlist",couponlist);
			mv.setViewName("member/mycoupon");
			
			LocalDate now = LocalDate.now();
			String nowdate = now.getYear()+"-"+now.getMonthValue()+"-"+now.getDayOfMonth();
			Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(nowdate); //지금시간
			
			for(int i=0; i<couponlist.size(); i++) {
				String enddate = couponlist.get(i).cp_endAt;
				Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(enddate); //db시간
				long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
				long diffDays = diffSec / (24*60*60); //일자수 차이
				dto.setPeriod(Long.toString(diffDays));
				String period = dto.getPeriod();
				service.updateDate(m_id, period);
			}
			

			return mv;
		}
		
}

