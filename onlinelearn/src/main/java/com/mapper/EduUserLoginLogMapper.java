package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.LoginLogVo;

public interface EduUserLoginLogMapper {
	
	List<LoginLogVo> listTime(Map map);
	
    
}