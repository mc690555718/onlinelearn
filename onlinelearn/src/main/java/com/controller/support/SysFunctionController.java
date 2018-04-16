package com.controller.support;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bean.SysFunction;
import com.bean.SysRole;
import com.service.SysFunctionService;
import com.service.SysRoleService;
import com.service.TreeVoService;
import com.vo.TreeVo;

@Controller
@RequestMapping("/admin/sysfunctioin")
public class SysFunctionController {

	@Autowired
	private SysFunctionService fs;
	
	@Autowired
	private SysRoleService rs;
	
	@RequestMapping(value="/showfunctionztree")
	public ModelAndView loadTree(ModelAndView mv){
		List<SysRole> roles = rs.query();
		mv.addObject("roles",roles);
		mv.setViewName("/back/permission/permission");
		return mv;
	}
	
	@RequestMapping(value="/loadtree")
	@ResponseBody
	public List<TreeVo> loadTree(String role_id){
		SysRole role = null;
		if (role_id == null || role_id.trim().length() == 0) {
			role = rs.getfirstRole();
		}else{
			role = rs.getById(Integer.valueOf(role_id));
		}
		List<SysFunction> functions = fs.query();
		TreeVoService ts = new TreeVoService();
		List<TreeVo> vos = ts.setTree(functions,role);
		return vos;
	}
}
