package com.controller.web;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.EduCourse;
import com.bean.EduCourseKpoint;
import com.service.ConurseNoseService;
import com.service.CourseCommentService;
import com.service.CourseStudyhistoryService;
import com.service.EduNoseUserService;
import com.service.KpointNoseService;
import com.service.SubjectNoseService;
import com.service.TeacherNoseService;
import com.util.ObjectUtils;

@Controller
@RequestMapping("/front")
public class CouseNoseController {

	@Autowired
	private ConurseNoseService conurseNoseService;
	@Autowired
	private KpointNoseService kpointNoseService;
	@Autowired
	private SubjectNoseService subjectNoseService;
	@Autowired
	private TeacherNoseService teacherNoseService;
	@Autowired 
	private CourseStudyhistoryService courseStudyhistoryService;
	@Autowired
	private EduNoseUserService eduNoseUserService;
	@Autowired
	private CourseCommentService courseCommentService;
	@RequestMapping("/toCourseslist")
	public String toCourseslist(Model model,EduCourse course){
		model.addAttribute("courseList",conurseNoseService.listbyCourse(course));
		model.addAttribute("teacherList",teacherNoseService.listbyTeacher());
		model.addAttribute("subjectList",subjectNoseService.listbySubject());
		return "web/course/courses-list";
	}
	@RequestMapping("/tocourseinfor")
	public String tocourseinfor(Model model,int courseid){
		model.addAttribute("course",conurseNoseService.byIdcourse(courseid));
		model.addAttribute("teacherList",teacherNoseService.bysubjectTeacher(conurseNoseService.byIdcourse(courseid).getSubject_id()));
		model.addAttribute("parentKpointList",kpointNoseService.listbyKpoint(courseid));
		return "web/course/course-infor";
	}
	@RequestMapping("/tovedioplay")
	public String tovedioplay(Model model,int courseid){
		model.addAttribute("interfixCourse",conurseNoseService.byIdcourse(courseid));
		model.addAttribute("parentKpointList",kpointNoseService.listbyKpoint(courseid));
		model.addAttribute("SomeoneHas",eduNoseUserService.SomeoneHas(courseid));
		model.addAttribute("commentList",courseCommentService.listallCourseComment());
		return "web/course/player-video";
	}
	@RequestMapping("/ajax/getKopintHtml")
	public String getKopintHtml(Model model, HttpServletRequest request,@RequestParam("kpointId")int kpointId, HttpServletResponse response) {
		System.out.println(kpointId+"节点id");
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out=response.getWriter();
			EduCourseKpoint courseKpoint= kpointNoseService.bykopint(kpointId);
			System.out.println(courseKpoint.getVideo_Type());
			// 当传入数据不正确时直接返回
			if (ObjectUtils.isNull(courseKpoint)) {
				out.println("<script>var noCover=true; dialog dialog('提示','参数错误！',1);</script>");
				return null;
			}
			
			//获取课程
			EduCourse course = conurseNoseService.byIdcourse(courseKpoint.getCourse_Id());
			if (course==null) {
				return "web/course/videocode";
			}
			model.addAttribute("courseKpoint",courseKpoint);
			model.addAttribute("course",course);
				// 视频url
			String videourl = courseKpoint.getVideo_Url();
			System.out.println("视频url"+videourl);
				// 播放类型
			String videotype = courseKpoint.getVideo_Type();
				// 放入数据
			model.addAttribute("videourl", videourl);
			model.addAttribute("videotype", videotype);
			model.addAttribute("isok", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "web/course/videocode";
	}
	
}
