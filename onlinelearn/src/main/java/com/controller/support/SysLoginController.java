package com.controller.support;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bean.SysUser;
import com.service.SysUserService;

@Controller
@RequestMapping("/admin/back")
public class SysLoginController {
	
	@Autowired
	private SysUserService userService;
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
			    subject.hasRole("");
			}catch(Exception e){
				mv.setViewName("/back/login/login");
				return mv;
			}
		}
		SysUser sysuser = userService.getByName(user.getLogin_name());
		mv.addObject("user",sysuser);
		mv.setViewName("/back/operation/index");
		return mv;
	}
	
}
