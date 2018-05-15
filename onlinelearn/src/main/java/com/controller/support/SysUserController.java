package com.controller.support;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bean.SysRole;
import com.bean.SysUser;
import com.service.SysRoleService;
import com.service.SysUserService;



@Controller
@RequestMapping(value="/admin/sysuser")
public class SysUserController {
	
	@Autowired
	private SysUserService us;
	@Autowired
	private SysRoleService rs;

	@RequestMapping("/userlist")
	public ModelAndView query(ModelAndView mv,String qname){
		List<SysUser> users = us.query(qname);
		mv.addObject("users", users);
		mv.setViewName("/back/admin/adminCtrl");
		return mv;
	}
	
	@RequestMapping("/deleteuser/{user_id}")
	public ModelAndView deleteuser(ModelAndView mv,@PathVariable("user_id")int user_id){
		us.remove(user_id);
		mv.setViewName("redirect:/admin/sysuser/userlist");
		return mv;
	}
	
	@RequestMapping("/toeditsysuser/{user_id}")
	public ModelAndView toEdit(ModelAndView mv,@PathVariable("user_id")int user_id){
		List<SysRole> roles = rs.query();
		SysUser user = us.getById(user_id);
		mv.addObject("user", user);
		mv.addObject("roles", roles);
		mv.setViewName("/back/admin/adminInfo");
		return mv;
	}
	
	@RequestMapping("/sysuseredit")
	public ModelAndView SysUserEdit(ModelAndView mv,SysUser user,int role_id,String user_status){
		user.setStatus(Integer.valueOf(user_status));
		user.setRole(rs.getById(role_id));
		us.edit(user);
		mv.setViewName("redirect:/admin/sysuser/userlist");
		return mv;
	}
	
	
	@RequestMapping("/updatepwd")
	@ResponseBody
	public int updatepwd(ModelAndView mv,String login_pwd,String user_id,String login_name){
		SysUser user = new SysUser();
		if (login_pwd != null && login_pwd.trim().length() != 0) {
			user.setLogin_pwd(login_pwd);
		}
		if (user_id != null && user_id.trim().length() != 0) {
			user.setUser_id(Integer.valueOf(user_id));
		}
		if (login_name != null && login_name.trim().length() != 0) {
			user.setLogin_name(login_name);
		}
		//若此行代码不加，会报    source is null for getProperty(null, "role_id")   异常
		user.setRole(new SysRole());
		us.edit(user);
		return 0;
	}
	
	@RequestMapping("/tocreateuser")
	public ModelAndView toCreateUser(ModelAndView mv){
		List<SysRole> roles = rs.query();
		mv.addObject("roles", roles);
		mv.setViewName("/back/admin/adminAdd");
		return mv;
	}
	
	@RequestMapping("/createuser")
	public ModelAndView createUser(ModelAndView mv,SysUser user,int role_id){
		user.setRole(rs.getById(role_id));
		us.add(user);
		mv.setViewName("redirect:/admin/sysuser/userlist");
		return mv;
	}
	
	
	
}
