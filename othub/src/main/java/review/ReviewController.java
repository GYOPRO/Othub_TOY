package review;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.naverai.NaverInform;

import member.MemberDTO;
import member.MemberService;
import member.PointDTO;
import order.OrderDTO;
import order.OrderService;

@Controller
public class ReviewController {
	
	@Inject
	private ReviewService service;
	
	@Inject
	private OrderService orderservice;
	
	@Inject
	private ReviewPoseService poseservice;
	
	@Inject
	private MemberService mservice;

	
	//review list
	 @RequestMapping(value = "/reviewlist", method = RequestMethod.GET)
	 public ModelAndView getReviewList(Model model, @RequestParam("reviewnum") int reviewnum) throws Exception {
		 
		 // 게시물 총 갯수
		 int reviewcount = service.reviewcount();
		 
		// 한 페이지에 출력할 게시물 갯수
		 int reviewpostNum = 10;
		 
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		 int reviewpageNum = (int)Math.ceil((double)reviewcount/reviewpostNum);
		 
		 // 출력할 게시물
		 int reviewdisplayPost = (reviewnum - 1) * reviewpostNum;
		 
		// 한번에 표시할 페이징 번호의 갯수
		 int reviewpageNum_cnt = 10;

		 // 표시되는 페이지 번호 중 마지막 번호
		 int reviewendPageNum = (int)(Math.ceil((double)reviewnum / (double)reviewpageNum_cnt) * reviewpageNum_cnt);

		 // 표시되는 페이지 번호 중 첫번째 번호
		 int reviewstartPageNum = reviewendPageNum - (reviewpageNum_cnt - 1);
		 
		// 마지막 번호 재계산
		 int reviewendPageNum_tmp = (int)(Math.ceil((double)reviewcount / (double)reviewpageNum_cnt));
		  
		 if(reviewendPageNum > reviewendPageNum_tmp) {
			 reviewendPageNum = reviewendPageNum_tmp;
		 }
		 
		 boolean reviewprev = reviewstartPageNum == 1 ? false : true;
		 boolean reviewnext = reviewendPageNum * reviewpageNum_cnt >= reviewcount ? false : true;
		 
		// 시작 및 끝 번호
		 model.addAttribute("reviewstartPageNum", reviewstartPageNum);
		 model.addAttribute("reviewendPageNum", reviewendPageNum);

		 // 이전 및 다음 
		 model.addAttribute("reviewprev", reviewprev);
		 model.addAttribute("reviewnext", reviewnext);
		 
		// 현재 페이지
		 model.addAttribute("reviewselect", reviewnum);
	  
		 List<ReviewDTO> reviewlist = null;
		  reviewlist = service.reviewlistPage(reviewdisplayPost, reviewpostNum);
		  model.addAttribute("reviewlist", reviewlist);
		  model.addAttribute("reviewpageNum", reviewpageNum); 
	  
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("review/reviewlist");
	  return mv;
	 }
	 
	//my review list
		 @RequestMapping(value = "/myreviewlist", method = RequestMethod.GET)
		 public ModelAndView getMyReivewList(Model model, @RequestParam("reviewnum") int reviewnum, HttpServletRequest request) throws Exception {
			 
			 HttpSession session = request.getSession();
			 String m_id = (String)session.getAttribute("m_id");
			 
			 // 게시물 총 갯수
			 int myreviewcount = service.myreviewcount(m_id);
			 
			// 한 페이지에 출력할 게시물 갯수
			 int reviewpostNum = 10;
			 
			// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
			 int reviewpageNum = (int)Math.ceil((double)myreviewcount/reviewpostNum);
			 
			 // 출력할 게시물
			 int reviewdisplayPost = (reviewnum - 1) * reviewpostNum;
			 
			// 한번에 표시할 페이징 번호의 갯수
			 int reviewpageNum_cnt = 10;

			 // 표시되는 페이지 번호 중 마지막 번호
			 int reviewendPageNum = (int)(Math.ceil((double)reviewnum / (double)reviewpageNum_cnt) * reviewpageNum_cnt);

			 // 표시되는 페이지 번호 중 첫번째 번호
			 int reviewstartPageNum = reviewendPageNum - (reviewpageNum_cnt - 1);
			 
			// 마지막 번호 재계산
			 int reviewendPageNum_tmp = (int)(Math.ceil((double)myreviewcount / (double)reviewpageNum_cnt));
			  
			 if(reviewendPageNum > reviewendPageNum_tmp) {
				 reviewendPageNum = reviewendPageNum_tmp;
			 }
			 
			 boolean reviewprev = reviewstartPageNum == 1 ? false : true;
			 boolean reviewnext = reviewendPageNum * reviewpageNum_cnt >= myreviewcount ? false : true;
			 
			// 시작 및 끝 번호
			 model.addAttribute("reviewstartPageNum", reviewstartPageNum);
			 model.addAttribute("reviewendPageNum", reviewendPageNum);

			 // 이전 및 다음 
			 model.addAttribute("reviewprev", reviewprev);
			 model.addAttribute("reviewnext", reviewnext);
			 
			// 현재 페이지
			 model.addAttribute("reviewselect", reviewnum);
			 
		  
		  List<ReviewDTO> reviewlist = null;
		  reviewlist = service.reviewlistPage(reviewdisplayPost, reviewpostNum);
		  model.addAttribute("reviewlist", reviewlist);
		  model.addAttribute("reviewpageNum", reviewpageNum);   
			 
		  
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("m_id", m_id);
		  mv.setViewName("review/myreviewlist");
		  return mv;
		 }
	
	// 게시물 작성
		 @RequestMapping(value = "/reviewwrite", method = RequestMethod.GET)
		 public ModelAndView getReviewWirte(@RequestParam("order_id") int order_id, String image, Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			String m_id = (String)session.getAttribute("m_id");
			
			int p_id = orderservice.getProductid(order_id);
			int order = orderservice.getOrderid3(order_id);
			String p_name = service.getname(p_id);
			
			
			List<OrderDTO> ordered = orderservice.getOrdered(m_id);
			model.addAttribute("getOrdered", ordered);
			
			ReviewDTO dto = service.getOrder(order_id);
			model.addAttribute("getOrder", dto); 

			
			ModelAndView mv = new ModelAndView();

			mv.addObject("m_id", m_id);
			mv.addObject("order", order);
			mv.addObject("ordered",ordered);
			mv.addObject("p_id",p_id);
			mv.addObject("p_name", p_name);
			mv.setViewName("review/reviewwrite");
			return mv;

		 }
		 
		//게시물 작성 
		 @RequestMapping(value = "/reviewwrite", method = RequestMethod.POST)
		 public ModelAndView postReviewWrite(int order_id, String image, ReviewDTO dto, OrderDTO odto, MultipartFile uploadfile, HttpServletRequest request) throws Exception {
			
			 //사진등록
			 String savePath ="C:\\git\\othub_project_2022\\othub\\src\\main\\resources\\static\\images\\review\\review_pic\\\\";
			 
			 MultipartFile review_pic = dto.getReview_pic();
				if(!review_pic.isEmpty()) {
					UUID uuid = UUID.randomUUID();
					String originalname = review_pic.getOriginalFilename();
					String beforeext = originalname.substring(0, originalname.indexOf("."));
					String ext = originalname.substring(originalname.indexOf("."));
					String newname = uuid.toString()+"_"+beforeext+ext;
					File servefile = new File(savePath+newname);
					System.out.println(savePath+newname);
					review_pic.transferTo(servefile);
					dto.setReview_pic_name(newname);
				}
			
			 
			service.reviewwrite(dto);
			orderservice.reviewcheck(odto);
			
			
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("redirect:/ordered");
			return mv;
			
		 }
		 
		// 게시물 조회
		 @RequestMapping(value = "/reviewview", method = RequestMethod.GET)
		 public ModelAndView getReviewView(@RequestParam("order_id") int order_id, ReviewDTO rdto, String image, Model model, HttpServletRequest request) throws Exception {
			
			//m_id값 불러오기
			HttpSession session = request.getSession();
			String review_writer = (String)session.getAttribute("m_id");
			
			ReviewDTO dto = service.reviewview(order_id);
			
			model.addAttribute("reviewview", dto);
			
			int order = orderservice.getOrderid3(order_id);
			
			
			//ai 입력
			File f = new File(NaverInform.j_path);
			String [] filelist = f.list();

			 
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("order", order);
			mv.addObject("filelist", filelist);
			mv.addObject("review_writer", review_writer);
			mv.setViewName("review/reviewview");
			return mv;
				 
		 }
		 
		// 게시물 조회
				 @RequestMapping(value = "/reviewview", method = RequestMethod.POST)
				 public ModelAndView postReviewView(@RequestParam("order_id") int order_id, ReviewDTO rdto, String image, Model model, HttpServletRequest request) throws Exception {
					
					//m_id값 불러오기
					HttpSession session = request.getSession();
					String review_writer = (String)session.getAttribute("m_id");
					
					ReviewDTO dto = service.reviewview(order_id);
					
					model.addAttribute("reviewview", dto);
					
					int order = orderservice.getOrderid3(order_id);
					
					service.pointcheck(rdto);
					
					//ai 입력
					File f = new File(NaverInform.j_path);
					String [] filelist = f.list();

					 
					ModelAndView mv = new ModelAndView();
					
					mv.addObject("order", order);
					mv.addObject("filelist", filelist);
					mv.addObject("review_writer", review_writer);
					mv.setViewName("review/reviewview");
					return mv;
						 
				 }
		 
		//포인트 확인
		 @RequestMapping(value = "/pointcheck", method = RequestMethod.GET)
			public ModelAndView getpointcheck(String image, ReviewDTO dto, HttpServletRequest request, Model model) throws Exception{

				String jsonresult = poseservice.test(image);
				model.addAttribute("reviewview", dto);
				
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("poseresult", jsonresult);
				mv.setViewName("review/pointcheck");
				return mv;
			}
		 
		//포인트 확인
		 @RequestMapping(value = "/pointcheck", method = RequestMethod.POST)
			public ModelAndView postpointcheck(String image, ReviewDTO dto, PointDTO pdto, HttpServletRequest request, Model model) throws Exception{				
				
				model.addAttribute("reviewview", dto);
				
				ModelAndView mv = new ModelAndView();
				
				mv.setViewName("review/pointcheck");
				
				return mv;
			}
		 
		 
		 //포인트 적립
		 @RequestMapping(value = "/pointresult", method = RequestMethod.GET)
			public ModelAndView getposeresult(String image, ReviewDTO dto, HttpServletRequest request, Model model) throws Exception{
			 
			//m_id값 불러오기
				HttpSession session = request.getSession();
				String m_id = (String)session.getAttribute("m_id");

			 
				String jsonresult = poseservice.test(image);
				model.addAttribute("reviewview", dto);
				
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("m_id", m_id);
				mv.addObject("poseresult", jsonresult);
				mv.setViewName("review/pointresult");
				return mv;
			}
		 
		//포인트 적립
		 @RequestMapping(value = "/pointresult", method = RequestMethod.POST)
			public ModelAndView postposeresult(String image, ReviewDTO dto, PointDTO pdto, HttpServletRequest request, Model model) throws Exception{
			 	
			 	//m_id값 불러오기
				HttpSession session = request.getSession();
				String m_id = (String)session.getAttribute("m_id");
				
				
				model.addAttribute("reviewview", dto);
			 
				mservice.updatePoint(pdto);
				
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("m_id", m_id);
				mv.setViewName("redirect:/mypage");
				
				return mv;
			}
		 
		
		// 게시물 수정
		 @RequestMapping(value = "/reviewmodify", method = RequestMethod.GET)
		 public ModelAndView getReviewModify(@RequestParam("order_id") int order_id, Model model, MemberDTO mdto, HttpServletRequest request) throws Exception {
			 
			 
			HttpSession session = request.getSession();
			String m_id = (String)session.getAttribute("m_id");
			
			int p_id = orderservice.getProductid(order_id);
			int order = orderservice.getOrderid3(order_id);
			String p_name = service.getname(p_id);
			
			List<OrderDTO> ordered = orderservice.getOrdered(m_id);
			model.addAttribute("getOrdered", ordered);
			 
			ReviewDTO dto = service.reviewview(order_id);
			model.addAttribute("reviewview", dto);
			 
			ModelAndView mv = new ModelAndView();
			mv.addObject("m_id", m_id);
			mv.addObject("order", order);
			mv.addObject("ordered",ordered);
			mv.addObject("p_id",p_id);
			mv.addObject("p_name", p_name);
			mv.setViewName("review/reviewmodify");
			return mv;

		 }
		 
		 
		// 게시물 수정
			@RequestMapping(value = "/reviewmodify", method = RequestMethod.POST)
			public ModelAndView postReviewModify(ReviewDTO dto, MultipartFile uploadfile) throws Exception {
				
				String savePath = "C:\\Users\\지호\\git\\othub\\othub\\src\\main\\resources\\static\\images\\review\\review_pic\\";
				 
				 MultipartFile review_pic = dto.getReview_pic();
					if(!review_pic.isEmpty()) {
						UUID uuid = UUID.randomUUID();
						String originalname = review_pic.getOriginalFilename();
						String beforeext = originalname.substring(0, originalname.indexOf("."));
						String ext = originalname.substring(originalname.indexOf("."));
						String newname = uuid.toString()+"_"+beforeext+ext;
						File servefile = new File(savePath+newname);
						System.out.println(savePath+newname);
						review_pic.transferTo(servefile);
						dto.setReview_pic_name(newname);
						
					}

				service.reviewmodify(dto);
					 
				ModelAndView mv = new ModelAndView();
				mv.setViewName("redirect:/reviewview?order_id=" + dto.getOrder_id());
				return mv;
				
			}
			
			// 게시물 삭제
			@RequestMapping(value = "/reviewdelete", method = RequestMethod.GET)
			public ModelAndView getReivewDelete(@RequestParam("order_id") int order_id) throws Exception {
			  
				 service.reviewdelete(order_id);
			
				 ModelAndView mv = new ModelAndView();
				 mv.setViewName("redirect:/reviewlist");
				 return mv;
			}

}
