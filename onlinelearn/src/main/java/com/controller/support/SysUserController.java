package com.controller.support;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bean.SysRole;
import com.bean.SysUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.SysRoleService;
import com.service.SysUserService;
import com.util.Encryption;



@Controller
@RequestMapping(value="/admin/sysuser")
public class SysUserController {
	
	@Autowired
	private SysUserService us;
	@Autowired
	private SysRoleService rs;

	@RequestMapping("/userlist")
	public ModelAndView query(ModelAndView mv,String qname,@RequestParam(required=true,defaultValue="1")Integer currentPage){
		
		//设置每页显示10条数据
		PageHelper.startPage(currentPage, 10);
		
		if(qname != null && qname.trim().length() != 0){
			mv.addObject("qname", qname);
		}
		List<SysUser> users = us.query(qname);

		//将数据加载为页面信息
		PageInfo<SysUser> info = new PageInfo<>(users);
		mv.addObject("info", info);
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
	public int updatepwd(ModelAndView mv,String login_pwd,String user_id){
		SysUser user = null;
		if (user_id != null && user_id.trim().length() != 0) {
			user =  us.getById(Integer.valueOf(user_id));
		}
		if (login_pwd != null && login_pwd.trim().length() != 0) {
			user.setLogin_pwd(login_pwd);
		}
		user.setLogin_pwd(Encryption.encryptionByMD5(user.getLogin_name(), user.getLogin_pwd()));
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
	
	/** 异步验证用户名是否存在
	 * @param login_name
	 * @return boolean
	 */
	@RequestMapping("/checkusername")
	@ResponseBody
	public boolean checkUsername(String login_name){
		if (login_name != null && login_name.trim().length() != 0) {
			SysUser user = us.getByName(login_name);
			if (user != null) {
				return false;
			}
		}
		return true;
	}
	
}
