package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.SysSubject;
import com.mapper.SubjectNoseMapper;
@Service
public class SubjectNoseServiceImpl implements SubjectNoseService{

	@Autowired
	private SubjectNoseMapper subjectNoseMapper;

	@Override
	public List<SysSubject> listbySubject() {
		return subjectNoseMapper.listbySubject();
	}

}
