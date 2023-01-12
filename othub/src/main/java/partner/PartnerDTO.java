package partner;

import org.springframework.web.multipart.MultipartFile;

public class PartnerDTO {
	int pt_id;
	String m_id, pt_kind, pt_companyName, pt_contectPerName, pt_contectPerPosition;
	String pt_contectPerPhone, pt_homePageURL, pt_email, pt_uploadtime;
	MultipartFile pt_companyRegistNumImg;
	String pt_companyRegistNum, pt_Imgname1;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getPt_id() {
		return pt_id;
	}
	public void setPt_id(int pt_id) {
		this.pt_id = pt_id;
	}
	public String getPt_kind() {
		return pt_kind;
	}
	public void setPt_kind(String pt_kind) {
		this.pt_kind = pt_kind;
	}
	public String getPt_companyName() {
		return pt_companyName;
	}
	public void setPt_companyName(String pt_companyName) {
		this.pt_companyName = pt_companyName;
	}
	public String getPt_contectPerName() {
		return pt_contectPerName;
	}
	public void setPt_contectPerName(String pt_contectPerName) {
		this.pt_contectPerName = pt_contectPerName;
	}
	public String getPt_contectPerPosition() {
		return pt_contectPerPosition;
	}
	public void setPt_contectPerPosition(String pt_contectPerPosition) {
		this.pt_contectPerPosition = pt_contectPerPosition;
	}
	public String getPt_contectPerPhone() {
		return pt_contectPerPhone;
	}
	public void setPt_contectPerPhone(String pt_contectPerPhone) {
		this.pt_contectPerPhone = pt_contectPerPhone;
	}
	public String getPt_homePageURL() {
		return pt_homePageURL;
	}
	public void setPt_homePageURL(String pt_homePageURL) {
		this.pt_homePageURL = pt_homePageURL;
	}
	public String getPt_email() {
		return pt_email;
	}
	public void setPt_email(String pt_email) {
		this.pt_email = pt_email;
	}
	public String getPt_uploadtime() {
		return pt_uploadtime;
	}
	public void setPt_uploadtime(String pt_uploadtime) {
		this.pt_uploadtime = pt_uploadtime;
	}
	public MultipartFile getPt_companyRegistNumImg() {
		return pt_companyRegistNumImg;
	}
	public void setPt_companyRegistNumImg(MultipartFile pt_companyRegistNumImg) {
		this.pt_companyRegistNumImg = pt_companyRegistNumImg;
	}
	public String getPt_companyRegistNum() {
		return pt_companyRegistNum;
	}
	public void setPt_companyRegistNum(String pt_companyRegistNum) {
		this.pt_companyRegistNum = pt_companyRegistNum;
	}
	public String getPt_Imgname1() {
		return pt_Imgname1;
	}
	public void setPt_Imgname1(String pt_Imgname1) {
		this.pt_Imgname1 = pt_Imgname1;
	}
	
	
}
