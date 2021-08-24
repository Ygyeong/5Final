package kh.spring.dto;

public class CampTipImgDTO {
	
	private int seq;
	private String oriName;
	private String sysName;
	private int camp_tip_img_num2;
	
	public CampTipImgDTO() {}

	public CampTipImgDTO(int seq, String oriName, String sysName, int camp_tip_img_num2) {
		super();
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.camp_tip_img_num2 = camp_tip_img_num2;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getCamp_tip_img_num2() {
		return camp_tip_img_num2;
	}
	public void setCamp_tip_img_num2(int camp_tip_img_num2) {
		this.camp_tip_img_num2 = camp_tip_img_num2;
	}

}
