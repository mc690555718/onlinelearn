package com.controller.support;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.bean.EduCourse;
import com.bean.SysSubject;
import com.bean.TeacherBean;
import com.service.EduCourseService;
import com.service.SysSubjectService;
import com.service.TeacherService;
import com.util.JsonUtils;

@Controller
@RequestMapping("admin/cou")
public class EduCourseController {

	@Autowired
	private EduCourseService cs;
	@Autowired
	private SysSubjectService ss;
	@Autowired
	private TeacherService ts;

	/**
	 * 查询课程  ,以及高级检索功能
	 * @param mv
	 * @param qname
	 * @param subject_id
	 * @param add_time
	 * @param end_time
	 * @param is_avaliable
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView listCourse(ModelAndView mv,String qname,String subject_id,String add_time ,String end_time,String is_avaliable){
		Map<Object, Object> map = new HashMap<>();
		if (qname != null && qname.trim().length() != 0) {
			map.put("qname", qname);
		}
		if (subject_id != null && Integer.valueOf(subject_id) > 0) {
			map.put("subject_id",Integer.valueOf(subject_id));
		}
		if (add_time != null && add_time.trim().length() != 0) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				map.put("add_time", df.parse(add_time));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (end_time != null && end_time.trim().length() != 0) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				map.put("end_time", df.parse(end_time));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (is_avaliable != null && Integer.valueOf(is_avaliable) > 0 ) {
			map.put("is_avaliable", Integer.valueOf(is_avaliable));
		}
		List<EduCourse> eduCourses  = cs.query(map);
		List<SysSubject> subjects = ss.query(null);
		mv.addObject("subjects",subjects);
		mv.addObject("eduCourses",eduCourses);
		mv.setViewName("/back/operation/courseList");
		return mv;
	}

	/**
	 * 进入添加课程页面
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping("/toCourseAdd")
	public ModelAndView toCourseAdd(ModelAndView mv){
		mv.setViewName("/back/operation/courseAdd");
		return mv;
	}


	/**
	 * 异步加载父专业
	 * @return List<SysSubject>
	 */
	@ResponseBody
	@RequestMapping("/getParent")
	public List<SysSubject> getParent(){
		return ss.queryParent(null);
	}

	/**
	 *  根据父专业id 查询子专业
	 * @param parent_id
	 * @return List<SysSubject>
	 */
	@ResponseBody
	@RequestMapping("/getSubject/{parent_id}")
	public List<SysSubject> getSubject(@PathVariable("parent_id")String parent_id){
		if (parent_id != null && parent_id.trim().length() !=0) {
			Map<Object, Object> map = new HashMap<>();
			map.put("parent_id", Integer.valueOf(parent_id));
			return ss.query(map);
		}
		return null;
	}

	/**
	 * 异步加载所有教师
	 * @return List<TeacherBean>
	 */
	@ResponseBody
	@RequestMapping("/getTeachers")
	public List<TeacherBean> getTeachers(){
		return ts.listAll(null);
	}
	

	/**异步加载课程id对应的教师 返回json集合
	 * @param course_id
	 * @return TeacherBean  
	 */
	@ResponseBody
	@RequestMapping("/getTeacher/{course_id}")
	public List<TeacherBean> getTeacher(@PathVariable("course_id")String course_id){
		return cs.getTeacherByCourseId(course_id);
	}

	
	
	/**
	 *  添加课程功能  ，添加完成后重定向至课程表格
	 * @param mv
	 * @param logo1
	 * @param request
	 * @param course
	 * @param parent_id
	 * @param subject_id
	 * @param teacher_id
	 * @param endTime
	 * @return ModelAndView
	 */
	@RequestMapping(value="/addCourse",method=RequestMethod.POST)
	public ModelAndView addCourse(ModelAndView mv,EduCourse course,String parent_id,
			String subject_id,String teacher_id,String endTime){
		//		System.out.println(logo1);
		//		System.out.println(course);
		//		System.out.println("parent_id :"+parent_id);
		//		System.out.println("subject_id :"+subject_id);
		//		System.out.println("teacher_id :"+teacher_id);
		//		System.out.println("endTime :"+endTime);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//解析时间转换date写入课程
		if (endTime != null && endTime.trim().length()!=0) {
			try {
				course.setEnd_time(format.parse(endTime));
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}
		
		//插入专业连接链
		if (parent_id != null && parent_id.trim().length()!=0 ) {
			SysSubject subject = new SysSubject();
			String subject_link = parent_id;
			if (subject_id != null && subject_id.trim().length()!=0 ) {
				subject_link += ","+subject_id;
				subject.setSubject_id(Integer.valueOf(subject_id));
			}else{
				subject.setSubject_id(Integer.valueOf(parent_id));
			}
			course.setSubject_link(subject_link);
			course.setSubject(subject);
		}

		//插入添加时间
		try {
			course.setAdd_time(format.parse(format.format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		cs.add(course,teacher_id);
		mv.setViewName("redirect:/admin/cou/list");
		return mv;
	}
	

	/**
	 * 删除课程by Id
	 * @param mv
	 * @param course_id
	 * @return ModelAndView
	 */
	@RequestMapping(value="/delCourse/{course_id}")
	public ModelAndView deleteCourse(ModelAndView mv,@PathVariable("course_id")String course_id){
		cs.remove(course_id);
		mv.setViewName("redirect:/admin/cou/list");
		return mv;
	}
	

	/**
	 * 跳转课程修改页面  ，将该id查询到的数据传出
	 * @param mv
	 * @param course_id
	 * @return ModelAndView
	 */
	@RequestMapping(value="/toCourseUpdate/{course_id}")
	public ModelAndView toCourseUpdate(ModelAndView mv,@PathVariable("course_id")String course_id){
		EduCourse course = cs.getById(course_id);
		mv.addObject("course", course);
		mv.setViewName("/back/operation/courseUpdate");
		return mv;
	}
	
	
	/**
	 * 异步上传课程图片logo  返回存储路径 json
	 * @param logo1
	 * @param request
	 * @return String
	 */
	@RequestMapping(value="/uploadImg",method=RequestMethod.POST)
	@ResponseBody
	public String uploadImg(@RequestParam("logo1")MultipartFile logo1,HttpServletRequest request){
		//上传图片
		if (logo1 != null) {
			String filename=logo1.getOriginalFilename();
			//upload文件夹的路径
			String path=request.getRealPath("/images/upload/course/");
			File newfile=new File(path,filename);
			try{
				//将客户端上传的文件复制到服务器中
				logo1.transferTo(newfile);
			}catch(Exception e){
				e.printStackTrace();
			}
			String imgPath = "/images/upload/course/"+filename;
			return JsonUtils.objectToJson(imgPath);
		}
	    return null;
	}
	
	
	/**
	 *   修改课程
	 * @param mv
	 * @param course
	 * @param parent_id
	 * @param subject_id
	 * @param teacher_id
	 * @param endTime
	 * @return ModelAndView
	 */
	@RequestMapping(value="/updateCourse",method=RequestMethod.POST)
	public ModelAndView updateCourse(ModelAndView mv,EduCourse course,String parent_id,
			String subject_id,String teacher_id,String endTime){

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//解析时间转换date写入课程
		if (endTime != null && endTime.trim().length()!=0) {
			try {
				course.setEnd_time(format.parse(endTime));
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}
		
		//插入专业连接链
		if (parent_id != null && parent_id.trim().length()!=0 ) {
			SysSubject subject = new SysSubject();
			String subject_link = parent_id;
			if (subject_id != null && subject_id.trim().length()!=0 ) {
				subject_link += ","+subject_id;
				subject.setSubject_id(Integer.valueOf(subject_id));
			}else{
				subject.setSubject_id(Integer.valueOf(parent_id));
			}
			course.setSubject_link(subject_link);
			course.setSubject(subject);
		}

		//插入修改时间
		try {
			course.setUpdate_time(format.parse(format.format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(course);
		cs.update(course,teacher_id);
		mv.setViewName("redirect:/admin/cou/list");
		return mv;
	}
	
	/**
	 * 根据id查询到 该课程的数据 跳转到       课程节点页面
	 * @param mv
	 * @param course_id
	 * @return ModelAndView
	 */
	@RequestMapping("/toCourseKpoint/{course_id}")
	public ModelAndView toCourseKpoint(ModelAndView mv,@PathVariable("course_id")int course_id){
		mv.setViewName("/back/operation/courseKpoint");
		return mv;
	}
	
}
