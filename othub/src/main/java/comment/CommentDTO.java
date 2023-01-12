package comment;

public class CommentDTO {
	
	int b_seq;
	int s_seq;
	int cm_seq;
	String cm_writer;
	String cm_contents;
	String cm_writingtime;
	String s_title, s_viewcount;
	

	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_viewcount() {
		return s_viewcount;
	}
	public void setS_viewcount(String s_viewcount) {
		this.s_viewcount = s_viewcount;
	}
	public int getS_seq() {
		return s_seq;
	}
	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public int getCm_seq() {
		return cm_seq;
	}
	public void setCm_seq(int cm_seq) {
		this.cm_seq = cm_seq;
	}
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public String getCm_contents() {
		return cm_contents;
	}
	public void setCm_contents(String cm_contents) {
		this.cm_contents = cm_contents;
	}
	public String getCm_writingtime() {
		return cm_writingtime;
	}
	public void setCm_writingtime(String cm_writingtime) {
		this.cm_writingtime = cm_writingtime;
	}
	
	
}
