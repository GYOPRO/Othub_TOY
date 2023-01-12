package partner;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("partnerdao")
public interface PartnerDAO {
	//insert
	public void insertPartner(PartnerDTO dto) throws Exception;
	//전체 조회
	public List<PartnerDTO> PartnerList() throws Exception;
	//하나 조회
	public PartnerDTO onePartner(int pt_id) throws Exception;
	//ocr test img 등록
	public void insertTestOCRImg(OCRDTO ocrdto) throws Exception;
	//ocr test img 가져오기
	public OCRDTO getTestOCRImg(OCRDTO ocrdto) throws Exception;
}
