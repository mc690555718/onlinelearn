package com.controller.support;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bean.EduCourse;
import com.bean.SysSubject;
import com.service.EduCourseService;
import com.service.SysSubjectService;

@Controller
@RequestMapping("admin/cou")
public class EduCourseController {
	
	@Autowired
	private EduCourseService cs;
	@Autowired
	private SysSubjectService ss;

	@RequestMapping(value="list")
	public ModelAndView listCourse(ModelAndView mv,String qname,String subject_id,String add_time ,String end_time,String is_avaliable){
		
		System.out.println("qname :"+ qname +"\n subject_id : " + subject_id + "\n addtime : " +add_time +"\n endtime : "+end_time + "\n is_avaliable :" +is_avaliable);
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
		System.out.println("----------------------");
		for (Object key : map.keySet()) {
			System.out.println(key + ":" + map.get(key));
		}
		List<EduCourse> eduCourses  = cs.query(map);
		List<SysSubject> subjects = ss.query(null);
		mv.addObject("subjects",subjects);
		mv.addObject("eduCourses",eduCourses);
		mv.setViewName("/back/operation/courseList");
		return mv;
	}
}
