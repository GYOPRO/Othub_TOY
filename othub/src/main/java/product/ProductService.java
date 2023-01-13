package product;

import java.util.List;

public interface ProductService {
	
	/* public List<ProductDTO> list(int category_id) throws Exception; */
	public List<ProductDTO> list(int category_id) throws Exception;
	ProductDTO detailProduct(int p_id);
    String fileInfo(int p_id);
    void updateProduct(ProductDTO dto);
    void deleteProduct(int p_id);
    void insertProduct(ProductDTO dto);
    
    List<ProductDTO> findAll();
	  List<ProductDTO> findCategory(int category_id);
	  List<ProductDTO> orderByLike(int category_id);
	  List<ProductDTO> orderByRecent(int category_id);
	  List<ProductDTO> orderByRecom(int category_id);

	  public List<ProductDTO> searchproduct(String p_name);
}
