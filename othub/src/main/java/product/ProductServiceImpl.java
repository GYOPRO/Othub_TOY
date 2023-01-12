package product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service("productservice")
public class ProductServiceImpl implements ProductService {
	
	@Inject
    private ProductDAO productDao;
	

	@Override
	public List<ProductDTO> findAll() {
		return productDao.findAll();
	}


	@Override
	public List<ProductDTO> findCategory(int category_id) {
		return productDao.findCategory(category_id);
	}


	@Override
	public List<ProductDTO> orderByLike(int category_id) {
		return productDao.orderByLike(category_id);
	}


	@Override
	public List<ProductDTO> orderByRecent(int category_id) {
		return productDao.orderByRecent(category_id);
	}
	


	@Override
	public List<ProductDTO> orderByRecom(int category_id) {
		return productDao.orderByRecom(category_id);
	}


	@Override
	public List<ProductDTO> list(int category_id) throws Exception {
		
		return productDao.list(category_id);
	}
	



	@Override
	public ProductDTO detailProduct(int p_id) {
		return productDao.detailProduct(p_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(int p_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public String fileInfo(int p_id) {
		return null;
	}

	/*
	 * @Override public List<ProductDTO> list(int category_id) throws Exception {
	 * return productDao.list(category_id); }
	 */

}
