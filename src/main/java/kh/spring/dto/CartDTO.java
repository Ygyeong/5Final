package kh.spring.dto;

public class CartDTO {
	private int c_seq;
	private String camp_id;
	private int p_seq;
	private int c_qty;
	private String p_name;
	private String p_price;
	private int c_price;
	
	public CartDTO() {}
	

	public CartDTO(int c_seq, String camp_id, int p_seq, int c_qty, String p_name, String p_price, int c_price) {
		super();
		this.c_seq = c_seq;
		this.camp_id = camp_id;
		this.p_seq = p_seq;
		this.c_qty = c_qty;
		this.p_name = p_name;
		this.p_price = p_price;
		this.c_price = c_price;
	}


	public int getC_seq() {
		return c_seq;
	}

	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}

	public String getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(String camp_id) {
		this.camp_id = camp_id;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public int getC_qty() {
		return c_qty;
	}

	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	
	
	
	

}
