package com.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.SysSubject;
import com.mapper.SysSubjectMapper;
import com.util.CharTool;

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
	
	public void save(String subject_name){
		if (subject_name!=null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			SysSubject subject = new SysSubject();
			subject.setSubject_name(subject_name);
			try {
				Date now = df.parse(df.format(new Date()));
				subject.setCreate_time(now);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			mapper.save(subject);
		}
	}

	@Override
	public void remove(int subject_id) {
		if (subject_id > 0) {
			mapper.remove(subject_id);
		}
	}

	@Override
	public void update(String subject_name,String sort,String subject_id) {
		SysSubject subject = new SysSubject();
		if (subject_name != null && subject_name.trim().length() != 0) {
			String name = CharTool.setCharEncoding(subject_name);
			subject.setSubject_name(name);
		}
		if (sort == null || sort.trim().length() == 0) {
			sort = "0";
		}
		subject.setSort(Integer.valueOf(sort));
		if (subject_id != null && subject_id.trim().length() != 0) {
			subject.setSubject_id(Integer.valueOf(subject_id));
		}
		mapper.update(subject);
	}

	@Override
	public SysSubject getById(int subject_id) {
		if (subject_id > 0) {
			return mapper.getById(subject_id);
		}
		return null;
	}

	@Override
	public List<SysSubject> query(String qname) {
		Map< Object, Object> map = new HashMap<>();
		if (qname != null && qname.trim().length() != 0) {
			map.put("qname", qname);
		}
		return mapper.query(map);
	}
	
}
