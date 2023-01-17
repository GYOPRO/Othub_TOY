package product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
    SqlSession sqlSession; 
	
	

	@Override
	public List<ProductDTO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<ProductDTO> findCategory(int category_id) {
		// TODO Auto-generated method stub
		return null;
	}

	private static String namespace = "product";

	@Override
	public List<ProductDTO> orderByLike(int category_id) {
		return sqlSession.selectList(namespace + ".like", category_id);
	}



	@Override
	public List<ProductDTO> orderByRecent(int category_id) {
		return sqlSession.selectList(namespace + ".recent", category_id);
	}
	
	
	

	@Override
	public List<ProductDTO> orderByRecom(int category_id) {
		return sqlSession.selectList(namespace + ".recom", category_id);
	}



	@Override
	public List<ProductDTO> list(int category_id) throws Exception {
		return sqlSession.selectList(namespace + ".list", category_id);
	}
	


	@Override
	public ProductDTO detailProduct(int p_id) {
		return sqlSession.selectOne("product.detailProduct", p_id);
	}
	@Override
	public List<ProductDTO> searchproduct(String p_name) {
		return sqlSession.selectList(namespace + ".searchproduct", p_name);
	}
	@Override
	public List<ProductDTO> searchbrand(String p_brand) {
		return sqlSession.selectList(namespace + ".searchbrand",p_brand);
	}
	
	@Override
	public int updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int p_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String fileInfo(int p_id) {
		// TODO Auto-generated method stub
		return null;
	}

	


	

	
	
	
	/*
	 * @Override public List<ProductDTO> list(int category_id) throws Exception {
	 * return sqlSession.selectList(namespace + ".list", category_id); }
	 */

}
