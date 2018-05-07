package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.EduCourse;
import com.mapper.EduCourseMapper;;

@Service
public class EduCourseServiceImpl implements EduCourseService{
	
	@Autowired
	private EduCourseMapper mapper;

	public void add(EduCourse course,String teacher_id){
		//添加课程返回主键到该对象
		if (course != null) {
			mapper.add(course);
			System.out.println(course.getCourse_id());
		}
		String teaIds[] = null;
		//拆分字符串,根据课程id和教师id添加   edu_course_teacher
		if (teacher_id != null) {
			Map<Object, Object> map = new HashMap<>();
			teaIds = teacher_id.split(",");
			for (int i = 0; i < teaIds.length; i++) {
				map.put("course_id", course.getCourse_id());
				map.put("teacher_id", Integer.valueOf(teaIds[i]));
				mapper.setTeacher(map);
			}
		}
		
	}
	
//	public void remove(int course_id);
//	
//	public void update(EduCourse course);
//	
//	public EduCourse getById();
	
	public List<EduCourse> query(Map<Object, Object> map){
		return mapper.query(map);
	}
	
}
