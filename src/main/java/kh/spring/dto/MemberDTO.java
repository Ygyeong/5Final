package kh.spring.dto;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	
	private int cm_no;
	private String cm_id;
	private String cm_pw;
	private String cm_name;
	private String cm_email;
	private int cm_phone;
	private String cm_zipcode;
	private String cm_address1;
	private String cm_address2;
	
	public MemberDTO() {}

	public MemberDTO(int cm_no, String cm_id, String cm_pw, String cm_name, String cm_email, int cm_phone,
			String cm_zipcode, String cm_address1, String cm_address2) {
		super();
		this.cm_no = cm_no;
		this.cm_id = cm_id;
		this.cm_pw = cm_pw;
		this.cm_name = cm_name;
		this.cm_email = cm_email;
		this.cm_phone = cm_phone;
		this.cm_zipcode = cm_zipcode;
		this.cm_address1 = cm_address1;
		this.cm_address2 = cm_address2;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public String getCm_id() {
		return cm_id;
	}

	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}

	public String getCm_pw() {
		return cm_pw;
	}

	public void setCm_pw(String cm_pw) {
		this.cm_pw = cm_pw;
	}

	public String getCm_name() {
		return cm_name;
	}

	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}

	public String getCm_email() {
		return cm_email;
	}

	public void setCm_email(String cm_email) {
		this.cm_email = cm_email;
	}

	public int getCm_phone() {
		return cm_phone;
	}

	public void setCm_phone(int cm_phone) {
		this.cm_phone = cm_phone;
	}

	public String getCm_zipcode() {
		return cm_zipcode;
	}

	public void setCm_zipcode(String cm_zipcode) {
		this.cm_zipcode = cm_zipcode;
	}

	public String getCm_address1() {
		return cm_address1;
	}

	public void setCm_address1(String cm_address1) {
		this.cm_address1 = cm_address1;
	}

	public String getCm_address2() {
		return cm_address2;
	}

	public void setCm_address2(String cm_address2) {
		this.cm_address2 = cm_address2;
	}
	
}
