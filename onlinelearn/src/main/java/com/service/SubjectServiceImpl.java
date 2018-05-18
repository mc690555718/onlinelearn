package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.bean.SubjectBean;
import com.bean.SysSubject;
import com.bean.TreeBean;
import com.mapper.SubjectMapper;

@Service
public class SubjectServiceImpl implements SubjectService{
	@Autowired
	private SubjectMapper subjectMapper;

	@Override
	public SubjectBean getByIdSM(int id) {
		SubjectBean subjectBean=subjectMapper.getByIdSM(id);
		return subjectBean;
	}

	@Override
	public List<SubjectBean> listAll() {

       List<SubjectBean> list =subjectMapper.listAll();
		return list;
	}
	
	public List<TreeBean> subjectlist() {
		ModelAndView mv=new ModelAndView();
		List<SubjectBean> subjectBeans=subjectMapper.listAll();
		List<TreeBean> ztrees=new ArrayList<TreeBean>();
		for (int i = 0; i < subjectBeans.size();i++) {
			SubjectBean sys=subjectBeans.get(i);
			TreeBean tb=new TreeBean();
			tb.setId(sys.getSubject_id());
			tb.setpId(sys.getParent_id());
			tb.setName(sys.getSubject_name());
			ztrees.add(tb);
			}
		return ztrees;
	}

	@Override
	public List<SubjectBean> getById(int id) {
		List<SubjectBean> list=subjectMapper.getById(id);
		return list;
	}
	


}
