package admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberService;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("memberservice")
	MemberService memberservice;
	
	//관리자 페이지
	@RequestMapping("/adminpage")
	public String adminPage() {
		return "admin/adminpage";
	}
	

	
}
