package com.service;

import java.util.List;
import java.util.Map;
import com.bean.EduCourse;
import com.bean.EduCourseKpoint;
import com.bean.TeacherBean;
import com.vo.TreeVo;

public interface EduCourseService {

	public void add(EduCourse course,String teacher_id);
	
	public void remove(String course_id);
	
	public void update(EduCourse course, String teacher_id);
	
	public EduCourse getById(String course_id);
	
	public List<EduCourse> query(Map<Object,Object> map);
	
	public List<TeacherBean> getTeacherByCourseId(String course_id);

	public List<TreeVo> getCourseNodes(int course_id);

	public void removeKpoint(int kpoint_id, int parent_id);

	public void addKpointParent(EduCourseKpoint kpoint);

	public void addKpoint(EduCourseKpoint kpoint);

	public EduCourseKpoint getKpointById(int kpoint_id);

	public void updateKpoint(EduCourseKpoint kpoint);

}
