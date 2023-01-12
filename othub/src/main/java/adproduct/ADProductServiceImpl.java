package adproduct;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ADProductServiceImpl implements ADProductService {
	
	@Inject
	private ADProductDAO dao;

	@Override
	public void insertproduct(ADProductDTO dto) throws Exception {
		dao.insertproduct(dto);

	}

	@Override
	public ADProductDTO getproduct(int p_id){
		return dao.getproduct(p_id);
	}

	@Override
	public int adpcount() throws Exception {
		return dao.adpcount();
	}

	@Override
	public List<ADProductDTO> adplistPage(int displayPost, int postNum) throws Exception {
		return dao.adplistPage(displayPost, postNum);
	}

	@Override
	public void insertdata(ProductDTO2 dto) throws Exception {
		dao.insertdata(dto);
		
	}

	@Override
	public void adpmodify(ADProductDTO dto) throws Exception {
		dao.adpmodify(dto);
		
	}

	@Override
	public void adpdelete(int p_id) throws Exception {
		dao.adpdelete(p_id);
		
	}

}
