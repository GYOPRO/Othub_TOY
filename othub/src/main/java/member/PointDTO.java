package member;

public class PointDTO {
	
	private String m_id;
	private int m_point;
	
	public PointDTO() {
	}
	
	//매개변수 있는 생성자
			public PointDTO(String m_id, int m_point) {
				this.m_id = m_id;
				this.m_point = m_point;
			}

			public String getM_id() {
				return m_id;
			}

			public void setM_id(String m_id) {
				this.m_id = m_id;
			}

			public int getM_point() {
				return m_point;
			}

			public void setM_point(int m_point) {
				this.m_point = m_point;
			}

			@Override
			public String toString() {
				return "PointDTO [m_id=" + m_id + ", m_point=" + m_point + "]";
			}

		
}
