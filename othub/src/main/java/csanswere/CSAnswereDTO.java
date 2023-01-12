package csanswere;

import java.util.Date;

public class CSAnswereDTO {

	//product table colums
	private int cs_seq;
	private String answere_contents;
	private Date answere_regdate;

	
	public CSAnswereDTO() {
		
	}



	//매개변수 있는 생성자
	public CSAnswereDTO(int cs_seq, String answere_contents,
			Date answere_regdate) {
		
		this.cs_seq = cs_seq;
		this.answere_contents = answere_contents;
		this.answere_regdate = answere_regdate;
		
		
	}



	public int getCs_seq() {
		return cs_seq;
	}



	public void setCs_seq(int cs_seq) {
		this.cs_seq = cs_seq;
	}



	public String getAnswere_contents() {
		return answere_contents;
	}



	public void setAnswere_contents(String answere_contents) {
		this.answere_contents = answere_contents;
	}



	public Date getAnswere_regdate() {
		return answere_regdate;
	}



	public void setAnswere_regdate(Date answere_regdate) {
		this.answere_regdate = answere_regdate;
	}



	@Override
	public String toString() {
		return "CSAnswereDTO [cs_seq=" + cs_seq + ", answere_contents=" + answere_contents
				+ ", answere_regdate=" + answere_regdate + "]";
	}
	
	
	
}
