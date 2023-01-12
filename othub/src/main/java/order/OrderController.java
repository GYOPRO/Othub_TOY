package order;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cart.CartDTO;
import member.MemberService;
import productdetail.ProductdetailDTO;

@Controller
public class OrderController {
	@Autowired
	@Qualifier("orderservice")
	OrderService orderservice;
	
	@Autowired
	@Qualifier("memberservice")
	MemberService memberservice;
	
	OrderDAO dao;

	@ResponseBody
	@RequestMapping(value = "/ordermain" , method = RequestMethod.POST)
	public void insertOrder(OrderDTO dto) {
		orderservice.insertOrder(dto);		
	}
	
	
	//상세페이지에서 주문
	@RequestMapping(value = "/ordermain2")
	public ModelAndView start(HttpServletRequest request) {
		ModelAndView  mv = new ModelAndView();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int order_id = orderservice.getOrderid();
		int p_id = orderservice.getProductid(order_id);
		OrderDTO productdetail = orderservice.getProductdetail(p_id);
		List<OrderDTO> ordersdetail = orderservice.getOrders(order_id);		
		ordersdetail.get(0).p_price = orderservice.getProductdetail(ordersdetail.get(0).p_id).p_price;
		ordersdetail.get(0).p_name = orderservice.getProductdetail(ordersdetail.get(0).p_id).p_name;
		ordersdetail.get(0).p_thumb = orderservice.getProductdetail(ordersdetail.get(0).p_id).p_thumb;
		ordersdetail.get(0).p_brand = orderservice.getProductdetail(ordersdetail.get(0).p_id).p_brand;
		ordersdetail.get(0).p_stock = orderservice.getProductdetail(ordersdetail.get(0).p_id).p_stock;
		ordersdetail.get(0).p_color = orderservice.getProductdetail(ordersdetail.get(0).p_id).p_color;
		OrderDTO memberdetail = orderservice.getMember(m_id);
		int total_price = ordersdetail.get(0).p_price * ordersdetail.get(0).amount;
		mv.setViewName("order/ordermain");
		mv.addObject("ordersdetail", ordersdetail);
		mv.addObject("memberdetail", memberdetail);
		mv.addObject("order_id",order_id);
		mv.addObject("total_price", total_price);
		System.out.println(ordersdetail.get(0).p_name );
		return mv;
	}
	
	//장바구니에서 주문	
		@RequestMapping("/cartToOrder" )
		public ModelAndView cartToOrder (HttpServletRequest request) {
			HttpSession session = request.getSession();
			String m_id = (String)session.getAttribute("m_id");	
			int total_price = 0;
			
			String orderlist2 [] = request.getParameter("ppp").split(",");
			int orderlist [] = new int [orderlist2.length];
			for(int i = 0; i < orderlist.length; i++) {
				orderlist[i] = Integer.parseInt(orderlist2[i]);	
			}
			List<OrderDTO> ordersdetail = new ArrayList<>();

			for(int i = 0; i < orderlist.length; i++) {
				ordersdetail.add(orderservice.cartToOrder(orderlist[i]));
	
			}


			for(int i = 0; i < ordersdetail.size(); i++) {
				ordersdetail.get(i).p_price = orderservice.getProductdetail(ordersdetail.get(i).p_id).p_price;
				ordersdetail.get(i).p_name = orderservice.getProductdetail(ordersdetail.get(i).p_id).p_name;
				ordersdetail.get(i).p_color = orderservice.getProductdetail(ordersdetail.get(i).p_id).p_color;
				ordersdetail.get(i).p_brand = orderservice.getProductdetail(ordersdetail.get(i).p_id).p_brand;
				ordersdetail.get(i).p_thumb = orderservice.getProductdetail(ordersdetail.get(i).p_id).p_thumb;
				ordersdetail.get(i).p_id = ordersdetail.get(i).p_id;
				total_price = total_price + orderservice.getProductdetail(ordersdetail.get(i).p_id).p_price * ordersdetail.get(i).amount;
			}
			OrderDTO memberdetail = orderservice.getMember(m_id);
			for(int i = 0; i < ordersdetail.size(); i++) {
				orderservice.insertOrder(ordersdetail.get(i));
				ordersdetail.get(i).order_id = orderservice.getOrderid2(m_id).get(i).order_id;
			}
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("total_price", total_price);
			mv.addObject("ordersdetail", ordersdetail);
			mv.addObject("memberdetail", memberdetail);
			mv.setViewName("/order/ordermain");
			return mv;			
		}
		
	
	
	//주문완료
	@RequestMapping("/doOrder")
	public String doOrder(HttpServletRequest request) {
		String [] order_id_list = request.getParameterValues("order_ids") ;
		String [] p_id_list = request.getParameterValues("p_ids") ;
		String [] amount_list = request.getParameterValues("amounts");
		for(int i = 0; i < order_id_list.length; i++) {	
		System.out.println(Integer.parseInt(order_id_list[i]));
		 orderservice.doOrder(Integer.parseInt(order_id_list[i]));
		 orderservice.orderComplete(Integer.parseInt(p_id_list[i]));
		 int stock_before = orderservice.getProductdetail(Integer.parseInt(p_id_list[i])).p_stock;
		 int amount = Integer.parseInt(amount_list[i]);
		 int stock_after = stock_before - amount;
		 orderservice.orderStock(Integer.parseInt(p_id_list[i]), stock_after);
		 } 
		//선교 수정
		//등급 수정
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");	
		List<OrderDTO> ordered = orderservice.getOrdered(m_id);
		int total_price = 0;
		int goldCheck = memberservice.couponCheckGold(m_id);
		int vipCheck = memberservice.couponCheckVip(m_id);
		for(int i = 0; i < ordered.size(); i++) {
			total_price = total_price + orderservice.getProductdetail(ordered.get(i).p_id).p_price * ordered.get(i).amount;
		}
		if(total_price >= 300000 && total_price < 1000000) {
			orderservice.updateRoleGold(m_id);
			if(goldCheck == 0) {
				memberservice.insertCouponGold(m_id);
			}
		}
		if(total_price >=1000000) {
			orderservice.updateRoleVip(m_id);
			if(vipCheck == 0) {
				memberservice.insertCouponVip(m_id);
			}
		}
		
		//쿠폰
		
		
		
		
		System.out.println(total_price);
		//
		return "main/index";
	}
	
	//주문취소
	@RequestMapping("/cancleOrder")
	public String cancleOrder(int order_id) {
		orderservice.cancleOrder(order_id);
		return "main/index";
	}
	
	
	
	//주문내역
	@RequestMapping("/ordered")
	public ModelAndView getOrdered (HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<OrderDTO> ordered = orderservice.getOrdered(m_id);
		int total_price = 0;
		for(int i = 0; i < ordered.size(); i++) {
			ordered.get(i).p_price = orderservice.getProductdetail(ordered.get(i).p_id).p_price;
			ordered.get(i).p_name = orderservice.getProductdetail(ordered.get(i).p_id).p_name;
			ordered.get(i).p_color = orderservice.getProductdetail(ordered.get(i).p_id).p_color;
			ordered.get(i).p_brand = orderservice.getProductdetail(ordered.get(i).p_id).p_brand;
			ordered.get(i).p_thumb = orderservice.getProductdetail(ordered.get(i).p_id).p_thumb;
			total_price = total_price + orderservice.getProductdetail(ordered.get(i).p_id).p_price * ordered.get(i).amount;
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("ordered", ordered);
		mv.addObject("total_price", total_price);
		mv.setViewName("/order/orderedlist");
		return mv;
	}
}
