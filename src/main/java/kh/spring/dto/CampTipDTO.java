package kh.spring.dto;

import java.sql.Date;

public class CampTipDTO {
	
	private int campTip_num;
	private int category;
	private String writer;
	private String title;
	private String contents;
	private Date write_date;
	private int view_count;
	
	public CampTipDTO() {}

	public CampTipDTO(int campTip_num, int category, String writer, String title, String contents, Date write_date,
			int view_count) {
		super();
		this.campTip_num = campTip_num;
		this.category = category;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
	}
	
	public int getCampTip_num() {
		return campTip_num;
	}
	public void setCampTip_num(int campTip_num) {
		this.campTip_num = campTip_num;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

}

