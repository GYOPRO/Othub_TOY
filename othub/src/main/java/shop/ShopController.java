package shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ShopController {

	@Autowired
	@Qualifier("shopservice")
	ShopService service;
	
	
	@RequestMapping("/shop")
	public ModelAndView shop(){
		
		List<ShopDTO> productlist = service.getProduct();
		
		//컨트롤러 - 결전달(model) 출력 - view
		ModelAndView mv = new ModelAndView();
		mv.addObject("productlist", productlist );
		mv.setViewName("shop/shopmain");
		return mv;
	}
	
	
}
