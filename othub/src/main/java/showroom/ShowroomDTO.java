package showroom;

import org.springframework.web.multipart.MultipartFile;

public class ShowroomDTO {
	int sr_num, sr_viewcount;
	MultipartFile sr_image1, sr_image2, sr_image3, sr_image4, sr_image5;
	String sr_writer, sr_title, sr_contents, sr_writingtime;
	String sr_imgname1,sr_imgname2,sr_imgname3,sr_imgname4,sr_imgname5;
	
	int sr_price,sr_kind, sr_address1; 
	String sr_operatingtime, sr_closed, sr_region, sr_number, sr_address2, sr_address3;
	
	
	
	
	public String[] getImgNamePath() {
		String[] imgnames = {sr_imgname1,sr_imgname2,sr_imgname3,sr_imgname4,sr_imgname5};
		return imgnames;
	}
	public void setImgNamePath(String sr_imgname1,String sr_imgname2,String sr_imgname3,String sr_imgname4, String sr_imgname5) {
		this.sr_imgname1 = sr_imgname1;
		this.sr_imgname2 = sr_imgname2;
		this.sr_imgname3 = sr_imgname3;
		this.sr_imgname4 = sr_imgname4;
		this.sr_imgname5 = sr_imgname5;
	}
	
	
	
	
	
	
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public int getSr_viewcount() {
		return sr_viewcount;
	}
	public void setSr_viewcount(int sr_viewcount) {
		this.sr_viewcount = sr_viewcount;
	}
	public MultipartFile getSr_image1() {
		return sr_image1;
	}
	public void setSr_image1(MultipartFile sr_image1) {
		this.sr_image1 = sr_image1;
	}
	public MultipartFile getSr_image2() {
		return sr_image2;
	}
	public void setSr_image2(MultipartFile sr_image2) {
		this.sr_image2 = sr_image2;
	}
	public MultipartFile getSr_image3() {
		return sr_image3;
	}
	public void setSr_image3(MultipartFile sr_image3) {
		this.sr_image3 = sr_image3;
	}
	public MultipartFile getSr_image4() {
		return sr_image4;
	}
	public void setSr_image4(MultipartFile sr_image4) {
		this.sr_image4 = sr_image4;
	}
	public MultipartFile getSr_image5() {
		return sr_image5;
	}
	public void setSr_image5(MultipartFile sr_image5) {
		this.sr_image5 = sr_image5;
	}
	public String getSr_writer() {
		return sr_writer;
	}
	public void setSr_writer(String sr_writer) {
		this.sr_writer = sr_writer;
	}
	public String getSr_title() {
		return sr_title;
	}
	public void setSr_title(String sr_title) {
		this.sr_title = sr_title;
	}
	public String getSr_contents() {
		return sr_contents;
	}
	public void setSr_contents(String sr_contents) {
		this.sr_contents = sr_contents;
	}
	public String getSr_writingtime() {
		return sr_writingtime;
	}
	public void setSr_writingtime(String sr_writingtime) {
		this.sr_writingtime = sr_writingtime;
	}
	public String getSr_imgname1() {
		return sr_imgname1;
	}
	public void setSr_imgname1(String sr_imgname1) {
		this.sr_imgname1 = sr_imgname1;
	}
	public String getSr_imgname2() {
		return sr_imgname2;
	}
	public void setSr_imgname2(String sr_imgname2) {
		this.sr_imgname2 = sr_imgname2;
	}
	public String getSr_imgname3() {
		return sr_imgname3;
	}
	public void setSr_imgname3(String sr_imgname3) {
		this.sr_imgname3 = sr_imgname3;
	}
	public String getSr_imgname4() {
		return sr_imgname4;
	}
	public void setSr_imgname4(String sr_imgname4) {
		this.sr_imgname4 = sr_imgname4;
	}
	public String getSr_imgname5() {
		return sr_imgname5;
	}
	public void setSr_imgname5(String sr_imgname5) {
		this.sr_imgname5 = sr_imgname5;
	}
	public int getSr_price() {
		return sr_price;
	}
	public void setSr_price(int sr_price) {
		this.sr_price = sr_price;
	}
	public int getSr_kind() {
		return sr_kind;
	}
	public void setSr_kind(int sr_kind) {
		this.sr_kind = sr_kind;
	}
	public String getSr_operatingtime() {
		return sr_operatingtime;
	}
	public void setSr_operatingtime(String sr_operatingtime) {
		this.sr_operatingtime = sr_operatingtime;
	}
	public String getSr_closed() {
		return sr_closed;
	}
	public void setSr_closed(String sr_closed) {
		this.sr_closed = sr_closed;
	}
	public String getSr_region() {
		return sr_region;
	}
	public void setSr_region(String sr_region) {
		this.sr_region = sr_region;
	}
	public String getSr_number() {
		return sr_number;
	}
	public void setSr_number(String sr_number) {
		this.sr_number = sr_number;
	}
	public int getSr_address1() {
		return sr_address1;
	}
	public void setSr_address1(int sr_address1) {
		this.sr_address1 = sr_address1;
	}
	public String getSr_address2() {
		return sr_address2;
	}
	public void setSr_address2(String sr_address2) {
		this.sr_address2 = sr_address2;
	}
	public String getSr_address3() {
		return sr_address3;
	}
	public void setSr_address3(String sr_address3) {
		this.sr_address3 = sr_address3;
	}
	
	
	@Override
	public String toString() {
		return "ShowroomDTO [sr_num=" + sr_num + ", sr_viewcount=" + sr_viewcount + ", sr_writer=" + sr_writer
				+ ", sr_title=" + sr_title + ", sr_contents=" + sr_contents + ", sr_writingtime=" + sr_writingtime
				+ ", sr_imgname1=" + sr_imgname1 + ", sr_price=" + sr_price + ", sr_kind=" + sr_kind
				+ ", sr_operatingtime=" + sr_operatingtime + ", sr_closed=" + sr_closed + ", sr_region=" + sr_region
				+ ", sr_number=" + sr_number + "]";
	}


	
	
	
	
}
