package csanswere;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cs.CSDTO;
import cs.CSService;

@Controller
public class CSAnswereController {
	
	@Inject
	private CSAnswereService service;
	
	@Inject
	private CSService csservice;
	
	// 답변 작성
	@RequestMapping(value = "/answere", method = RequestMethod.POST)
	public String posttWirte(CSAnswereDTO dto, CSDTO csdto) throws Exception {
	    
	    service.answerewrite(dto);
	    csservice.answerecheck(csdto);
	    
	    return "redirect:/csview?cs_seq=" + dto.getCs_seq();
	}
	

}
