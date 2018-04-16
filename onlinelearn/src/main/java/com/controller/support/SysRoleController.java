package com.controller.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.SysRole;
import com.service.SysFunctionService;
import com.service.SysRoleService;

@Controller
@RequestMapping(value="/admin/sysrole")
public class SysRoleController {

	@Autowired
	private SysRoleService rs ;
	@Autowired
	private SysFunctionService fs;
	
	
	@RequestMapping("/addrole")
	public ModelAndView addRole(ModelAndView mv , String role_name ){
		SysRole role = new SysRole();
		role.setRole_name(role_name);
		rs.add(role);
		mv.setViewName("redirect:/admin/sysfunctioin/showfunctionztree");
		return mv;
	}
	
	
	@RequestMapping("/saveroelfunction")
	public ModelAndView saveRoelFunction(ModelAndView mv , int role_id ,String perid){
	    String[] function_ids = perid.split(",");
	    fs.addRoleFunctions(role_id, function_ids);
		mv.setViewName("redirect:/admin/sysfunctioin/showfunctionztree");
		return mv;
	}
	
	@RequestMapping("/deleterole")
	public ModelAndView deleteRole(ModelAndView mv , int role_id){
		rs.remove(role_id);
		mv.setViewName("redirect:/admin/sysfunctioin/showfunctionztree");
		return mv;
	}
}
