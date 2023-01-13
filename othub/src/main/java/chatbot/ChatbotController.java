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

	@RequestMapping("/chatbot")
	public String ajax() {
		return "chatbot/chatbot";
	}


}







