package kh.spring.dto;

public class RePicturesDTO {
	private int repicture_seq;
	private String reOriName;
	private String reSysName;
	private int rep_seq2;
	
	public RePicturesDTO() {
		super();
	}
	public RePicturesDTO(int repicture_seq, String reOriName, String reSysName, int rep_seq2) {
		super();
		this.repicture_seq = repicture_seq;
		this.reOriName = reOriName;
		this.reSysName = reSysName;
		this.rep_seq2 = rep_seq2;
	}
	public int getRepicture_seq() {
		return repicture_seq;
	}
	public void setRepicture_seq(int repicture_seq) {
		this.repicture_seq = repicture_seq;
	}
	public String getReOriName() {
		return reOriName;
	}
	public void setReOriName(String reOriName) {
		this.reOriName = reOriName;
	}
	public String getReSysName() {
		return reSysName;
	}
	public void setReSysName(String reSysName) {
		this.reSysName = reSysName;
	}
	public int getRep_seq2() {
		return rep_seq2;
	}
	public void setRep_seq2(int rep_seq2) {
		this.rep_seq2 = rep_seq2;
	}
	
}
