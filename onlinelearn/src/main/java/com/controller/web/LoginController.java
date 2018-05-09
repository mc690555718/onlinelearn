package com.controller.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bean.Edu_User;
import com.service.Edu_UserService;
import com.util.Encryption;
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
		Result result = new Result();
		if (pwd == null && "".equals(pwd)) {
			result.setMessage("");
			result.setSuccess(false);
			return result;
		}
		pwd = Encryption.encryptionByMD5(email, pwd);
		System.out.println(pwd);
		String ipForget = request.getParameter("ipForget");
		Edu_User edu_User = service.getPwd(email);
		if (edu_User.getPassword().equals(pwd)) {
			result.setMessage("");
			result.setSuccess(true);
			session.setAttribute("login_success", edu_User);
			Edu_User user=(Edu_User)session.getAttribute("login_success");
			return result;
		}
		return result;
	}
	@RequestMapping("/front/uc/getloginUser")
	@ResponseBody
	public Result getLoginUser(HttpSession session,HttpServletResponse response) {
		Edu_User edu_User = (Edu_User) session.getAttribute("login_success");
		System.out.println(edu_User==null);
		if (edu_User == null) {
			return new Result(false, null, null);
		}else {
			return new Result(true, null, edu_User);
		}
	}
	@RequestMapping("/front/uc/exit")
	@ResponseBody
	public Result exitUser(HttpSession session) {
		session.removeAttribute("login_success");
		return new Result();
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
			user.setPassword( Encryption.encryptionByMD5(email,request.getParameter("user.password") ));
			user.setMobile(request.getParameter("user.mobile"));
			service.save(user);		
		}
		return new Result(true, null, null);
	}
}
