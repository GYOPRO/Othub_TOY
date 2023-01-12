package comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("reply")
public class CommentController {
	

	@Autowired
	CommentService commentservice;
	
	@PostMapping(value = "/replyRegist", produces = { "application/json;charset=utf-8" })
	public int replyRegist(@RequestBody CommentDTO dto) {

		return commentservice.registComment(dto);
	}
	
	@ResponseBody
	@GetMapping("/getList/{b_seq}/{pageNum}")
	public List<CommentDTO> getList(@PathVariable("b_seq") int b_seq, @PathVariable("pageNum") int pageNum){
		List<CommentDTO> CommentList = commentservice.getList(b_seq);
		return CommentList;
	}
	
	@ResponseBody
	@GetMapping("/commentCount/{b_seq}/{pageNum}")
	public int commentCount(@PathVariable("b_seq") int b_seq){
		int result = commentservice.commentCount(b_seq);
		return result;
	}
	

	
}
