package report;

import org.springframework.web.multipart.MultipartFile;

public class ReportDTO {
	int r_seq,s_seq;
	String r_user;
	String r_value;
	
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public int getS_seq() {
		return s_seq;
	}
	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}
	public String getR_user() {
		return r_user;
	}
	public void setR_user(String r_user) {
		this.r_user = r_user;
	}
	public String getR_value() {
		return r_value;
	}
	public void setR_value(String r_value) {
		this.r_value = r_value;
	}
	
	
	
	
	

	
}
