package community;

import org.springframework.web.multipart.MultipartFile;

public class CommunityDTO {
	int s_seq,s_viewcount,s_like;
	MultipartFile s_image1, s_image2, s_image3; //file
	String s_title,s_contents,s_writer,s_writingtime;
	String imagename1;
	String imagename2, imagename3;
	String p_name1,p_name2,p_name3,p_name4;
	
	
	public CommunityDTO() {}
	
	public CommunityDTO(int s_seq,int s_viewcount,int s_like,String s_title,String s_contents, String s_writer, String s_writingtime,
			String imagename1,String imagename2, String imagename3,
			MultipartFile s_image1, MultipartFile s_image2,MultipartFile s_image3) {
		super();
		this.s_seq = s_seq;
		this.s_viewcount = s_viewcount;
		this.s_like = s_like;
		this.s_title = s_title;
		this.s_contents = s_contents;
		this.s_writer = s_writer;
		this.s_writingtime = s_writingtime;

	}
	
	public int getS_seq() {
		return s_seq;
	}
	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}
	public String getP_name2() {
		return p_name2;
	}

	public void setP_name2(String p_name2) {
		this.p_name2 = p_name2;
	}

	public String getP_name3() {
		return p_name3;
	}

	public void setP_name3(String p_name3) {
		this.p_name3 = p_name3;
	}

	public String getP_name4() {
		return p_name4;
	}

	public void setP_name4(String p_name4) {
		this.p_name4 = p_name4;
	}

	public int getS_viewcount() {
		return s_viewcount;
	}
	public void setS_viewcount(int s_viewcount) {
		this.s_viewcount = s_viewcount;
	}
	public int getS_like() {
		return s_like;
	}
	public void setS_like(int s_like) {
		this.s_like = s_like;
	}
	public MultipartFile getS_image1() {
		return s_image1;
	}
	public void setS_image1(MultipartFile s_image1) {
		this.s_image1 = s_image1;
	}
	public MultipartFile getS_image2() {
		return s_image2;
	}
	public void setS_image2(MultipartFile s_image2) {
		this.s_image2 = s_image2;
	}
	public MultipartFile getS_image3() {
		return s_image3;
	}
	public void setS_image3(MultipartFile s_image3) {
		this.s_image3 = s_image3;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_contents() {
		return s_contents;
	}
	public String getP_name1() {
		return p_name1;
	}

	public void setP_name1(String p_name1) {
		this.p_name1 = p_name1;
	}

	public void setS_contents(String s_contents) {
		this.s_contents = s_contents;
	}
	public String getS_writer() {
		return s_writer;
	}
	public void setS_writer(String s_writer) {
		this.s_writer = s_writer;
	}
	public String getS_writingtime() {
		return s_writingtime;
	}
	public void setS_writingtime(String s_writingtime) {
		this.s_writingtime = s_writingtime;
	}
	public String getImagename1() {
		return imagename1;
	}
	public void setImagename1(String imagename1) {
		this.imagename1 = imagename1;
	}
	public String getImagename2() {
		return imagename2;
	}
	public void setImagename2(String imagename2) {
		this.imagename2 = imagename2;
	}
	public String getImagename3() {
		return imagename3;
	}
	public void setImagename3(String imagename3) {
		this.imagename3 = imagename3;
	}

	@Override
	public String toString() {
		return "imagename1 = "+imagename1+"s_image1 = "+s_image1;
	}
	
	
	
	

	
}
