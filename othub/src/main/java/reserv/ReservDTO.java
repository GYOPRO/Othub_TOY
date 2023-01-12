package reserv;

import showroom.ShowroomDTO;

public class ReservDTO {
	int r_id, sr_num, r_price, r_numOfPer;
	String m_id, r_orderer, r_date, r_registTime;
	private ShowroomDTO showroomdto;
	
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public int getR_numOfPer() {
		return r_numOfPer;
	}
	public void setR_numOfPer(int r_numOfPer) {
		this.r_numOfPer = r_numOfPer;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_orderer() {
		return r_orderer;
	}
	public void setR_orderer(String r_orderer) {
		this.r_orderer = r_orderer;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_registTime() {
		return r_registTime;
	}
	public void setR_registTime(String r_registTime) {
		this.r_registTime = r_registTime;
	}
	public ShowroomDTO getShowroomdto() {
		return showroomdto;
	}
	public void setShowroomdto(ShowroomDTO showroomdto) {
		this.showroomdto = showroomdto;
	}
	
	
	
}
