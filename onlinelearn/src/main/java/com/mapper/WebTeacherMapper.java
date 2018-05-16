package com.mapper;

import java.util.List;

import com.bean.WebTeacherBean;

public interface WebTeacherMapper {
	
	List<WebTeacherBean> list(int cousrse_id);

}
