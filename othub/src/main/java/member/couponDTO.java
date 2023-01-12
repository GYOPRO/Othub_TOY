package member;

public class couponDTO {

	String cp_m_id;
	String cp_code;
	String cp_discountValue;
	int cp_status;
	String cp_createdAt;
	String cp_endAt;
	String period;
	
	public couponDTO(){ }

	
	
	public String getPeriod() {
		return period;
	}



	public void setPeriod(String period) {
		this.period = period;
	}



	public String getCp_endAt() {
		return cp_endAt;
	}



	public void setCp_endAt(String cp_endAt) {
		this.cp_endAt = cp_endAt;
	}



	public String getCp_createdAt() {
		return cp_createdAt;
	}

	public void setCp_createdAt(String cp_createdAt) {
		this.cp_createdAt = cp_createdAt;
	}

	public String getCp_m_id() {
		return cp_m_id;
	}

	public void setCp_m_id(String cp_m_id) {
		this.cp_m_id = cp_m_id;
	}

	public String getCp_code() {
		return cp_code;
	}

	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}

	public String getCp_discountValue() {
		return cp_discountValue;
	}

	public void setCp_discountValue(String cp_discountValue) {
		this.cp_discountValue = cp_discountValue;
	}

	public int getCp_status() {
		return cp_status;
	}

	public void setCp_status(int cp_status) {
		this.cp_status = cp_status;
	}



	@Override
	public String toString() {
		
		return "cp_m_id ["+cp_m_id+"] cp_code ["+cp_code+"] cp_discountValue ["+cp_discountValue+
				"] cp_status ["+cp_status+"] cp_createdAt [" + cp_createdAt + "] cp_endAt [ "+cp_endAt+"] period [ "+period+"] /" ;

	}
	
	
	


	
}
