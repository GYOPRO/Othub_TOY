package cart;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import productdetail.ProductdetailDTO;

@Controller
public class CartController {

	@Autowired
	@Qualifier("cartservice")
	CartService cartservice;
	
	@Autowired
	@Qualifier("productdetailservice")
	productdetail.ProductdetailService productdetailservice;
	
	
	CartDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/insertCart" , method = RequestMethod.POST)
	public void inserCart(CartDTO dto, HttpServletRequest request, @RequestParam("p_id") int p_id2, @RequestParam("amount") int amount2) {		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<CartDTO> cartcheck = cartservice.getCart2(m_id);	
		int sum;
		if(cartcheck.size() > 0) {
			for(int i = 0;i < cartcheck.size();i++) {				
				if(cartcheck.get(i).p_id == p_id2) {
					sum = cartcheck.get(i).amount + amount2;
					cartservice.updateCart(p_id2, sum);
				}				
				else {
					cartservice.insertCart(dto);
				}//if
			}//for			
		}//if
		else{cartservice.insertCart(dto);}						
		}
		
	@ResponseBody
	@RequestMapping("/goCart")
	public ModelAndView goCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<CartDTO> cart_list = cartservice.getCart(m_id);
		
		//System.out.println(cart_list.get(0).m_name);
		for(int i = 0; i < cart_list.size(); i++) {	
			cart_list.get(i).p_price = cartservice.getProductdetail(cart_list.get(i).p_id).p_price;
			cart_list.get(i).p_name = cartservice.getProductdetail(cart_list.get(i).p_id).p_name;
			cart_list.get(i).p_brand = cartservice.getProductdetail(cart_list.get(i).p_id).p_brand;
			cart_list.get(i).p_color = cartservice.getProductdetail(cart_list.get(i).p_id).p_color;
			cart_list.get(i).p_thumb = cartservice.getProductdetail(cart_list.get(i).p_id).p_thumb;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("cart_list", cart_list);
		mv.setViewName("/cart/cartmain");
		return mv;
	}
	
	//수량 수정
	
	@RequestMapping("/cartAmount")
	public String cartAmount (HttpServletRequest request) {
		int amount = Integer.parseInt(request.getParameter("newamount"));
		int cart_id = Integer.parseInt(request.getParameter("newcart_id"));
		

		if(amount == 0) {
			cartservice.deleteOne(cart_id);
			System.out.println(15);
		}
		else {cartservice.updateCartAmount(cart_id, amount);}
		return("redirect:/goCart");
	}
	
	@RequestMapping("/deleteFromCart")
	public String delete(HttpServletRequest request) {
		int cart_id = Integer.parseInt(request.getParameter("cart_idForDelete"));
		cartservice.deleteOne(cart_id);
		return("redirect:/goCart");
		
	}
}
