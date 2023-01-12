package admin;

public class AdminDTO {
 
	String a_id, a_pw, a_name;

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pw() {
		return a_pw;
	}

	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	@Override
	public String toString() {
		return "AdminDTO [a_id=" + a_id + ", a_pw=" + a_pw + ", a_name=" + a_name + "] "
				+ "\n관리자님이 접속했습니다";
	}
	
	
}
