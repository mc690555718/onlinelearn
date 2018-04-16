package com.controller.support;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bean.SysUser;

@Controller
@RequestMapping("/admin/back")
public class SysLoginController {
	
	@RequestMapping(value="/login")
	public ModelAndView login(ModelAndView mv){
		mv.setViewName("/back/login/login");
		return mv;
	}
	
	@RequestMapping(value="/main")
	public ModelAndView toMain(ModelAndView mv){
		mv.setViewName("/back/operation/main");
		return mv;
	}
	
	
	@RequestMapping(value="/checkAdmin")
	public ModelAndView checkAdmin(ModelAndView mv,SysUser user){
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getLogin_name(), user.getLogin_pwd());
		token.setRememberMe(true);
		if (!subject.isAuthenticated()) {
			try{
			    subject.login(token);
			}catch(Exception e){
				e.printStackTrace();
				mv.setViewName("/back/login/login");
				return mv;
			}
		}
		subject.hasRole("");
//		Admin user = as.getAdminByName(admin.getUsername());
//		System.out.println(user.getAid());
//		session.setAttribute("user",user);
		mv.setViewName("/back/operation/index");
		return mv;
	}
	
}
