package com.service;

import java.util.ArrayList;
import java.util.List;
import com.bean.SysFunction;
import com.bean.SysRole;
import com.vo.TreeVo;

public class TreeVoService {

	public List<TreeVo> setTree(List<SysFunction> functions,SysRole role){
		List<TreeVo> vos = new ArrayList<>();
		for (SysFunction function : functions) {
			TreeVo vo = new TreeVo();
			vo.setId(function.getFunction_id());
			vo.setpId(function.getParent_id());
			vo.setName(function.getFunction_name());
			for (SysFunction fun : role.getFunctions()) {
				if (fun.getFunction_id() == function.getFunction_id()) {
					vo.setChecked(true);
					if (fun.getParent_id() == 0) {
						vo.setOpen(true);
					}
				}
			}
			vos.add(vo);
		}
	    return vos;
	}
    
}
