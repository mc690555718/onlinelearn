package com.controller.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Edu_User;
import com.service.Edu_UserService;
import com.util.MD5Utils;
import com.util.Result;
@Controller
public class LoginController {
	@Autowired
	private Edu_UserService service;


	private static final String getKopintHtml = "/web/course/videocode";// 

	@RequestMapping("/front/login")
	@ResponseBody
	public Result frontLogin(HttpServletRequest request,
		HttpServletResponse response,HttpSession session) {
		String email = request.getParameter("account");
		String pwd = request.getParameter("password");
		System.out.println(email);
		System.out.println(pwd);
		Result result = new Result();
		if (pwd == null && "".equals(pwd)) {
			result.setMessage("");
			result.setSuccess(false);
			return result;
		}
		pwd = MD5Utils.md5(pwd);
		String ipForget = request.getParameter("ipForget");
		Edu_User edu_User = service.getPwd(email);
		if (edu_User.getPassword().equals(pwd)) {
			result.setMessage("");
			result.setSuccess(true);
			session.setAttribute("login_success", edu_User);
			Edu_User user=(Edu_User)session.getAttribute("login_success");
			System.out.println(result);
			return result;
		}
		return result;
	}


	@RequestMapping("/front/uc/createuser")
	@ResponseBody
	public Result createUser(HttpServletRequest request) {
		Edu_User user = new Edu_User();
		String email = request.getParameter("user.email");
		Edu_User edu_User = service.getPwd(email);
		if (edu_User.getEmail().equals(email)) {
			return new Result(false, null, null);
		} else {
			user.setEmail(email);
			user.setPassword(MD5Utils.md5(request.getParameter("user.password")));
			user.setMobile(request.getParameter("user.mobile"));
			service.save(user);		
		}

		return new Result(true, null, null);
	}
	@RequestMapping("/front/uc/index/{userName}")
	public String  index(@PathVariable("userName")String userName,Model model) {	

		Edu_User edu_User = service.getPwd(userName);
		model.addAttribute("user", edu_User);
		return "/layouts/web/header";

	}

}
