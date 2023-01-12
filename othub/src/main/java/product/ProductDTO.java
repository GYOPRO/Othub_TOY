package product;

public class ProductDTO {
	
	//product table colums
	private String p_id;
	private String p_name;
	private String p_sex;
	private String p_brand;
	private int p_price;
	private String p_stock;
	private String p_contents;
	private String p_regdate;
	private String p_thumb;
	private String p_image1;
	private String p_image2;
	private String p_image3;
	private String p_like;
	private String p_viewcount;
	private String category_id;
	
	//기본생성자
	public ProductDTO() {
		
	}
	
	//매개변수 있는 생성자
	public ProductDTO(String p_id, String p_name, String p_sex,
			String p_brand, int p_price, String p_stock, String p_contents,
			String p_regdate, String p_thumb, String p_image1, String p_image2, String p_image3,
			String p_like, String p_viewcount, String category_id) {
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_sex = p_sex;
		this.p_brand = p_brand;
		this.p_price = p_price;
		this.p_stock = p_stock;
		this.p_contents = p_contents;
		this.p_regdate = p_regdate;
		this.p_thumb = p_thumb;
		this.p_image1 = p_image1;
		this.p_image2 = p_image2;
		this.p_image3 = p_image3;
		this.p_like = p_like;
		this.p_viewcount = p_viewcount;
		this.category_id = category_id;
		
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_sex() {
		return p_sex;
	}

	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
	}

	public String getP_brand() {
		return p_brand;
	}

	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_stock() {
		return p_stock;
	}

	public void setP_stock(String p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_contents() {
		return p_contents;
	}

	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}

	public String getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}

	public String getP_image1() {
		return p_image1;
	}

	public void setP_image1(String p_image1) {
		this.p_image1 = p_image1;
	}

	public String getP_image2() {
		return p_image2;
	}

	public void setP_image2(String p_image2) {
		this.p_image2 = p_image2;
	}

	public String getP_image3() {
		return p_image3;
	}

	public void setP_image3(String p_image3) {
		this.p_image3 = p_image3;
	}

	public String getP_like() {
		return p_like;
	}

	public void setP_like(String p_like) {
		this.p_like = p_like;
	}

	public String getP_viewcount() {
		return p_viewcount;
	}

	public void setP_viewcount(String p_viewcount) {
		this.p_viewcount = p_viewcount;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	
	

	public String getP_thumb() {
		return p_thumb;
	}

	public void setP_thumb(String p_thumb) {
		this.p_thumb = p_thumb;
	}

	@Override
	public String toString() {
		return "ProductDTO [p_id=" + p_id + ", p_name=" + p_name + ", p_sex=" + p_sex + ", p_brand=" + p_brand
				+ ", p_price=" + p_price + ", p_stock=" + p_stock + ", p_contents=" + p_contents + ", p_regdate="
				+ p_regdate + ", p_thumb=" + p_thumb + ", p_image1=" + p_image1 + ", p_image2=" + p_image2
				+ ", p_image3=" + p_image3 + ", p_like=" + p_like + ", p_viewcount=" + p_viewcount + ", category_id="
				+ category_id + "]";
	}

	
	
	

}
