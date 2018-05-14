package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.EduDayCouseTimeMapper;
import com.service.EduDayCouseTimeService;
import com.vo.LoginLogVo;

@Service
public class EduDayCouseTimeServiceImpl implements EduDayCouseTimeService{
	        
	        @Autowired
	        private EduDayCouseTimeMapper edt;
	        
			public List<LoginLogVo> EduDayCouseTime(Map map) {
				List<LoginLogVo> list=edt.dayCouseTime(map);
				return list;
			}

}
