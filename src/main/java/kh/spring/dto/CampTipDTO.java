package kh.spring.dto;

import java.sql.Date;

public class CampTipDTO {
	
	private int camp_tip_num;
	private String category;
	private String writer;
	private String title;
	private String contents;
	private Date write_date;
	private int view_count;
	
	public CampTipDTO() {}

	public CampTipDTO(int camp_tip_num, String category, String writer, String title, String contents, Date write_date,
			int view_count) {
		super();
		this.camp_tip_num = camp_tip_num;
		this.category = category;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
	}
	
	public int getCamp_tip_num() {
		return camp_tip_num;
	}
	public void setCamp_tip_num(int camp_tip_num) {
		this.camp_tip_num = camp_tip_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
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

