package kh.spring.dto;


public class SummerDTO {
	private int summer_seq;
	private String oriName;
	private String sysName;
	private int p_seq;
	
	public SummerDTO() {}
	
	public SummerDTO(int summer_seq, String oriName, String sysName, int p_seq) {
		super();
		this.summer_seq = summer_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.p_seq = p_seq;
	}


	public int getSummer_seq() {
		return summer_seq;
	}

	public void setSummer_seq(int summer_seq) {
		this.summer_seq = summer_seq;
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

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	
}
