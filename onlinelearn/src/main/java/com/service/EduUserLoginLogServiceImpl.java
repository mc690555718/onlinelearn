package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.EduUserLoginLogMapper;
import com.vo.LoginLogVo;

@Service
public class EduUserLoginLogServiceImpl implements EduUserLoginLogService{
	
	      @Autowired
	      private EduUserLoginLogMapper eduUserLoginLogMapper;

	      
	      public List<LoginLogVo> listTime(Map map){
	    	  List<LoginLogVo> list=eduUserLoginLogMapper.listTime(map);
	    	  return list;
	      }




}
