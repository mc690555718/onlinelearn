package com.controller.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bean.CourseCommentUser;
import com.bean.Course_purchase;
import com.bean.EduCourse;
import com.bean.EduCourseFavorites;
import com.bean.EduCourseKpoint;
import com.bean.EduCourseNote;
import com.bean.Edu_User;
import com.service.ConurseNoseService;
import com.service.CourseCommentService;
import com.service.CourseStudyhistoryService;
import com.service.Course_purchaseService;
import com.service.EduNoseUserService;
import com.service.KpointNoseService;
import com.service.SubjectNoseService;
import com.service.TeacherNoseService;
import com.util.JsonUtils;
import com.util.ObjectUtils;
import com.util.Result;

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
	@Autowired
	private Course_purchaseService course_purchaseService;
	@RequestMapping("/toCourseslist")
	public String toCourseslist(Model model,EduCourse course){
		//查询全部课程,此参数为模糊查询所用
		model.addAttribute("courseList",conurseNoseService.listbyCourse(course));
		//查询全部教师
		model.addAttribute("teacherList",teacherNoseService.listbyTeacher());
		//查询全部课程
		model.addAttribute("subjectList",subjectNoseService.listbySubject());
		return "web/course/courses-list";
	}
	@RequestMapping("/tocourseinfor")
	public String tocourseinfor(Model model,int courseid){
		//查询对应的课程详情,传入参数为课程Id
		model.addAttribute("course",conurseNoseService.byIdcourse(courseid));
		//查询对应的教师，传入参数为课程Id
		model.addAttribute("teacherList",teacherNoseService.bysubjectTeacher(conurseNoseService.byIdcourse(courseid).getSubject_id()));
		//查出对应的课程节点,传入参数为课程Id
		model.addAttribute("parentKpointList",kpointNoseService.listbyKpoint(courseid));
		return "web/course/course-infor";
	}
	//此方法现在无用
	@RequestMapping("/comment/webcomment2")
	public String comment2(Model model,int otherId){
		Map m=new HashMap<>();
		m.put("type", 2);
		m.put("other_id", otherId);
		List<CourseCommentUser> listallCourseComment = courseCommentService.listallCourseComment(m);
		if(listallCourseComment!=null&&listallCourseComment.size()>0){
			for(int i=0;i<listallCourseComment.size();i++){
				Map m2=new HashMap<>();
				m2.put("p_comment_id", listallCourseComment.get(i).getComment_id());
				System.out.println("父iD"+listallCourseComment.get(i).getComment_id());
				m2.put("type", 2);
				 List<CourseCommentUser> listallCourseCommentSon = courseCommentService.listallCourseCommentSon(m2);
				 System.out.println(listallCourseCommentSon.size());
				 if(listallCourseCommentSon!=null&&listallCourseCommentSon.size()>0){
					 listallCourseComment.get(i).setSon(listallCourseCommentSon);
					}
				 }
			}
		model.addAttribute("commentList",listallCourseComment);
		System.out.println("进入了重新请求方法");
		return "web/course/comment";
	}
	//课程子评论显示，现在用的是康骁的，无用
	@RequestMapping("/article/webcomment1")
	public String comment(Model model,int otherId){
		Map m=new HashMap<>();
		m.put("type", 2);
		m.put("other_id", otherId);
		List<CourseCommentUser> listallCourseComment = courseCommentService.listallCourseComment(m);
		if(listallCourseComment!=null&&listallCourseComment.size()>0){
			for(int i=0;i<listallCourseComment.size();i++){
				Map m2=new HashMap<>();
				m2.put("p_comment_id", listallCourseComment.get(i).getComment_id());
				System.out.println("父iD"+listallCourseComment.get(i).getComment_id());
				m2.put("type", 2);
				 List<CourseCommentUser> listallCourseCommentSon = courseCommentService.listallCourseCommentSon(m2);
				 System.out.println(listallCourseCommentSon.size());
				 if(listallCourseCommentSon!=null&&listallCourseCommentSon.size()>0){
					 listallCourseComment.get(i).setSon(listallCourseCommentSon);
					}
				 }
			}
		model.addAttribute("commentList",listallCourseComment);
		System.out.println(listallCourseComment.size());
		return "web/course/comment";
	}
	//用于检测是否对付费课程付费
	@RequestMapping("/tovedioplay")
	public String cheak(Model model,Course_purchase purchase,HttpSession session,HttpServletResponse response){
		Edu_User edu_User=(Edu_User)session.getAttribute("login_success");
		purchase.setUserId(edu_User.getUser_id());
		Boolean status = course_purchaseService.queryStatus(purchase);
		if(status==false){
			Cookie cookpurchase = new Cookie("cookpurchase",JsonUtils.objectToJson(purchase));
			response.addCookie(cookpurchase);
			return "redirect:/front/tocourseinfor?courseid="+purchase.getCourseId()+"&course_status=0/0";
		}else{
			return "redirect:/front/tovedioplay2?courseid="+purchase.getCourseId();
		}
	}
	//课程播放
	@RequestMapping("/tovedioplay2")
	public String tovedioplay(Model model,int courseid){
		model.addAttribute("interfixCourse",conurseNoseService.byIdcourse(courseid));
		model.addAttribute("parentKpointList",kpointNoseService.listbyKpoint(courseid));
		model.addAttribute("SomeoneHas",eduNoseUserService.SomeoneHas(courseid));
		model.addAttribute("courseId",courseid);
		if(kpointNoseService.listbyKpoint(courseid)!=null&&kpointNoseService.listbyKpoint(courseid).size()>1){
			model.addAttribute("first",kpointNoseService.listbyKpoint(courseid).get(0).getKpoint_id());
		}
		return "web/course/player-video";
		}
	
	@RequestMapping("/ajax/getKopintHtml")
	public String getKopintHtml(Model model, HttpServletRequest request,@RequestParam("kpointId")int kpointId, HttpServletResponse response) {
		System.out.println(kpointId+"节点id");
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out=response.getWriter();
			EduCourseKpoint courseKpoint= kpointNoseService.bykopint(kpointId);
			System.out.println(courseKpoint.getVideo_type());
			// 当传入数据不正确时直接返回
			if (ObjectUtils.isNull(courseKpoint)) {
				out.println("<script>var noCover=true; dialog dialog('提示','参数错误！',1);</script>");
				return null;
			}
			
			//获取课程
			EduCourse course = conurseNoseService.byIdcourse(courseKpoint.getCourse_id());
			if (course==null) {
				return "web/course/videocode";
			}
			model.addAttribute("courseKpoint",courseKpoint);
			model.addAttribute("course",course);
				// 视频url
			String videourl = courseKpoint.getVideo_url();
			System.out.println("视频url"+videourl);
				// 播放类型
			String videotype = courseKpoint.getVideo_type();
				// 放入数据
			model.addAttribute("videourl", videourl);
			model.addAttribute("videotype", videotype);
			model.addAttribute("isok", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "web/course/videocode";
	}
	//课程笔记初始添加
	@RequestMapping("/courseNote/ajax/addnote")
	@ResponseBody
	public Result addnode(EduCourseNote courseNote,HttpSession session){
		Result result=new Result();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		courseNote.setUserId(user.getUser_id());
		EduCourseNote querynode = conurseNoseService.querynode(courseNote);
		System.out.println(courseNote.getContent());
		if(querynode!=null){
			if(!"".equals(querynode.getContent())&&querynode.getContent()!=null){
				conurseNoseService.updatenode(courseNote);
				System.out.println("执行修改");
				result.setMessage("success");
				return result;
			}
		}
			conurseNoseService.addnode(courseNote);
			System.out.println("执行添加");
		result.setMessage("success");
		return result;
	}
	//课程笔记修改保存
	@RequestMapping("/courseNote/ajax/querynote")
	@ResponseBody
	public String querynode(EduCourseNote courseNote,HttpSession session){
		Result result=new Result();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		courseNote.setUserId(user.getUser_id());
		courseNote = conurseNoseService.querynode(courseNote);
		result.setEntity(courseNote);
		return JsonUtils.objectToJson(result);
	}
	@RequestMapping("/createfavorites")
	@ResponseBody
	public Result addlove(EduCourseFavorites courseFavorites,HttpSession session){
		Result result=new Result();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		courseFavorites.setUserId(user.getUser_id());
		boolean is = conurseNoseService.isNull(courseFavorites);
		if(is==true){
			result.setSuccess(false);
			return result;
		}else{
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String SendTime=df.format(new Date());
			courseFavorites.setAddTime(SendTime);
			conurseNoseService.addLove(courseFavorites);
			result.setSuccess(true);
			return result;
		}
		
	}
	@RequestMapping("/index/ajax/bna")
	public String bna(@RequestParam("order") String type,Model model){
		if("FOLLOW".equals(type)){//精品
			//查询全部课程,此参数为模糊查询所用
			model.addAttribute("courseList",conurseNoseService.byprice());
			//查询全部教师
			model.addAttribute("teacherList",teacherNoseService.listbyTeacher());
			//查询全部课程
			model.addAttribute("subjectList",subjectNoseService.listbySubject());
			return "web/course/courses-list";
		}else if("NEW".equals(type)){//最新
			//查询全部课程,此参数为模糊查询所用
			model.addAttribute("courseList",conurseNoseService.bytime());
			//查询全部教师
			model.addAttribute("teacherList",teacherNoseService.listbyTeacher());
			//查询全部课程
			model.addAttribute("subjectList",subjectNoseService.listbySubject());
			return "web/course/courses-list";
		}else{//全部
			//查询全部课程,此参数为模糊查询所用
			model.addAttribute("courseList",conurseNoseService.byall());
			//查询全部教师
			model.addAttribute("teacherList",teacherNoseService.listbyTeacher());
			//查询全部课程
			model.addAttribute("subjectList",subjectNoseService.listbySubject());
			return "web/course/courses-list";
		}
	}
		
}
