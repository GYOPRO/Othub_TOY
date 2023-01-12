package report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import comment.CommentDTO;
import community.CommunityDAO;
import member.couponDTO;
import product.ProductDTO;

@Service("reportservice")
public class ReportService {
	
	@Autowired
	@Qualifier("reportdao")
	ReportDAO dao;
	
	public void insertReport(ReportDTO dto) {
		dao.insertReport(dto);
	}
	
	public List<ReportDTO> reportlist(){
		return dao.reportlist();
	}
	
}
