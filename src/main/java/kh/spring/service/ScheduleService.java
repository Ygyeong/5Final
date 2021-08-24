package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ScheduleDAO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ScheduleDTO;
@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO sDao;
	
	public List<ScheduleDTO> showSchedule(ScheduleDTO dto) throws Exception {
		return sDao.showSchedule(dto);
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception {
		sDao.addSchedule(dto);
	}
}
