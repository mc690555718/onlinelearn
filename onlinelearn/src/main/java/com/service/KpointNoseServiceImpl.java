package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.EduCourseKpoint;
import com.mapper.KpointNoseMapper;
@Service
public class KpointNoseServiceImpl implements KpointNoseService{

	@Autowired
	private KpointNoseMapper Kpointmapper;

	@Override
	public List<EduCourseKpoint> listbyKpoint(int courseId) {
		return Kpointmapper.listbyKpoint(courseId);
	}
}
