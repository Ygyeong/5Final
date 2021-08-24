package kh.spring.dto;

import java.sql.Date;

public class ProductsDTO {
	private int p_seq;
	private String p_name;
	private int p_price;
	private String p_delivery;
	private String p_category;
	private Date p_rdate;
	private int p_stock;
	private String p_contents;
	private int p_view_count;
	private String camp_id;
	private String thumsysName;
	private String p_detail;
	
	public ProductsDTO() {}
	

	public ProductsDTO(int p_seq, String p_name, int p_price, String p_delivery, String p_category, Date p_rdate,
			int p_stock, String p_contents, int p_view_count, String camp_id, String thumsysName, String p_detail) {
		super();
		this.p_seq = p_seq;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_delivery = p_delivery;
		this.p_category = p_category;
		this.p_rdate = p_rdate;
		this.p_stock = p_stock;
		this.p_contents = p_contents;
		this.p_view_count = p_view_count;
		this.camp_id = camp_id;
		this.thumsysName = thumsysName;
		this.p_detail = p_detail;
	}


	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_delivery() {
		return p_delivery;
	}

	public void setP_delivery(String p_delivery) {
		this.p_delivery = p_delivery;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public Date getP_rdate() {
		return p_rdate;
	}

	public void setP_rdate(Date p_rdate) {
		this.p_rdate = p_rdate;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_contents() {
		return p_contents;
	}

	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}

	public int getP_view_count() {
		return p_view_count;
	}

	public void setP_view_count(int p_view_count) {
		this.p_view_count = p_view_count;
	}

	public String getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(String camp_id) {
		this.camp_id = camp_id;
	}

	public String getThumsysName() {
		return thumsysName;
	}

	public void setThumsysName(String thumsysName) {
		this.thumsysName = thumsysName;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	
}