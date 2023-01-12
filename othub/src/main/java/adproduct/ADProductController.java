package adproduct;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.MemberDTO;
import productdetail.ProductdetailService;

@Controller
public class ADProductController {
	
	@Inject
	private ADProductService service;
	
	@Autowired
	@Qualifier("productdetailservice")
	ProductdetailService productdetailservice;
	
	// 상품 입력
	 @RequestMapping(value = "/insertproduct", method = RequestMethod.GET)
	 public ModelAndView getInsertproduct(ADProductDTO dto, Model model) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adproduct/insertproduct");
		return mv;
	    
	 }
	 
	 //게시물 작성
	 @RequestMapping(value = "/insertproduct", method = RequestMethod.POST)
	 public ModelAndView postInsertproduct(ADProductDTO dto, MultipartFile uploadfile) throws Exception {
		 
		 String savePath ="C:\\git\\othub_project_2022\\othub\\src\\main\\resources\\static\\images\\";
		 
		 MultipartFile p_thumb = dto.getP_thumb();
			if(!p_thumb.isEmpty()) {
				String originalname = p_thumb.getOriginalFilename();
				String beforeext = originalname.substring(0, originalname.indexOf("."));
				String ext = originalname.substring(originalname.indexOf("."));
				String newname = "product/new/" + beforeext+ext;
				File servefile = new File(savePath+newname);
				System.out.println(savePath+newname);
				p_thumb.transferTo(servefile);
				dto.setP_thumb_name(newname);
			}
			
			 MultipartFile p_image1 = dto.getP_image1();
				if(!p_image1.isEmpty()) {
					String originalname = p_image1.getOriginalFilename();
					String beforeext = originalname.substring(0, originalname.indexOf("."));
					String ext = originalname.substring(originalname.indexOf("."));
					String newname = "product/new/" + beforeext+ext;
					File servefile = new File(savePath+newname);
					System.out.println(savePath+newname);
					p_image1.transferTo(servefile);
					dto.setP_image1_name(newname);
				}else {
					dto.setP_image1_name("");
				}
				
				 MultipartFile p_image2 = dto.getP_image2();
					if(!p_image2.isEmpty()) {
						String originalname = p_image2.getOriginalFilename();
						String beforeext = originalname.substring(0, originalname.indexOf("."));
						String ext = originalname.substring(originalname.indexOf("."));
						String newname = "product/new/" + beforeext+ext;
						File servefile = new File(savePath+newname);
						System.out.println(savePath+newname);
						p_image2.transferTo(servefile);
						dto.setP_image2_name(newname);
					}else {
						dto.setP_image2_name("");
					}
					
					 MultipartFile p_image3 = dto.getP_image3();
						if(!p_image3.isEmpty()) {
							String originalname = p_image3.getOriginalFilename();
							String beforeext = originalname.substring(0, originalname.indexOf("."));
							String ext = originalname.substring(originalname.indexOf("."));
							String newname = "product/new/" + beforeext+ext;
							File servefile = new File(savePath+newname);
							System.out.println(savePath+newname);
							p_image3.transferTo(servefile);
							dto.setP_image3_name(newname);
						}else {
							dto.setP_image3_name("");
						}	
						
						 MultipartFile p_contents = dto.getP_contents();
							if(!p_contents.isEmpty()) {
								String originalname = p_contents.getOriginalFilename();
								String beforeext = originalname.substring(0, originalname.indexOf("."));
								String ext = originalname.substring(originalname.indexOf("."));
								String newname = "product/new/" + beforeext+ext;
								File servefile = new File(savePath+newname);
								System.out.println(savePath+newname);
								p_contents.transferTo(servefile);
								dto.setP_contents_name(newname);
							}else {
								dto.setP_contents_name("");
							}
			
		service.insertproduct(dto);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adplistPage?adpnum=1");
		return mv;
		
	 }
	 
		// 상품 조회 테스트
	 @RequestMapping(value = "/insertproductcheck", method = RequestMethod.GET)
	 public ModelAndView getInsertproductcheck(@RequestParam("p_id") int p_id, Model model) throws Exception {
		
		ADProductDTO dto = service.getproduct(p_id);
		
		model.addAttribute("getproduct", dto);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adproduct/insertproductcheck");
		return mv;
			 
	 }
	 
		//게시물 리스트 + 페이징
	 @RequestMapping(value = "/adplistPage", method = RequestMethod.GET)
	 public ModelAndView getAdplistPage(Model model, @RequestParam("adpnum") int adpnum) throws Exception {
		 
		 
		 // 게시물 총 갯수
		 int adpcount = service.adpcount();
		 
		// 한 페이지에 출력할 게시물 갯수
		 int adppostNum = 10;
		 
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		 int adppageNum = (int)Math.ceil((double)adpcount/adppostNum);
		 
		 // 출력할 게시물
		 int adpdisplayPost = (adpnum - 1) * adppostNum;
		 
		// 한번에 표시할 페이징 번호의 갯수
		 int adppageNum_cnt = 10;

		 // 표시되는 페이지 번호 중 마지막 번호
		 int adpendPageNum = (int)(Math.ceil((double)adpnum / (double)adppageNum_cnt) * adppageNum_cnt);

		 // 표시되는 페이지 번호 중 첫번째 번호
		 int adpstartPageNum = adpendPageNum - (adppageNum_cnt - 1);
		 
		// 마지막 번호 재계산
		 int adpendPageNum_tmp = (int)(Math.ceil((double)adpcount / (double)adppageNum_cnt));
		  
		 if(adpendPageNum > adpendPageNum_tmp) {
			 adpendPageNum = adpendPageNum_tmp;
		 }
		 
		 boolean adpprev = adpstartPageNum == 1 ? false : true;
		 boolean adpnext = adpendPageNum * adppageNum_cnt >= adpcount ? false : true;
		 
		// 시작 및 끝 번호
		 model.addAttribute("csstartPageNum", adpstartPageNum);
		 model.addAttribute("csendPageNum", adpendPageNum);

		 // 이전 및 다음 
		 model.addAttribute("adpprev", adpprev);
		 model.addAttribute("adpnext", adpnext);
		 
		// 현재 페이지
		 model.addAttribute("adpselect", adpnum);
		 
		 List<ADProductDTO> adplist = null; 
		 adplist = service.adplistPage(adpdisplayPost, adppostNum);
		 model.addAttribute("adplist", adplist);   
		 model.addAttribute("adppageNum", adppageNum);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adproduct/adplistPage");
		return mv;
	   
	 }
	 
		// 게시물 수정
	 @RequestMapping(value = "/adpmodify", method = RequestMethod.GET)
	 public ModelAndView getCSModify(@RequestParam("p_id") int p_id, Model model, MemberDTO mdto, HttpServletRequest request) throws Exception {
		 
		ADProductDTO dto = service.getproduct(p_id);
			
		model.addAttribute("getproduct", dto);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adproduct/modifyproduct");
		return mv;

	 }
	 
	// 게시물 수정
	@RequestMapping(value = "/adpmodify", method = RequestMethod.POST)
	public ModelAndView postAdpModify(ADProductDTO dto, MultipartFile uploadfile) throws Exception {
		
		 String savePath ="C:\\Users\\지호\\git\\othub\\othub\\src\\main\\resources\\static\\images\\";
		 
		 MultipartFile p_thumb = dto.getP_thumb();
			if(!p_thumb.isEmpty()) {
				String originalname = p_thumb.getOriginalFilename();
				String beforeext = originalname.substring(0, originalname.indexOf("."));
				String ext = originalname.substring(originalname.indexOf("."));
				String newname = "product/new/" + beforeext+ext;
				File servefile = new File(savePath+newname);
				System.out.println(savePath+newname);
				p_thumb.transferTo(servefile);
				dto.setP_thumb_name(newname);
			}
			
			 MultipartFile p_image1 = dto.getP_image1();
				if(!p_image1.isEmpty()) {
					String originalname = p_image1.getOriginalFilename();
					String beforeext = originalname.substring(0, originalname.indexOf("."));
					String ext = originalname.substring(originalname.indexOf("."));
					String newname = "product/new/" + beforeext+ext;
					File servefile = new File(savePath+newname);
					System.out.println(savePath+newname);
					p_image1.transferTo(servefile);
					dto.setP_image1_name(newname);
				}else {
					dto.setP_image1_name("");
				}
				
				 MultipartFile p_image2 = dto.getP_image2();
					if(!p_image2.isEmpty()) {
						String originalname = p_image2.getOriginalFilename();
						String beforeext = originalname.substring(0, originalname.indexOf("."));
						String ext = originalname.substring(originalname.indexOf("."));
						String newname = "product/new/" + beforeext+ext;
						File servefile = new File(savePath+newname);
						System.out.println(savePath+newname);
						p_image2.transferTo(servefile);
						dto.setP_image2_name(newname);
					}else {
						dto.setP_image2_name("");
					}
					
					 MultipartFile p_image3 = dto.getP_image3();
						if(!p_image3.isEmpty()) {
							String originalname = p_image3.getOriginalFilename();
							String beforeext = originalname.substring(0, originalname.indexOf("."));
							String ext = originalname.substring(originalname.indexOf("."));
							String newname = "product/new/" + beforeext+ext;
							File servefile = new File(savePath+newname);
							System.out.println(savePath+newname);
							p_image3.transferTo(servefile);
							dto.setP_image3_name(newname);
						}else {
							dto.setP_image3_name("");
						}	
						
						 MultipartFile p_contents = dto.getP_contents();
							if(!p_contents.isEmpty()) {
								String originalname = p_contents.getOriginalFilename();
								String beforeext = originalname.substring(0, originalname.indexOf("."));
								String ext = originalname.substring(originalname.indexOf("."));
								String newname = "product/new/" + beforeext+ext;
								File servefile = new File(savePath+newname);
								System.out.println(savePath+newname);
								p_contents.transferTo(servefile);
								dto.setP_contents_name(newname);
							}else {
								dto.setP_contents_name("");
							}
		 
		
		service.adpmodify(dto);
			 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/insertproductcheck?p_id=" + dto.getP_id());
		return mv;
		
	}
	 
	 //상품 데이터 최종 입력
	 @RequestMapping(value = "/insertproductcheck", method = RequestMethod.POST)
	 public ModelAndView postInsertproductc(@RequestParam("p_id") int p_id, ADProductDTO dto, ProductDTO2 dto2, MultipartFile uploadfile) throws Exception {
		 
		service.insertdata(dto2);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adplistPage?adpnum=1");
		return mv;
		
	 }
	 
		// 상품 삭제
		@RequestMapping(value = "/adpdelete", method = RequestMethod.GET)
		public ModelAndView getAdpDelete(@RequestParam("p_id") int p_id) throws Exception {
		  
			 service.adpdelete(p_id);
		
			 ModelAndView mv = new ModelAndView();
			 mv.setViewName("redirect:/adplistPage?adpnum=1");
			 return mv;
		}

}
