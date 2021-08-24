package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ScheduleDTO;

@Repository
public class ScheduleDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ScheduleDTO> showSchedule(ScheduleDTO dto) throws Exception {
		return mybatis.selectList("Schedule.showSchedule", dto);
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception {
		mybatis.insert("Schedule.addSchedule", dto);
	}
}
