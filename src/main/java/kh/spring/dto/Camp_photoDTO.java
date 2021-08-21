package kh.spring.dto;

public class Camp_photoDTO {
	private int contentId;
	private int serialnum;
	private String imageUrl;
	
	public Camp_photoDTO() {
	}

	public Camp_photoDTO(int contentId, int serialnum, String imageUrl) {
		super();
		this.contentId = contentId;
		this.serialnum = serialnum;
		this.imageUrl = imageUrl;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getSerialnum() {
		return serialnum;
	}

	public void setSerialnum(int serialnum) {
		this.serialnum = serialnum;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	

	
}
