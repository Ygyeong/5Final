package kh.spring.dto;

import java.sql.Date;

public class ReCommentsDTO {

	private int recmt_seq;
	private String recmt_writer;
	private String recmt_comments;
	private Date recmt_write_date;
	private int recmt_rep_seq;
	
	public ReCommentsDTO() {
		super();
	}
	public ReCommentsDTO(int recmt_seq, String recmt_writer, String recmt_comments, Date recmt_write_date,
			int recmt_rep_seq) {
		super();
		this.recmt_seq = recmt_seq;
		this.recmt_writer = recmt_writer;
		this.recmt_comments = recmt_comments;
		this.recmt_write_date = recmt_write_date;
		this.recmt_rep_seq = recmt_rep_seq;
	}
	public int getRecmt_seq() {
		return recmt_seq;
	}
	public void setRecmt_seq(int recmt_seq) {
		this.recmt_seq = recmt_seq;
	}
	public String getRecmt_writer() {
		return recmt_writer;
	}
	public void setRecmt_writer(String recmt_writer) {
		this.recmt_writer = recmt_writer;
	}
	public String getRecmt_comments() {
		return recmt_comments;
	}
	public void setRecmt_comments(String recmt_comments) {
		this.recmt_comments = recmt_comments;
	}
	public Date getRecmt_write_date() {
		return recmt_write_date;
	}
	public void setRecmt_write_date(Date recmt_write_date) {
		this.recmt_write_date = recmt_write_date;
	}
	public int getRecmt_rep_seq() {
		return recmt_rep_seq;
	}
	public void setRecmt_rep_seq(int recmt_rep_seq) {
		this.recmt_rep_seq = recmt_rep_seq;
	}
	
}
