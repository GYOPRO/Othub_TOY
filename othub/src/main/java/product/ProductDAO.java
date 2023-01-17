package product;

import java.util.List;

public interface ProductDAO {
	
	/* public List<ProductDTO> list(int category_id) throws Exception; */
	public List<ProductDTO> list(int category_id) throws Exception;
	  public ProductDTO detailProduct(int p_id);
	  public int updateProduct(ProductDTO dto);
	  public int deleteProduct(int p_id);
	  public int insertProduct(ProductDTO dto);
	  public String fileInfo(int p_id);
	  
	  List<ProductDTO> findAll();
	  List<ProductDTO> findCategory(int category_id);
	  List<ProductDTO> orderByLike(int category_id);
	  List<ProductDTO> orderByRecent(int category_id);
	  List<ProductDTO> orderByRecom(int category_id);
	  
	  public List<ProductDTO> searchproduct(String p_name);
	  public List<ProductDTO> searchbrand(String p_brand);
	 

}


