package review;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
		
	//product table colums
		private int p_id;
		private String p_name;
		private int order_id;
		private String review_writer;
		private String review_evaluation;
		private String review_contents;
		private MultipartFile review_pic;
		private String pic_name;
		private String review_pic_name;
		private Date review_regdate;
		private String point_check;
			
			
		public ReviewDTO() {
		}
		
		//매개변수 있는 생성자
		public ReviewDTO(int p_id, String p_name, int order_id, String review_writer, String review_evaluation, String review_contents,
				MultipartFile review_pic, String pic_name, String review_pic_name, Date review_regdate, String point_check) {
			
			this.p_id = p_id;
			this.p_name = p_name;
			this.order_id = order_id;
			this.review_writer = review_writer;
			this.review_evaluation = review_evaluation;
			this.review_contents = review_contents;
			this.review_pic = review_pic;
			this.pic_name = pic_name;
			this.review_pic_name = review_pic_name;
			this.review_regdate = review_regdate;
			this.point_check = point_check;

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

		public int getOrder_id() {
			return order_id;
		}

		public void setOrder_id(int order_id) {
			this.order_id = order_id;
		}

		public String getReview_writer() {
			return review_writer;
		}

		public void setReview_writer(String review_writer) {
			this.review_writer = review_writer;
		}

		public String getReview_evaluation() {
			return review_evaluation;
		}

		public void setReview_evaluation(String review_evaluation) {
			this.review_evaluation = review_evaluation;
		}

		public String getReview_contents() {
			return review_contents;
		}

		public void setReview_contents(String review_contents) {
			this.review_contents = review_contents;
		}

		public MultipartFile getReview_pic() {
			return review_pic;
		}

		public void setReview_pic(MultipartFile review_pic) {
			this.review_pic = review_pic;
		}

		public String getPic_name() {
			return pic_name;
		}

		public void setPic_name(String pic_name) {
			this.pic_name = pic_name;
		}

		public String getReview_pic_name() {
			return review_pic_name;
		}

		public void setReview_pic_name(String review_pic_name) {
			this.review_pic_name = review_pic_name;
		}

		public Date getReview_regdate() {
			return review_regdate;
		}

		public void setReview_regdate(Date review_regdate) {
			this.review_regdate = review_regdate;
		}

		public String getPoint_check() {
			return point_check;
		}

		public void setPoint_check(String point_check) {
			this.point_check = point_check;
		}

		@Override
		public String toString() {
			return "ReviewDTO [p_id=" + p_id + ", p_name=" + p_name + ", order_id=" + order_id + ", review_writer="
					+ review_writer + ", review_evaluation=" + review_evaluation + ", review_contents="
					+ review_contents + ", review_pic=" + review_pic + ", pic_name=" + pic_name + ", review_pic_name="
					+ review_pic_name + ", review_regdate=" + review_regdate + ", point_check=" + point_check + "]";
		}

}
