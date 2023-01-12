package productdetail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cart.CartDTO;
import shop.ShopDTO;

@Controller
public class ProductdetailController {

	@Autowired
	@Qualifier("productdetailservice")
	ProductdetailService productdetailservice;
	
	
	@ResponseBody
	@RequestMapping(value="/productdetail", produces = {"application/json;charset=utf-8"})
	public ModelAndView productdetail(int p_id, HttpServletRequest request) {
		ProductdetailDTO productdetail = productdetailservice.getProductdetail(p_id);
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("m_id");
		productdetailservice.viewcountIncrement(p_id); //조회수 증가.
		//컨트롤러 - 결전달(model) 출력 - view
		ModelAndView mv = new ModelAndView();
		mv.addObject("productdetail", productdetail );
		mv.addObject("mid", mid);
		mv.setViewName("productdetail/productdetailmain");
		request.setAttribute("p_sex", productdetail.p_sex);
		return mv;
	}
	

	
}
