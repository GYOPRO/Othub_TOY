package cs;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CSDTO {
	
	//product table colums
		private int cs_seq;
		private String cs_writer;
		private String cs_open;
		private String cs_title;
		private String cs_question;
		private String cs_answere;
		private Date cs_regdate;
		private String answere_check;
		private MultipartFile cs_pic;
		private String cs_pic_name;
		private String pic_name;
		
		
		public CSDTO() {
			
		}



//매개변수 있는 생성자
	public CSDTO(int cs_seq, String cs_writer, String cs_open, String cs_title,
			 String cs_question, String cs_answere, Date cs_regdate, String answere_check,
			 MultipartFile cs_pic, String cs_pic_name, String pic_name) {
		
		this.cs_seq = cs_seq;
		this.cs_writer = cs_writer;
		this.cs_open = cs_open;
		this.cs_title = cs_title;
		this.cs_question = cs_question;
		this.cs_answere = cs_answere;
		this.cs_regdate = cs_regdate;
		this.answere_check = answere_check;
		this.cs_pic = cs_pic;
		this.cs_pic_name = cs_pic_name;

	}



	public int getCs_seq() {
		return cs_seq;
	}



	public void setCs_seq(int cs_seq) {
		this.cs_seq = cs_seq;
	}



	public String getCs_writer() {
		return cs_writer;
	}



	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}



	public String getCs_open() {
		return cs_open;
	}



	public void setCs_open(String cs_open) {
		this.cs_open = cs_open;
	}



	public String getCs_title() {
		return cs_title;
	}



	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}



	public String getCs_question() {
		return cs_question;
	}



	public void setCs_question(String cs_question) {
		this.cs_question = cs_question;
	}



	public String getCs_answere() {
		return cs_answere;
	}



	public void setCs_answere(String cs_answere) {
		this.cs_answere = cs_answere;
	}



	public Date getCs_regdate() {
		return cs_regdate;
	}



	public void setCs_regdate(Date cs_regdate) {
		this.cs_regdate = cs_regdate;
	}



	public String getAnswere_check() {
		return answere_check;
	}



	public void setAnswere_check(String answere_check) {
		this.answere_check = answere_check;
	}



	public MultipartFile getCs_pic() {
		return cs_pic;
	}



	public void setCs_pic(MultipartFile cs_pic) {
		this.cs_pic = cs_pic;
	}



	public String getCs_pic_name() {
		return cs_pic_name;
	}



	public void setCs_pic_name(String cs_pic_name) {
		this.cs_pic_name = cs_pic_name;
	}



	public String getPic_name() {
		return pic_name;
	}



	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}



	@Override
	public String toString() {
		return "CSDTO [cs_seq=" + cs_seq + ", cs_writer=" + cs_writer + ", cs_open=" + cs_open + ", cs_title="
				+ cs_title + ", cs_question=" + cs_question + ", cs_answere=" + cs_answere + ", cs_regdate="
				+ cs_regdate + ", answere_check=" + answere_check + ", cs_pic=" + cs_pic + ", cs_pic_name="
				+ cs_pic_name + "]";
	}




	
}
