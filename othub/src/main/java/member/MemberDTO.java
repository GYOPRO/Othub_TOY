package member;

public class MemberDTO {

	String m_id; 
	String m_pw;
	String m_name;
	int m_address1; 
	String m_address2,m_address3; 


	String m_phone; 
	String m_email; 
	String m_sex;
	String m_regdate;
	String role1;
	String role2;
	
	public MemberDTO(){ }
	
	public MemberDTO(String m_id, String m_pw, String m_name,int m_address1,String m_address2,String m_address3, String m_phone, String m_email, String m_sex ,String m_regdate) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_address1 = m_address1;
		this.m_address2 = m_address2;
		this.m_address3 = m_address3;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_sex = m_sex;
		this.m_regdate = m_regdate;
	}

	public int getM_address1() {
		return m_address1;
	}

	public void setM_address1(int m_address1) {
		this.m_address1 = m_address1;
	}

	public String getM_address2() {
		return m_address2;
	}

	public void setM_address2(String m_address2) {
		this.m_address2 = m_address2;
	}
	
	public String getM_address3() {
		return m_address3;
	}

	public void setM_address3(String m_address3) {
		this.m_address3 = m_address3;
	}
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}



	public String getRole1() {
		return role1;
	}

	public void setRole1(String role1) {
		this.role1 = role1;
	}

	public String getRole2() {
		return role2;
	}

	public void setRole2(String role2) {
		this.role2 = role2;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}


	

	
	
	
}
