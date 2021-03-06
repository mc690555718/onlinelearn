package com.controller.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.EduCourse;
import com.bean.Edu_User;
import com.bean.Questions;
import com.bean.Questions_comment;
import com.service.ConurseNoseService;
import com.service.Edu_UserService;
import com.service.QuestionsService;
import com.service.Questions_commentService;
import com.util.Encryption;
import com.util.Result;

@Controller
@RequestMapping("/uc")
public class UserCenterController {

	@Autowired
	private Edu_UserService service;
	@Autowired
	private QuestionsService questionsService;
    @Autowired
    private Questions_commentService questions_commentService;
    @Autowired
    private ConurseNoseService conurseNoseService;


	@RequestMapping("/index")
	public String index(){
		return "web/ucenter/uc_freecourse";
	}

	@RequestMapping("/initUpdateUser/0")
	public String initUpdateUser0(Model model){
		model.addAttribute("index", 0);
		return "web/ucenter/user-info";
	}
	@RequestMapping("/initUpdateUser/1")
	public String initUpdateUser1(Model model){
		model.addAttribute("index", 1);

		return "web/ucenter/user-info";
	}
	@RequestMapping("/initUpdateUser/2")
	public String initUpdateUser2(Model model){
		model.addAttribute("index",2);
		return "web/ucenter/user-info";
	}

	@RequestMapping("/myquestions/list")
	public ModelAndView myquestions(HttpSession session){
		ModelAndView mv = new ModelAndView();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		int id = user.getUser_id();
		List<Questions> questions = questionsService.listById(id);
		mv.addObject("questions", questions);
		mv.setViewName("web/ucenter/questions-mylist");
		return mv;

	}
	@RequestMapping("/myrepquestions/list")
	public ModelAndView myrepquestions(HttpSession session){
		ModelAndView mv = new ModelAndView();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		int cid = user.getUser_id();
		List<Questions_comment> comments = questions_commentService.getByCid(cid);
		mv.addObject("comments", comments);
		mv.setViewName("/web/ucenter/questions-myreplist");
		return mv;

	}

	@RequestMapping("/updatePwd")
	@ResponseBody
	public Result updatePwd(HttpServletRequest request,HttpSession session) {

		Result result = new Result();
		//		拿到数据库的密码
		Edu_User users1=(Edu_User) session.getAttribute("login_success");
		String password=users1.getPassword();
		int user_id=users1.getUser_id();
		String email=users1.getEmail();
		//		新密码
		String newPassword =request.getParameter("newPassword");
		//		旧密码
		String nowPassword =request.getParameter("nowPassword");
		nowPassword = Encryption.encryptionByMD5(email, nowPassword);
		//		再次输入密码
		String confirmPwd = request.getParameter("confirmPwd");
		//	 	与以前的密码判断
		if (password.equals(nowPassword)) {
			//       判断两次密码是否一致
			if (newPassword.equals(confirmPwd)) {
				Edu_User users = new Edu_User();
				String pwd=Encryption.encryptionByMD5(email, newPassword);
				users.setPassword(pwd);
				users.setUser_id(user_id);
				service.updatepwd(users);
				session.removeAttribute("login_success");
				return new Result(true, "yes！Please logo on again", null);
			}else {
				return new Result(false, "no！", null);
			}
		}else {
			return new Result(false, "nos！", null);
		}
	}

	@RequestMapping("/updateUser")
	@ResponseBody
	public Result updateUser(Edu_User user){
		System.out.println("222");
		if (user==null) {
			return new Result(false, "update feiled", 0);
		}else {
			service.updateUser(user);
			return  new  Result(true, "update sessucess!", 0);
		}
	}
	/**
	 * @param file
	 * @param request
	 * @param session
	 * 修改头像
	 * @return
	 */
	@RequestMapping("/updateImg")
	@ResponseBody
	public Result updateImg(@RequestParam(value="file",required = false)MultipartFile file,HttpServletRequest request,HttpSession session){
		Edu_User loginUser = (Edu_User) session.getAttribute("login_success");
		Result result=new Result();
		if(file != null) {
            //上传文件路径
            String path = request.getRealPath("/images/upload/customer/20150910/");
            //上传文件名
            String filename = file.getOriginalFilename();
            if(filename==null||"".equals(filename)){
            	result.setSuccess(false);
            	result.setMessage("2");
            }
            String a[]=filename.split("\\.");
            if(!a[1].equalsIgnoreCase("BMP")||!a[1].equalsIgnoreCase("JPEG")||!a[1].equalsIgnoreCase("PSD")||!a[1].equalsIgnoreCase("PCX")
            		||!a[1].equalsIgnoreCase("PNG")||!a[1].equalsIgnoreCase("DXF")||!a[1].equalsIgnoreCase("CDR")
            		||!a[1].equalsIgnoreCase("ICO")
            		){
            	result.setSuccess(false);
            	result.setMessage("1");
            }
            File filepath = new File(path,filename);         
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            try {
				file.transferTo(new File(path + File.separator + filename));
			} catch (Exception e) {
				e.printStackTrace();
			} 
            loginUser.setPic_img("/images/upload/customer/20150910/"+filename);
            service.updateImg(loginUser);
            result.setSuccess(true);
		}
		return result;
	}
	
	//个人中心免费课程
	@RequestMapping("/freeCourseList")
	public ModelAndView freeCourseList(ModelAndView mv){
		//课程当前价格为0,则为免费
		int current_price = 0;
		Map< Object, Object> map = new HashMap<>();
		map.put("current_price", current_price);
		mv.addObject("courseList", conurseNoseService.listCourses(map));
		mv.setViewName("/web/ucenter/uc_freecourse");
		return mv;
	}
	
	//个人中心收藏课程
	@RequestMapping("/myFavorites")
	public ModelAndView myFavorites(ModelAndView mv,HttpSession session){
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		List<EduCourse> courses = conurseNoseService.getFavoriteCourse(user.getUser_id());
		mv.addObject("favoriteList", courses);
		mv.addObject("user_id", user.getUser_id());
		mv.setViewName("/web/ucenter/favourite_course_list");
		return mv;
	}
	
	//个人中心取消收藏课程
	@RequestMapping("/deleteFaveoriteById/{course_id}")
	public ModelAndView deleteFaveoriteById(ModelAndView mv,HttpSession session,@PathVariable("course_id")int course_id){
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		conurseNoseService.deleteFaveoriteById(user.getUser_id(),course_id);
		mv.setViewName("redirect:/uc/myFavorites");
		return mv;
	}
	
	//个人中心取消收藏课程
	@RequestMapping("/deleteFaveorite/{courseIdStr}")
	public ModelAndView deleteFaveorite(ModelAndView mv,HttpSession session,@PathVariable("courseIdStr")String courseIdStr){
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		conurseNoseService.deleteFaveorite(user.getUser_id(),courseIdStr);
		mv.setViewName("redirect:/uc/myFavorites");
		return mv;
	}
	
	

}
