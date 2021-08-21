package kh.spring.dto;

import java.sql.Date;

public class ReProductDTO {

	private int rep_seq;
	private String rep_name;
	private String rep_price;
	private String rep_delivery;
	private String rep_delivery_price;
	private String rep_area;
	private String rep_category;
	private String rep_writer;
	private Date rep_write_date;
	private String rep_diff_date;
	private int rep_stock;
	private String rep_detail;
	private String thumsysName;
	

	public ReProductDTO() {
		super();
	}
	



	public ReProductDTO(int rep_seq, String rep_name, String rep_price, String rep_delivery, String rep_delivery_price,
			String rep_area, String rep_category, String rep_writer, Date rep_write_date, String rep_diff_date,
			int rep_stock, String rep_detail, String thumsysName) {
		super();
		this.rep_seq = rep_seq;
		this.rep_name = rep_name;
		this.rep_price = rep_price;
		this.rep_delivery = rep_delivery;
		this.rep_delivery_price = rep_delivery_price;
		this.rep_area = rep_area;
		this.rep_category = rep_category;
		this.rep_writer = rep_writer;
		this.rep_write_date = rep_write_date;
		this.rep_diff_date = rep_diff_date;
		this.rep_stock = rep_stock;
		this.rep_detail = rep_detail;
		this.thumsysName = thumsysName;
	}




	public String getRep_diff_date() {
		return rep_diff_date;
	}




	public void setRep_diff_date(String rep_diff_date) {
		this.rep_diff_date = rep_diff_date;
	}




	public int getRep_seq() {
		return rep_seq;
	}


	public void setRep_seq(int rep_seq) {
		this.rep_seq = rep_seq;
	}


	public String getRep_name() {
		return rep_name;
	}


	public void setRep_name(String rep_name) {
		this.rep_name = rep_name;
	}


	public String getRep_price() {
		return rep_price;
	}


	public void setRep_price(String rep_price) {
		this.rep_price = rep_price;
	}


	public String getRep_delivery() {
		return rep_delivery;
	}


	public void setRep_delivery(String rep_delivery) {
		this.rep_delivery = rep_delivery;
	}


	public String getRep_delivery_price() {
		return rep_delivery_price;
	}


	public void setRep_delivery_price(String rep_delivery_price) {
		this.rep_delivery_price = rep_delivery_price;
	}


	public String getRep_area() {
		return rep_area;
	}


	public void setRep_area(String rep_area) {
		this.rep_area = rep_area;
	}


	public String getRep_category() {
		return rep_category;
	}


	public void setRep_category(String rep_category) {
		this.rep_category = rep_category;
	}


	public String getRep_writer() {
		return rep_writer;
	}


	public void setRep_writer(String rep_writer) {
		this.rep_writer = rep_writer;
	}


	public Date getRep_write_date() {
		return rep_write_date;
	}


	public void setRep_write_date(Date rep_write_date) {
		this.rep_write_date = rep_write_date;
	}


	public int getRep_stock() {
		return rep_stock;
	}


	public void setRep_stock(int rep_stock) {
		this.rep_stock = rep_stock;
	}


	public String getRep_detail() {
		return rep_detail;
	}


	public void setRep_detail(String rep_detail) {
		this.rep_detail = rep_detail;
	}


	public String getThumsysName() {
		return thumsysName;
	}


	public void setThumsysName(String thumsysName) {
		this.thumsysName = thumsysName;
	}


	

	
	
	
	
	
	
	
	
}
