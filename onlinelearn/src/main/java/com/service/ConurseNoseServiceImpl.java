package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.EduCourse;
import com.bean.EduCourseFavorites;
import com.bean.EduCourseNote;
import com.mapper.ConurseNoseMapper;
@Service
public class ConurseNoseServiceImpl implements ConurseNoseService{

	@Autowired
	private ConurseNoseMapper conurseNoseMapper;

	public List<EduCourse> listbyCourse(EduCourse course) {
		return conurseNoseMapper.listbyCourse(course);
	}

	public EduCourse byIdcourse(int courseid) {
		return conurseNoseMapper.byIdcourse(courseid);
	}

	public void addnode(EduCourseNote courseNote) {
		conurseNoseMapper.addnode(courseNote);
	}

	public void updatenode(EduCourseNote courseNote) {
		conurseNoseMapper.updatenode(courseNote);
	}

	public EduCourseNote querynode(EduCourseNote courseNote) {
		return conurseNoseMapper.querynode(courseNote);
	}

	@Override
	public List<EduCourse> listCourses(Map<Object, Object> map) {
		System.out.println(map.get("current_price"));
		return conurseNoseMapper.listCourses(map);
	}

	@Override
	public List<EduCourse> getFavoriteCourse(int user_id) {
		if (user_id > 0) {
			return conurseNoseMapper.getFavoriteCourse(user_id);
		}
		return null;
	}

	public boolean isNull(EduCourseFavorites courseFavorites) {
		return conurseNoseMapper.isNull(courseFavorites);
	}

	public void addLove(EduCourseFavorites courseFavorites) {
		  conurseNoseMapper.addLove(courseFavorites);
	}

	@Override
	public List<EduCourse> bytime() {
		return conurseNoseMapper.bytime();
	}

	@Override
	public List<EduCourse> byprice() {
		return conurseNoseMapper.byprice();
	}

	@Override
	public List<EduCourse> byall() {
		return conurseNoseMapper.byall();
	}

	//取消收藏
	@Override
	public void deleteFaveoriteById(int user_id, int course_id) {
		if (user_id > 0 && course_id > 0) {
			Map< Object, Object> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("course_id", course_id);
			conurseNoseMapper.deleteFaveoriteById(map);
		}
		
	}
    //批量  取消收藏
	@Override
	public void deleteFaveorite(int user_id, String courseIdStr) {
		String[] courseIds = courseIdStr.split(",");
		for (String course_id : courseIds) {
			deleteFaveoriteById(user_id, Integer.parseInt(course_id));
		}
	}
}
