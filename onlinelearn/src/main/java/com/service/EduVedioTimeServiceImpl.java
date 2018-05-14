package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.EduVedioTimeMapper;
import com.service.EduVedioTimeService;
import com.vo.LoginLogVo;

@Service
public class EduVedioTimeServiceImpl implements EduVedioTimeService{
	
	     @Autowired
	     private EduVedioTimeMapper evt;

	@Override
	public List<LoginLogVo> VedioTime(Map map) {
		List<LoginLogVo> list=evt.vedioTime(map);
		return list;
	}
	

}
