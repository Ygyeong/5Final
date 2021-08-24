package kh.spring.dto;

import org.springframework.stereotype.Component;

public class ScheduleDTO {
	
	private int ms_seq;
	private String subject;
	private String startDate;
	private String endDate;
	private String memo;
	private String cm_id;
	public ScheduleDTO() {}
	public ScheduleDTO(int ms_seq, String subject, String startDate, String endDate, String memo, String cm_id) {
		super();
		this.ms_seq = ms_seq;
		this.subject = subject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memo = memo;
		this.cm_id = cm_id;
	}

	public int getMs_seq() {
		return ms_seq;
	}

	public void setMs_seq(int ms_seq) {
		this.ms_seq = ms_seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCm_id() {
		return cm_id;
	}

	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}
	
}
