package com.mapper;

import java.util.List;
import java.util.Map;
import com.bean.EduCourse;
import com.bean.EduCourseKpoint;
import com.bean.TeacherBean;

public interface EduCourseMapper {
	
	public void remove(int course_id);
	
	public void update(EduCourse course);
	
	public EduCourse getById(int course_id);
	
	public List<EduCourse> query(Map<Object, Object> map);
	
	public void add(EduCourse course);

	public int setTeacher(Map<Object, Object> map);
	
	public List<TeacherBean> getTeacherByCourseId(int course_id);
	
	public void removeCourseTeacher(int course_id);

	/** 通过课程id 查询所有的  该课程下的所有章节
	 * @param course_id
	 * @return List<EduCourseKpoint>
	 */
	public List<EduCourseKpoint> getKpointByCourseId(int course_id);

	/** 删除  edu_course_kpoint 表 的  所有父id下 的 数据 
	 * @param parent_id
	 */
	public void removeKpointByParentId(int parent_id);

	/*删除  edu_course_kpoint 表 的  数据 通过id
	 * @param kpoint_id
	 */
	public void removeKpointById(int kpoint_id);

	/** 增加章节父节点
	 * @param kpoint
	 */
	public void addKpointParent(EduCourseKpoint kpoint);

	/**添加子节点
	 * @param kpoint
	 */
	public void addKpoint(EduCourseKpoint kpoint);

	/**通过Id查询到一个Kpoint对象返回
	 * @param kpoint_id
	 * @return EduCourseKpoint
	 */
	public EduCourseKpoint getKpointById(int kpoint_id);

	/**修改节点
	 * @param kpoint
	 */
	public void updateKpoint(EduCourseKpoint kpoint);

}
