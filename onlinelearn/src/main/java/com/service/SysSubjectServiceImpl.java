package com.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.SysSubject;
import com.mapper.SysSubjectMapper;

@Service
public class SysSubjectServiceImpl implements SysSubjectService{
	
//	public void save(SysSubject subject);
//	
//	public void remove(int subject_id);
//	
//	public void update(SysSubject subject);
//	
//	public SysSubject getById();
//	
//	public List<SysSubject> query();
	
	@Autowired
	private SysSubjectMapper mapper;
	
	public void save(SysSubject subject){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			try {
				Date now = df.parse(df.format(new Date()));
				subject.setCreate_time(now);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			mapper.save(subject);
	}

	@Override
	public void remove(int subject_id) {
		if (subject_id > 0) {
			mapper.remove(subject_id);
		}
	}


	@Override
	public SysSubject getById(int subject_id) {
		if (subject_id > 0) {
			return mapper.getById(subject_id);
		}
		return null;
	}

	@Override
	public List<SysSubject> query(Map< Object, Object> map) {
		return mapper.queryChild(map);
	}

	@Override
	public void update(SysSubject subject) {
		mapper.update(subject);
	}

	@Override
	public List<SysSubject> queryParent(Map<Object, Object> map) {
		return mapper.queryParent(map);
	}
	
}
