package adproduct;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO2 {
	
	//product table colums
	private int p_id;
	private String p_name;
	private String p_sex;
	private String p_brand;
	private String p_color;
	private int p_price;
	private int p_stock;
	private MultipartFile p_contents;
	private String p_contents_name;
	private Date p_regdate;
	private MultipartFile p_thumb;
	private String p_thumb_name;
	private MultipartFile p_image1;
	private String p_image1_name;
	private MultipartFile p_image2;
	private String p_image2_name;
	private MultipartFile p_image3;
	private String p_image3_name;
	private int p_like;
	private int p_viewcount;
	private int category_id;
	
	//기본생성자
	public ProductDTO2() {
		
	}
	
	//매개변수 있는 생성자
	public ProductDTO2(int p_id, String p_name, String p_sex,
			String p_brand, String p_color, int p_price, int p_stock, MultipartFile p_contents, String p_contents_name,
			Date p_regdate, MultipartFile p_thumb, String p_thumb_name, MultipartFile p_image1, String p_image1_name,
			MultipartFile p_image2, String p_image2_name, MultipartFile p_image3, String p_image3_name,
			int p_like, int p_viewcount, int category_id) {
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_sex = p_sex;
		this.p_brand = p_brand;
		this.p_color = p_color;
		this.p_price = p_price;
		this.p_stock = p_stock;
		this.p_contents = p_contents;
		this.p_contents_name = p_contents_name;
		this.p_regdate = p_regdate;
		this.p_thumb = p_thumb;
		this.p_thumb_name = p_thumb_name;
		this.p_image1 = p_image1;
		this.p_image1_name = p_image1_name;
		this.p_image2 = p_image2;
		this.p_image2_name = p_image2_name;
		this.p_image3 = p_image3;
		this.p_image3_name = p_image3_name;
		this.p_like = p_like;
		this.p_viewcount = p_viewcount;
		this.category_id = category_id;
		
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
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

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public MultipartFile getP_contents() {
		return p_contents;
	}

	public void setP_contents(MultipartFile p_contents) {
		this.p_contents = p_contents;
	}

	public String getP_contents_name() {
		return p_contents_name;
	}

	public void setP_contents_name(String p_contents_name) {
		this.p_contents_name = p_contents_name;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}

	public MultipartFile getP_thumb() {
		return p_thumb;
	}

	public void setP_thumb(MultipartFile p_thumb) {
		this.p_thumb = p_thumb;
	}

	public MultipartFile getP_image1() {
		return p_image1;
	}

	public void setP_image1(MultipartFile p_image1) {
		this.p_image1 = p_image1;
	}

	public MultipartFile getP_image2() {
		return p_image2;
	}

	public void setP_image2(MultipartFile p_image2) {
		this.p_image2 = p_image2;
	}

	public MultipartFile getP_image3() {
		return p_image3;
	}

	public void setP_image3(MultipartFile p_image3) {
		this.p_image3 = p_image3;
	}

	public int getP_like() {
		return p_like;
	}

	public void setP_like(int p_like) {
		this.p_like = p_like;
	}

	public int getP_viewcount() {
		return p_viewcount;
	}

	public void setP_viewcount(int p_viewcount) {
		this.p_viewcount = p_viewcount;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	

	public String getP_thumb_name() {
		return p_thumb_name;
	}

	public void setP_thumb_name(String p_thumb_name) {
		this.p_thumb_name = p_thumb_name;
	}

	public String getP_image1_name() {
		return p_image1_name;
	}

	public void setP_image1_name(String p_image1_name) {
		this.p_image1_name = p_image1_name;
	}

	public String getP_image2_name() {
		return p_image2_name;
	}

	public void setP_image2_name(String p_image2_name) {
		this.p_image2_name = p_image2_name;
	}

	public String getP_image3_name() {
		return p_image3_name;
	}

	public void setP_image3_name(String p_image3_name) {
		this.p_image3_name = p_image3_name;
	}

	@Override
	public String toString() {
		return "ADProductDTO [p_id=" + p_id + ", p_name=" + p_name + ", p_sex=" + p_sex + ", p_brand=" + p_brand
				+ ", p_color=" + p_color + ", p_price=" + p_price + ", p_stock=" + p_stock + ", p_contents="
				+ p_contents + ", p_contents_name=" + p_contents_name + ", p_regdate=" + p_regdate + ", p_thumb="
				+ p_thumb + ", p_thumb_name=" + p_thumb_name + ", p_image1=" + p_image1 + ", p_image1_name="
				+ p_image1_name + ", p_image2=" + p_image2 + ", p_image2_name=" + p_image2_name + ", p_image3="
				+ p_image3 + ", p_image3_name=" + p_image3_name + ", p_like=" + p_like + ", p_viewcount=" + p_viewcount
				+ ", category_id=" + category_id + "]";
	}


}
