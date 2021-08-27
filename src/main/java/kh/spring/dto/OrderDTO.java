package kh.spring.dto;

import java.sql.Date;

public class OrderDTO {
	
	private int o_seq;
	private String m_id;
	private Date o_rdate;
	private String o_name;
	private String o_phone;
	private String o_email;
	private String o_zipcode;
	private String o_address1;
	private String o_address2;
	private String o_product;
	private int o_qcy;
	private int o_allSum;
	private int o_delivery;
	private int o_num;
	private int o_check;
	
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int o_seq, String m_id, Date o_rdate, String o_name, String o_phone, String o_email,
			String o_zipcode, String o_address1, String o_address2, String o_product, int o_qcy, int o_allSum,
			int o_delivery, int o_num, int o_check) {
		super();
		this.o_seq = o_seq;
		this.m_id = m_id;
		this.o_rdate = o_rdate;
		this.o_name = o_name;
		this.o_phone = o_phone;
		this.o_email = o_email;
		this.o_zipcode = o_zipcode;
		this.o_address1 = o_address1;
		this.o_address2 = o_address2;
		this.o_product = o_product;
		this.o_qcy = o_qcy;
		this.o_allSum = o_allSum;
		this.o_delivery = o_delivery;
		this.o_num = o_num;
		this.o_check = o_check;
	}
	public int getO_seq() {
		return o_seq;
	}
	public void setO_seq(int o_seq) {
		this.o_seq = o_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getO_rdate() {
		return o_rdate;
	}
	public void setO_rdate(Date o_rdate) {
		this.o_rdate = o_rdate;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public String getO_email() {
		return o_email;
	}
	public void setO_email(String o_email) {
		this.o_email = o_email;
	}
	public String getO_zipcode() {
		return o_zipcode;
	}
	public void setO_zipcode(String o_zipcode) {
		this.o_zipcode = o_zipcode;
	}
	public String getO_address1() {
		return o_address1;
	}
	public void setO_address1(String o_address1) {
		this.o_address1 = o_address1;
	}
	public String getO_address2() {
		return o_address2;
	}
	public void setO_address2(String o_address2) {
		this.o_address2 = o_address2;
	}
	public String getO_product() {
		return o_product;
	}
	public void setO_product(String o_product) {
		this.o_product = o_product;
	}
	public int getO_qcy() {
		return o_qcy;
	}
	public void setO_qcy(int o_qcy) {
		this.o_qcy = o_qcy;
	}
	public int getO_allSum() {
		return o_allSum;
	}
	public void setO_allSum(int o_allSum) {
		this.o_allSum = o_allSum;
	}
	public int getO_delivery() {
		return o_delivery;
	}
	public void setO_delivery(int o_delivery) {
		this.o_delivery = o_delivery;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public int getO_check() {
		return o_check;
	}
	public void setO_check(int o_check) {
		this.o_check = o_check;
	}
	
	
	
	
	
}
