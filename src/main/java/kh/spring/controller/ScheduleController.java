package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ScheduleDTO;
import kh.spring.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	public ScheduleService ss;
	
	@RequestMapping("scheduleOpen")
	public String scheduleOpen() throws Exception {
		return "/member/schedulePopup";
	}
	
	@RequestMapping("addSchedule")
	public String addSchedule(ScheduleDTO dto) throws Exception {
		
		ss.addSchedule(dto);
		return "/member/success";
	}
	
}
