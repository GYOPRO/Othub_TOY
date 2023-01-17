package product;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	@Inject
	ProductService productService;
	
	
	 private static final Logger logger =
	  LoggerFactory.getLogger(ProductController.class);
	  
	
	 //전체
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public ModelAndView getList(@RequestParam("c") int category_id, Model model) throws Exception {
	  logger.info("get llist");
	  
	  List<ProductDTO> list = null;
		list = productService.list(category_id);
	 
	  model.addAttribute("list", list);
	  
	  ModelAndView mv = new ModelAndView();
		mv.setViewName("product/list");
		return mv;
	  
	 }
	 
	 
	 //좋아요순
	 @RequestMapping(value = "/listlike", method = RequestMethod.GET)
	 public ModelAndView getListLike(@RequestParam("c") int category_id, Model model) throws Exception {
	  logger.info("get llike");
	  
	  List<ProductDTO> like = null;
		like = productService.orderByLike(category_id);
	 
	  model.addAttribute("like", like);
	  
	    ModelAndView mv = new ModelAndView();
		mv.setViewName("product/listlike");
		return mv;
	 }
	 
	 //최신순
		 @RequestMapping(value = "/listrecent", method = RequestMethod.GET)
		 public ModelAndView getListRecent(@RequestParam("c") int category_id, Model model) throws Exception {
		  logger.info("get lrecent");
		  
		  List<ProductDTO> recent = null;
		  recent = productService.orderByRecent(category_id);
		 
		  model.addAttribute("recent", recent);
		  
		  ModelAndView mv = new ModelAndView();
			mv.setViewName("product/listrecent");
			return mv;
		 }
		 
		//추천순
		 @RequestMapping(value = "/listrecom", method = RequestMethod.GET)
		 public ModelAndView getListRecom(@RequestParam("c") int category_id, Model model) throws Exception {
		  logger.info("get lrecom");
		  
		  List<ProductDTO> recom = null;
		  recom = productService.orderByRecom(category_id);
		 
		  model.addAttribute("recom", recom);
		  
		  ModelAndView mv = new ModelAndView();
			mv.setViewName("product/listrecom");
			return mv;
		 }
	 
	 //검색기능
		 @RequestMapping(value = "/searchproduct", method = RequestMethod.GET)
		 public ModelAndView searchproduct(String searchField,String searchText, Model model) {
			 
			  List<ProductDTO> list = new ArrayList<>();
				
				
				if(searchField.equals("p_name")) {
					list = productService.searchproduct(searchText);
				}
				if(searchField.equals("p_brand")) {
					list = productService.searchbrand(searchText);
				}
				System.out.println(searchField);
				System.out.println(searchText);
				System.out.println(list);
			  model.addAttribute("recom", list);

			  	ModelAndView mv = new ModelAndView();
				mv.setViewName("product/searchproduct");
				return mv;
		 }
	 
	}
	
		
		


