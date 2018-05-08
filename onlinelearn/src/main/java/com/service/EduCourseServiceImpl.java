package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.EduCourse;
import com.bean.TeacherBean;
import com.mapper.EduCourseMapper;;

@Service
public class EduCourseServiceImpl implements EduCourseService{

	@Autowired
	private EduCourseMapper mapper;

	public void add(EduCourse course,String teacher_id){
		//添加课程返回主键到该对象
		if (course != null) {
			mapper.add(course);
		}
		if (teacher_id != null) {
			//拆分字符串,根据课程id和教师id添加   edu_course_teacher
			String teaIds[] = teacher_id.split(",");
			for (int i = 0; i < teaIds.length; i++) {
				Map<Object, Object> map = new HashMap<>();
				map.put("course_id", course.getCourse_id());
				map.put("teacher_id", Integer.valueOf(teaIds[i]));
				mapper.setTeacher(map);
			}
		}
	}

	//此处是一个逻辑删除课程  ，改变状态为3
	public void remove(String course_id){
		if (course_id != null && course_id.trim().length() != 0) {
			mapper.remove(Integer.valueOf(course_id));
		}
	}


	//通过ID得到一个 课程对象
	public EduCourse getById(String course_id){
		if (course_id != null && course_id.trim().length() != 0) {
			return mapper.getById(Integer.valueOf(course_id));
		}
		return null;
	}

	public List<EduCourse> query(Map<Object, Object> map){
		return mapper.query(map);
	}


	@Override
	//通过课程id查询中间表返回 教师集合
	public List<TeacherBean> getTeacherByCourseId(String course_id) {
		if (course_id != null && course_id.trim().length() != 0) {
			List<TeacherBean> beans = mapper.getTeacherByCourseId(Integer.valueOf(course_id));
			return beans;
		}
		return null;
	}

	@Override
	//修改课程
	public void update(EduCourse course, String teacher_id) {
		if (course != null) {
			mapper.update(course);
		}
		//拆分   教师链   字符串,根据课程id和教师id添加   edu_course_teacher
		if (teacher_id != null) {
			//删除该   课程_ 教师   所有关系
			mapper.removeCourseTeacher(course.getCourse_id());
			//循环加入该   课程_ 教师   新关系
			String teaIds[]  = teacher_id.split(",");
			for (int i = 0; i < teaIds.length; i++) {
				Map<Object, Object> map = new HashMap<>();
				map.put("course_id", course.getCourse_id());
				if (teaIds[i]!=null && teaIds[i].trim().length() != 0) {
					map.put("teacher_id", Integer.valueOf(teaIds[i]));
				}
				mapper.setTeacher(map);
			}
		}
	}


}
