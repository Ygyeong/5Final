package kh.spring.dto;

public class ReWishListDTO {
	private int rew_id;
	private String rem_id;
	private int rep_id;
	
	public ReWishListDTO() {
		super();
	}
	public ReWishListDTO(int rew_id, String rem_id, int rep_id) {
		super();
		this.rew_id = rew_id;
		this.rem_id = rem_id;
		this.rep_id = rep_id;
	}
	public int getRew_id() {
		return rew_id;
	}
	public void setRew_id(int rew_id) {
		this.rew_id = rew_id;
	}
	public String getRem_id() {
		return rem_id;
	}
	public void setRem_id(String rem_id) {
		this.rem_id = rem_id;
	}
	public int getRep_id() {
		return rep_id;
	}
	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}
}
