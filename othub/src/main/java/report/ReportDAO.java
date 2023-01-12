package report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reportdao")
public interface ReportDAO {
	
	public void insertReport(ReportDTO dto);
	
	public List<ReportDTO> reportlist();
}
