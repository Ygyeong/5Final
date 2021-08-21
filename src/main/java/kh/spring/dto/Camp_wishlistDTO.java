package kh.spring.dto;

public class Camp_wishlistDTO {

	private int contentId;
	private int wish_seq;
	private String cm_id;
	private String contents;

	
	public Camp_wishlistDTO() {
	}


	public Camp_wishlistDTO(int contentId, int wish_seq, String cm_id, String contents) {
		super();
		this.contentId = contentId;
		this.wish_seq =wish_seq;
		this.cm_id = cm_id;
		this.contents = contents;
	}


	public int getContentId() {
		return contentId;
	}


	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getWish_seq() {
		return wish_seq;
	}


	public void setWish_seq(int wish_seq) {
		this.wish_seq = wish_seq;
	}


	public String getCm_id() {
		return cm_id;
	}


	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	
	
}
