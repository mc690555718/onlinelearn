package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.LoginLogVo;

public interface EduUserEnrollTimeMapper {
	
	List<LoginLogVo> stuEnrollTime(Map map);

}
