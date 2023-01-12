package chatbot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.naverai.NaverService;


@Controller
public class ChatbotController {
	@Autowired
	@Qualifier("chatbotservice")
	NaverService service;

	
	@RequestMapping("/chatbotinput")
	public String input() {
		return "chatbot/chatbotinput";
	}
	
	
	@RequestMapping("/chatbotresult")
	public ModelAndView output(String request, String event) {
		String response = "";
		if(event.equals("답변")) {
			response = ((ChatbotService)service).test(request, "send");
		}
		else {
			response = service.test(request);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("response", response);
		mv.setViewName("chatbot/chatbotoutput");
		return mv;
	}
	
	@RequestMapping("/chatbot")
	public String ajax() {
		return "chatbot/chatbot";
	}
	
	@ResponseBody
	@RequestMapping("/chatbotresultajax")
	public String outputajax(String request, String event) {
		String response = "";
		if(event.equals("답변")) {
			response = ((ChatbotService)service).test(request, "send");
		}
		else {
			response = service.test(request);
		}
		return response;
	}
	//http://localhost:8082/chatbotresultajax?request=&event=aaa

}







