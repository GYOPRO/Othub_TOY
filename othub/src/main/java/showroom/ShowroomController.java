package showroom;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.naverai.NaverInform;

import member.MemberDTO;
import member.MemberService;

@Controller
public class ShowroomController {
	//sr_service
	@Autowired
	@Qualifier("showroomservice")
	ShowroomServiceImpl sr_service;
	
	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	
	//쇼룸 메인페이지(전체 게시글 페이징-최신순)
	@RequestMapping("/showroom")
	public String sr_main(@RequestParam(value="page", defaultValue="1") int page,
						Model model, HttpServletRequest request) throws Exception {
		List<ShowroomDTO> sr_newList= sr_service.newList(page);
		List<ShowroomDTO> today_sr = sr_service.todayShowroom();
		int totalPage = sr_service.countPage();
		model.addAttribute("today_sr", today_sr);
		model.addAttribute("sr_newList", sr_newList);
		model.addAttribute("sr_totalPage", totalPage);
		return "showroom/sr_main"; 
	}
	
	//쇼룸 카테고리(페이징-최신순)
	@RequestMapping("/showroomlist")
	public String cateList(@RequestParam(value="page", defaultValue="1") int page,
							@RequestParam(value="cate", defaultValue="") int sr_kind, Model model) throws Exception {
		
		int totalCatePage = sr_service.cateCount(sr_kind);
		int countpage = (page - 1) * 12;
		
		//카테고리 조회,페이징
		Map<String, Object> map = new HashMap<>();
		map.put("page", countpage);
		map.put("sr_kind", sr_kind);
		List<ShowroomDTO> cateList = sr_service.cateList(map);
		List<ShowroomDTO> today_sr = sr_service.todayShowroom();
		
		model.addAttribute("sr_kind", sr_kind);
		model.addAttribute("today_sr", today_sr);
		model.addAttribute("cateList", cateList);
		model.addAttribute("sr_totalPage", totalCatePage);
		return "showroom/sr_cate"; 
	}
	
	//오늘의 추천
	@ResponseBody
	public ModelAndView todaySr() throws Exception{
		List<ShowroomDTO> today_sr = sr_service.todayShowroom();
		ModelAndView mv = new ModelAndView();
		mv.addObject("today_sr", today_sr);
		mv.setViewName("showroom/sr_main");
		mv.setViewName("showroom/sr_cate");
		return mv;
	}
	
	//상세페이지
	@RequestMapping("/showroompost")
	public String detailShowroomPage(@ModelAttribute("no") int sr_num, Model model,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberDTO member = service.selectOneMember(m_id);
		ShowroomDTO onePost = sr_service.onePost(sr_num);
		model.addAttribute("onePost", onePost);
		model.addAttribute("member", member);
		return "showroom/sr_detail";
	}
	
	
	//글쓰기 폼
	@RequestMapping("/sr_writing")
	public String srWriting(Model model) throws Exception{
		int totalpost = sr_service.TotalCountShowroom()+1;
		model.addAttribute("totalpost", totalpost);
		return "showroom/sr_writingform";
	}
	
	//게시글 등록(파일업로드)
	@PostMapping("/uploadpost")
	public String writingprocsee(@ModelAttribute("dto") ShowroomDTO dto) throws Exception{
		
		//저장경로-각자 pc에 맞는 경로로 변경
		String savePath =NaverInform.showroom_path;
		//파일업로드
		MultipartFile[] mf = {dto.getSr_image1(),dto.getSr_image2(),dto.getSr_image3(),dto.getSr_image4(),dto.getSr_image5()};
		String[] originalnames = new String[5];
		String[] beforeexts = new String[5];
		String[] exts = new String[5];
		String[] newnames = new String[5]; 
		File[] servefiles = new File[5];
		for(int i = 0; i < mf.length; i++) {
			if(!mf[i].isEmpty()) {
				originalnames[i] = mf[i].getOriginalFilename(); //.jpg
				beforeexts[i] = originalnames[i].substring(0, originalnames[i].indexOf(".")); 
				exts[i] = originalnames[i].substring(originalnames[i].indexOf(".")); //.jpg
				newnames[i] = beforeexts[i]+"("+UUID.randomUUID().toString()+")"+exts[i];
				servefiles[i] = new File(savePath+newnames[i]);
				System.out.println(savePath+newnames[i]);
				mf[i].transferTo(servefiles[i]);
				dto.setImgNamePath(newnames[0], newnames[1], newnames[2], newnames[3], newnames[4]);
			}
			else {
				if(newnames[1] == null) {
					dto.setImgNamePath(newnames[0],"","","","");
				}
				else if(newnames[2] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],"","","");
				}
				else if(newnames[3] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],newnames[2],"","");
				}
				else if(newnames[4] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],newnames[2],newnames[3],"");
				}
			}
		}
		//mysql insert
		sr_service.insertShowroom(dto);
		return "redirect:/showroom"; 
	}
	
	//게시글 수정 폼
	@RequestMapping("/sr_update")
	public String srUpdate(@ModelAttribute("no") int sr_num, Model model) throws Exception{
		ShowroomDTO onePost = sr_service.onePost(sr_num);
		model.addAttribute("onePost", onePost);
		return "showroom/sr_updateform";
	}
	
	
	//게시글 수정
	@PostMapping("updatepost")
	public String updatePost(@ModelAttribute("dto") ShowroomDTO dto)  throws Exception{
		//저장경로-각자 pc에 맞는 경로로 변경
		String savePath =NaverInform.showroom_path;
		//파일업로드
		MultipartFile[] mf = {dto.getSr_image1(),dto.getSr_image2(),dto.getSr_image3(),dto.getSr_image4(),dto.getSr_image5()};
		String[] originalnames = new String[5];
		String[] beforeexts = new String[5];
		String[] exts = new String[5];
		String[] newnames = new String[5]; 
		File[] servefiles = new File[5];
		for(int i = 0; i < mf.length; i++) {
			if(!mf[i].isEmpty()) {
				originalnames[i] = mf[i].getOriginalFilename(); //.jpg
				beforeexts[i] = originalnames[i].substring(0, originalnames[i].indexOf(".")); 
				exts[i] = originalnames[i].substring(originalnames[i].indexOf(".")); //.jpg
				newnames[i] = beforeexts[i]+"("+UUID.randomUUID().toString()+")"+exts[i];
				servefiles[i] = new File(savePath+newnames[i]);
				System.out.println(savePath+newnames[i]);
				mf[i].transferTo(servefiles[i]);
				dto.setImgNamePath(newnames[0], newnames[1], newnames[2], newnames[3], newnames[4]);
			}
			else {
				if(newnames[1] == null) {
					dto.setImgNamePath(newnames[0],"","","","");
				}
				else if(newnames[2] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],"","","");
				}
				else if(newnames[3] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],newnames[2],"","");
				}
				else if(newnames[4] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],newnames[2],newnames[3],"");
				}
			}
		}
		sr_service.updateShowroom(dto);
		return "redirect:/showroom";
	}
	
	//게시물 삭제
	@RequestMapping("/deletePost")
	public String deletePost(@ModelAttribute("no") int sr_num) throws Exception {
		sr_service.deleteShowroom(sr_num);
		return "redirect:/showroom";
	}
	
	
	
}
