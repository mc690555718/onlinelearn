package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.EduUserEnrollTimeMapper;
import com.service.EduUserEnrollTimeService;
import com.vo.LoginLogVo;

@Service
public class EduUserEnrollServiceImpl implements EduUserEnrollTimeService {
	           
	           @Autowired
	           private EduUserEnrollTimeMapper eut;

			
			public List<LoginLogVo> listEnrollTime(Map map) {
				List<LoginLogVo> list=eut.stuEnrollTime(map);
				return list;
			}
	

}
