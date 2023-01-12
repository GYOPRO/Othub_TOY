package cs;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.naverai.NaverInform;

import csanswere.CSAnswereDTO;
import csanswere.CSAnswereService;
import member.MemberDTO;
import member.MemberService;

@Controller
public class CSController {

	
	@Inject
	private CSService service;
	
	
	
	@Inject
	private CSAnswereService answereService;
	
	@Autowired
	@Qualifier("memberservice")
	MemberService memberservice;

	 
	// 게시물 작성
	 @RequestMapping(value = "/cswrite", method = RequestMethod.GET)
	 public ModelAndView getCSWirte(CSDTO dto, MemberDTO mdto, Model model,HttpServletRequest request, HttpSession cssession) throws Exception {
		
		HttpSession session = request.getSession();
		String cs_writer = (String)session.getAttribute("m_id");
		dto.setCs_writer(cs_writer);
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("cs_writer", cs_writer);
		mv.setViewName("cs/cswrite");
		return mv;
	    
	 }
	 
	 //게시물 작성
	 @RequestMapping(value = "/cswrite", method = RequestMethod.POST)
	 public ModelAndView postCSWrite(CSDTO dto, MultipartFile uploadfile) throws Exception {
		 
		 String savePath =NaverInform.j_path2;
		 
		 MultipartFile cs_pic = dto.getCs_pic();
			if(!cs_pic.isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String originalname = cs_pic.getOriginalFilename();
				String beforeext = originalname.substring(0, originalname.indexOf("."));
				String ext = originalname.substring(originalname.indexOf("."));
				String newname = uuid.toString()+"_"+beforeext+ext;
				File servefile = new File(savePath+newname);
				System.out.println(savePath+newname);
				cs_pic.transferTo(servefile);
				dto.setCs_pic_name(newname);
			}
		 
		service.cswrite(dto);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/cslistPage?csnum=1");
		return mv;
		
	 }
	 
	// 게시물 조회
	 @RequestMapping(value = "/csview", method = RequestMethod.GET)
	 public ModelAndView getCSView(@RequestParam("cs_seq") int cs_seq, Model model, HttpServletRequest request) throws Exception {
		 
		// 댓글 조회
		List<CSAnswereDTO> answere = null;
		answere = answereService.answere(cs_seq);
		model.addAttribute("answere", answere);
		
		//m_id값 불러오기
		HttpSession session = request.getSession();
		String cs_writer = (String)session.getAttribute("m_id");
		
		CSDTO dto = service.cswview(cs_seq);
		
		model.addAttribute("csview", dto);
		 
		ModelAndView mv = new ModelAndView();
		mv.addObject("cs_writer", cs_writer);
		mv.setViewName("cs/csview");
		return mv;
			 
	 }
	 
	// 게시물 수정
	 @RequestMapping(value = "/csmodify", method = RequestMethod.GET)
	 public ModelAndView getCSModify(@RequestParam("cs_seq") int cs_seq, Model model, MemberDTO mdto, HttpServletRequest request) throws Exception {
		 
		 
		HttpSession session = request.getSession();
		String cs_writer = (String)session.getAttribute("m_id");
		 
		CSDTO dto = service.cswview(cs_seq);
			
		model.addAttribute("csview", dto);
		 
		ModelAndView mv = new ModelAndView();
		mv.addObject("cs_writer", cs_writer);
		mv.setViewName("cs/csmodify");
		return mv;

	 }
	 
	// 게시물 수정
	@RequestMapping(value = "/csmodify", method = RequestMethod.POST)
	public ModelAndView postCSModify(CSDTO dto, MultipartFile uploadfile) throws Exception {
		
		String savePath = NaverInform.j_path2;	 
		
		 MultipartFile cs_pic = dto.getCs_pic();
			if(!cs_pic.isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String originalname = cs_pic.getOriginalFilename();
				String beforeext = originalname.substring(0, originalname.indexOf("."));
				String ext = originalname.substring(originalname.indexOf("."));
				String newname = uuid.toString()+"_"+beforeext+ext;
				File servefile = new File(savePath+newname);
				System.out.println(savePath+newname);
				cs_pic.transferTo(servefile);
				dto.setCs_pic_name(newname);
			}
		 
		
		service.csmodify(dto);
			 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/csview?cs_seq=" + dto.getCs_seq());
		return mv;
		
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/csdelete", method = RequestMethod.GET)
	public ModelAndView getCSDelete(@RequestParam("cs_seq") int cs_seq) throws Exception {
	  
		 service.csdelete(cs_seq);
	
		 ModelAndView mv = new ModelAndView();
		 mv.setViewName("redirect:/cslistPage?csnum=1");
		 return mv;
	}
	
	//게시물 리스트 + 페이징
		 @RequestMapping(value = "/cslistPage", method = RequestMethod.GET)
		 public ModelAndView getCSListPage(Model model, @RequestParam("csnum") int csnum) throws Exception {
			 
			 
			 // 게시물 총 갯수
			 int cscount = service.cscount();
			 
			// 한 페이지에 출력할 게시물 갯수
			 int cspostNum = 10;
			 
			// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
			 int cspageNum = (int)Math.ceil((double)cscount/cspostNum);
			 
			 // 출력할 게시물
			 int csdisplayPost = (csnum - 1) * cspostNum;
			 
			// 한번에 표시할 페이징 번호의 갯수
			 int cspageNum_cnt = 10;

			 // 표시되는 페이지 번호 중 마지막 번호
			 int csendPageNum = (int)(Math.ceil((double)csnum / (double)cspageNum_cnt) * cspageNum_cnt);

			 // 표시되는 페이지 번호 중 첫번째 번호
			 int csstartPageNum = csendPageNum - (cspageNum_cnt - 1);
			 
			// 마지막 번호 재계산
			 int csendPageNum_tmp = (int)(Math.ceil((double)cscount / (double)cspageNum_cnt));
			  
			 if(csendPageNum > csendPageNum_tmp) {
			  csendPageNum = csendPageNum_tmp;
			 }
			 
			 boolean csprev = csstartPageNum == 1 ? false : true;
			 boolean csnext = csendPageNum * cspageNum_cnt >= cscount ? false : true;
			 
			// 시작 및 끝 번호
			 model.addAttribute("csstartPageNum", csstartPageNum);
			 model.addAttribute("csendPageNum", csendPageNum);

			 // 이전 및 다음 
			 model.addAttribute("csprev", csprev);
			 model.addAttribute("csnext", csnext);
			 
			// 현재 페이지
			 model.addAttribute("csselect", csnum);
			 
			 List<CSDTO> cslist = null; 
			 cslist = service.cslistPage(csdisplayPost, cspostNum);
			 model.addAttribute("cslist", cslist);   
			 model.addAttribute("cspageNum", cspageNum);
			 
			ModelAndView mv = new ModelAndView();
			mv.setViewName("cs/cslistPage");
			return mv;
		   
		 }
		 
		 //내 cs게시물
		 @RequestMapping(value = "/mycslistPage", method = RequestMethod.GET)
		 public ModelAndView getMyCSList(Model model, String cs_writer, HttpServletRequest request, @RequestParam("csnum") int csnum) throws Exception {
			 
			 HttpSession session = request.getSession();
			 String m_id = (String)session.getAttribute("m_id");
			 
			// 게시물 총 갯수
			 int mycscount = service.mycscount(m_id);
			 
			// 한 페이지에 출력할 게시물 갯수
			 int cspostNum = 10;
			 
			// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
			 int cspageNum = (int)Math.ceil((double)mycscount/cspostNum);
			 
			 // 출력할 게시물
			 int csdisplayPost = (csnum - 1) * cspostNum;
			 
			// 한번에 표시할 페이징 번호의 갯수
			 int cspageNum_cnt = 10;

			 // 표시되는 페이지 번호 중 마지막 번호
			 int csendPageNum = (int)(Math.ceil((double)csnum / (double)cspageNum_cnt) * cspageNum_cnt);

			 // 표시되는 페이지 번호 중 첫번째 번호
			 int csstartPageNum = csendPageNum - (cspageNum_cnt - 1);
			 
			// 마지막 번호 재계산
			 int csendPageNum_tmp = (int)(Math.ceil((double)mycscount / (double)cspageNum_cnt));
			  
			 if(csendPageNum > csendPageNum_tmp) {
			  csendPageNum = csendPageNum_tmp;
			 }
			 
			 boolean csprev = csstartPageNum == 1 ? false : true;
			 boolean csnext = csendPageNum * cspageNum_cnt >= mycscount ? false : true;
			 
			// 시작 및 끝 번호
			 model.addAttribute("csstartPageNum", csstartPageNum);
			 model.addAttribute("csendPageNum", csendPageNum);

			 // 이전 및 다음 
			 model.addAttribute("csprev", csprev);
			 model.addAttribute("csnext", csnext);
			 
			// 현재 페이지
			 model.addAttribute("csselect", csnum);
			 
			 
			 List<CSDTO> cslist = null; 
			 cslist = service.cslistPage(csdisplayPost, cspostNum);
			 model.addAttribute("cslist", cslist);   
			 model.addAttribute("cspageNum", cspageNum);
			 
			ModelAndView mv = new ModelAndView();
			mv.addObject("m_id", m_id);
			mv.setViewName("cs/mycslistPage");
			return mv;
		   
		 }
}
