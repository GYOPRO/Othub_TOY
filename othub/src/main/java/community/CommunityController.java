package community;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import comment.CommentDTO;
import comment.CommentService;
import member.MemberService;
import product.ProductDTO;
import product.ProductServiceImpl;

@Controller
public class CommunityController {
	@Autowired
	@Qualifier("commuservice")
	CommunityService commuserive;
	
	@Autowired
	@Qualifier("memberservice")
	MemberService memberservice;
	
	@Autowired
	@Qualifier("commentservice")
	CommentService commentservice;
	
	
	@Autowired
	@Qualifier("productservice")
	ProductServiceImpl productservice;
	
	
	//전체 게시물 조회(페이징,조회순)
	@GetMapping("/community")
	public ModelAndView communityListPaging(@RequestParam(value="page",defaultValue = "1") int page,HttpServletRequest request) {
		int totalPage = commuserive.countCommunity(); //전체 게시물 수 조회
		List<CommunityDTO> communityListPaging = commuserive.limitCommunity(page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("totalPage", totalPage);
		mv.addObject("boardlist",communityListPaging);
		mv.setViewName("community/main");
		return mv;
	}
	
	//전체 게시물 조회(페이징,인기순)
	@GetMapping("/communitylike")
	public ModelAndView communityListPaginglike(@RequestParam(value="page",defaultValue = "1") int page) {
		int totalPage = commuserive.countCommunity(); //전체 게시물 수 조회
		List<CommunityDTO> communityListPaging = commuserive.likeCommunity(page);
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalPage", totalPage);
		mv.addObject("boardlist",communityListPaging);
		mv.setViewName("community/main2");
		return mv;
	}
	
	//내 게시물 조회
	@GetMapping("/mycommunity")
	public ModelAndView mycommunityListPaging(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String s_writer = (String)session.getAttribute("m_id");
		List<CommunityDTO> communityListPaging = commuserive.myCommunity(s_writer);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardlist",communityListPaging);
		mv.setViewName("community/myboard");
		return mv;
	}
	
	//내 게시물 조회
	@GetMapping("/mylikecommunity")
	public ModelAndView mylikecommunityListPaging(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		
		List<CommunityDTO> communityListPaging = commuserive.myLikeCommunity(m_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardlist",communityListPaging);
		mv.setViewName("community/mylike");
		return mv;
	}
	//내가 쓴 댓글 조회
	@RequestMapping("/mycomment")
	public ModelAndView mycomment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		CommentDTO dto = new CommentDTO();
		List<CommentDTO> comunityList = commuserive.mycomment(m_id);
		ModelAndView mv = new ModelAndView();

		mv.addObject("boardlist",comunityList);
		mv.setViewName("member/mycomment");
		return mv;
		
		
	}
	
	
	//글쓰기
	@GetMapping("/writingcommunity")
	public ModelAndView wriringCommunity() {
		int totalboard = commuserive.amountCommunity()+1; //전체 게시물 수 조회
		System.out.println(totalboard);
		List<ProductDTO> productTagList1 = commuserive.productTag1();
		ModelAndView mv = new ModelAndView();

		mv.addObject("taglist1",productTagList1);
		mv.addObject("totalboard", totalboard);
		mv.setViewName("community/srwritingform");
		return mv;
	}
	
	//글 등록(upload)
	@PostMapping("/writingcommunity")
	public String uploadprocess(@ModelAttribute("dto") CommunityDTO dto,@RequestParam(value="page",defaultValue = "1") int page,Model model)
	throws IOException {
	 // dto 같은 이름 변수에 파라미터 매핑되어있다
	// file1, file2 의 이름과 내용 서버 c:\\upload 폴더에 저장 	
	// 파일내용을 복사하여 c:\\upload 폴더에 파일명 붙여넣기
		
		String savePath =com.example.naverai.NaverInform.path;
		
		//style 2번 이미지
		MultipartFile mf1 = dto.getS_image1();
		if(!mf1.isEmpty()) {
			String originalname1 = mf1.getOriginalFilename(); //ex) a.txt
			String beforeext1 = originalname1.substring(0, originalname1.indexOf(".")); //a
			String ext1 = originalname1.substring(originalname1.indexOf(".")); // .txt
			String newname1 = beforeext1+ext1;
			File servefile1 = new File(savePath+newname1); // a(012334434).txt
			System.out.println(savePath+newname1);
			mf1.transferTo(servefile1);
			dto.setImagename1(newname1);//서버 저장이름 
		}
		//style 2번 이미지
		MultipartFile mf2 = dto.getS_image2();
		if(!mf2.isEmpty()) {
			String originalname2 = mf2.getOriginalFilename(); //ex) a.txt
			String beforeext2 = originalname2.substring(0, originalname2.indexOf(".")); //a
			String ext2 = originalname2.substring(originalname2.indexOf(".")); // .txt
			String newname2 = beforeext2+ext2;
			File servefile2 = new File(savePath+newname2); // a(012334434).txt
			System.out.println(savePath+newname2);
			mf2.transferTo(servefile2);
			dto.setImagename2(newname2);//서버 저장이름 
		}else {
			dto.setImagename2("");
		}
		//style 3번 이미지
		MultipartFile mf3 = dto.getS_image3();
		if(!mf3.isEmpty()) {
			String originalname3 = mf3.getOriginalFilename(); //ex) a.txt
			String beforeext3 = originalname3.substring(0, originalname3.indexOf(".")); //a
			String ext3 = originalname3.substring(originalname3.indexOf(".")); // .txt
			String newname3 = beforeext3+ext3;
			File servefile3 = new File(savePath+newname3); // a(012334434).txt
			System.out.println(savePath+newname3);
			mf3.transferTo(servefile3);
			dto.setImagename3(newname3);//서버 저장이름 
		}else {
			dto.setImagename3("");
		}
	
		int result = commuserive.insertCommunity(dto);
		System.out.println(result);

		int totalPage = commuserive.countCommunity(); //전체 게시물 수 조회
		List<CommunityDTO> communityListPaging = commuserive.limitCommunity(page); //List 다시 받아옴
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("boardlist",communityListPaging);	
		return "redirect:/community";

	}
	
	
	//게시물 상세보기
	@GetMapping("/oneCommunity")
	public ModelAndView oneCommunity(@RequestParam(value="s_seq") int s_seq,HttpServletRequest request, String image) {
		//좋아요 확인
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int result = commuserive.likeCheck_main(s_seq,m_id);
		String p_name1,p_name2,p_name3,p_name4;
		
		//게시물 불러오기
		CommunityDTO oneCommu = commuserive.oneCommunity(s_seq);

		//상품 태그 불러오기
		if(oneCommu.p_name1!=null) {
		List<ProductDTO> tag1 = commuserive.selectProductTag1(oneCommu.p_name1);
		p_name1 = oneCommu.p_name1;
		mv.addObject("p_name1",p_name1);
		mv.addObject("tag1",tag1);
		}if(oneCommu.p_name2 != null){
		List<ProductDTO> tag2 = commuserive.selectProductTag2(oneCommu.p_name2);
		p_name2 = oneCommu.p_name2;
		mv.addObject("tag2",tag2);
		mv.addObject("p_name2",p_name2);
		}if(oneCommu.p_name3 != null){
		List<ProductDTO> tag3 = commuserive.selectProductTag3(oneCommu.p_name3);
		p_name3 = oneCommu.p_name3;
		mv.addObject("tag3",tag3);
		mv.addObject("p_name3",p_name3);
		}if(oneCommu.p_name4 != null){
		List<ProductDTO> tag4 = commuserive.selectProductTag4(oneCommu.p_name4);
		p_name4 = oneCommu.p_name4;
		mv.addObject("tag4",tag4);
		mv.addObject("p_name4",p_name4);
		}
		
		//ai pose

		
		String writer = oneCommu.getS_writer();
		if(!oneCommu.imagename2.equals("")) {
		String image2 = oneCommu.getImagename2();
		mv.addObject("image2",image2);
		System.out.println("a");
		System.out.println(oneCommu.imagename2);
		}
		if(!oneCommu.imagename3.equals("")) {
		String image3 = oneCommu.getImagename3();
		mv.addObject("image3",image3);
		System.out.println("b");
		System.out.println(oneCommu.getImagename2());
		}
		
		mv.addObject("oneCommu",oneCommu);
		mv.addObject("commuSeq",s_seq);
		mv.addObject("writer",writer);

		mv.addObject("result",result);
		commuserive.viewCount(s_seq);
		mv.setViewName("community/detail");

		return mv;
		
	}
	
	//게시물 수정 폼
	@GetMapping("/updatecommuform")
	public ModelAndView updateform(@RequestParam(value="s_seq") int s_seq,HttpServletRequest request) {
		CommunityDTO oneCommu = commuserive.oneCommunity(s_seq);
		ModelAndView mv = new ModelAndView();
		mv.addObject("oneCommu",oneCommu);
		mv.setViewName("community/updateform");
		return mv;	
	}
	//게시물 수정
	@PostMapping("/updatecommu")
	public String editBoardProcess(CommunityDTO dto) {
		int result = commuserive.updateWriting(dto);
		return "redirect:/community";
	}
	
	//게시물 삭제
	@GetMapping("deleteCommunity") //컨트롤러에서 커뮤니티메인으로 total페이지를 다시 넘겨줘야함
	public ModelAndView deleteCommunity(@RequestParam(value="s_seq") int s_seq,Model model,@RequestParam(value="page",defaultValue = "1") int page) {
		commuserive.deleteCommunity(s_seq);
		int totalPage = commuserive.countCommunity(); //전체 게시물 수 조회
		List<CommunityDTO> communityListPaging = commuserive.limitCommunity(page);
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalPage", totalPage);
		mv.addObject("boardlist",communityListPaging);
		mv.setViewName("community/main");
		return mv;
	}

	//추천 좋아요
	@ResponseBody
	@PostMapping(value = "boardlike",  produces = { "application/json;charset=utf-8" })
	public String updateLike(int s_seq, String m_id) throws Exception{
		int likeCheck = commuserive.likeCheck(s_seq, m_id);
		if(likeCheck == 0) {
			commuserive.insertLike(s_seq,m_id);
			commuserive.updateLike(s_seq);
			commuserive.updateLikeCheck(s_seq,m_id);
		}else if(likeCheck ==1) {
			commuserive.updateLikeCheckCancel(s_seq, m_id);
			commuserive.updateLikeCancel(s_seq);
			commuserive.deleteLike(s_seq, m_id);
		}
		int likeNum = commuserive.likeCount(s_seq);
		System.out.println(likeNum);
		return "{\"result\" : \"" + likeCheck + "\", \"result2\" : \"" + likeNum + "\" }";
	}
	
	
	
		//검색기능
		@RequestMapping("searchboard")
		public ModelAndView searchboard(String searchField, String searchText) {
			List<CommunityDTO> communityListPaging = new ArrayList<>();
			if(searchField.equals("s_title")) {
				communityListPaging = commuserive.searchtitle(searchText);
			}
			if(searchField.equals("s_writer")) {
				communityListPaging = commuserive.searchwriter(searchText);
			}
			if(searchField.equals("s_contents")) {
				communityListPaging = commuserive.searchcontents(searchText);
			}
			ModelAndView mv = new ModelAndView();
			System.out.println(searchField);
			System.out.println(searchText);
			System.out.println(communityListPaging);
			mv.addObject("boardlist",communityListPaging);
			mv.setViewName("community/serachboard");
			return mv;
		}
		//게시물 신고하기

	
}