package com.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Edu_User;
import com.bean.Questions;
import com.bean.Questions_comment;
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


}
