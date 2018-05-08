package com.controller.support;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewRequestBodyAdvice;

import com.bean.SubjectBean;
import com.bean.SysFunction;
import com.bean.TeacherBean;
import com.bean.TreeBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.SubjectMapper;
import com.service.SubjectService;
import com.service.TeacherService;
import com.util.JsonUtils;
import com.vo.TreeVo;

@Controller
@RequestMapping("/admin/teacher")
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private SubjectService subjectService;

	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(required=true,defaultValue="1")Integer 
			page,HttpServletRequest request) {
		PageHelper.startPage(page,5);
		Map map=new HashMap();
		map=initMap(request, map);
		ModelAndView mv =new ModelAndView();
		List<TeacherBean> list= teacherService.listAll(map);
		PageInfo<TeacherBean> pageInfo=new PageInfo<TeacherBean>(list);
		mv.setViewName("/back/teacher/teacherlist");
		mv.addObject("list", list);
		mv.addObject("page", pageInfo);
		return mv;
	}
	
	//查询时间。模糊查询
	private Map initMap(HttpServletRequest request,Map map) {
		String qname=  request.getParameter("qname");
		String star=request.getParameter("star");
		String emp = request.getParameter("emp");
		String isstar=request.getParameter("isstar");
		if (qname!=null&&qname.trim().length()>0) {
			try {
				qname = new String(qname.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			map.put("qname", qname);
			request.setAttribute(qname, qname);
		}
		if (star!=null&&star.trim().length()>0) {
			map.put("star", star);
			request.setAttribute("star", star);
		}
		if (emp!=null&&emp.trim().length()>0) {
			map.put("emp", emp);
			request.setAttribute("emp", emp);
		}
		if (isstar!=null&&isstar.trim().length()>0) {
			map.put("isstar", Integer.valueOf(isstar));
			request.setAttribute("isstar", isstar);
		}
		
		return map;
	}
	
	
	//ztree显示
	@RequestMapping("/init")
	public ModelAndView init( ) {
		ModelAndView mv=new ModelAndView();
		List<SubjectBean> lists=subjectService.listAll();
		List<TreeVo> list=new ArrayList<TreeVo>();
		for(int i=0;i<lists.size();i++){
			SubjectBean sb=lists.get(i);
			TreeVo tv=new TreeVo();
			tv.setId(sb.getSubject_id());
			tv.setName(sb.getSubject_name());
			tv.setpId(sb.getParent_id());
			list.add(tv);
		}
		String json=JsonUtils.objectToJson(list);
		mv.addObject("list",json);
		mv.setViewName("back/teacher/teacheradd");
		return mv ;
			}

	//删除
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id")int id) {
		teacherService.delete(id);
		return "redirect:/admin/teacher/list";
	}
	
	
	
	@RequestMapping("/getByIdSM/{id}")
	public ModelAndView getByIdSM(@PathVariable("id")int id) {
		ModelAndView mv =new ModelAndView();
		SubjectBean subjectBean=subjectService.getByIdSM(id);
		mv.setViewName("teacherlist");
		mv.addObject("a",subjectBean);
		return mv;
	}
	
    //添加
	@RequestMapping("/tosave")
	public String save(@PathVariable("file")MultipartFile file,HttpServletRequest request,TeacherBean tb) {
		String subjectId=request.getParameter("subjectId");
		SubjectBean subjectBean=new SubjectBean();
		subjectBean.setSubject_id(Integer.valueOf(subjectId));
		tb.setSubject_id(subjectBean);
		//图片上传
		//获得物理路径webapp所在路径
		String path = request.getRealPath("/upload/");
		String pic_path = "";
		if (!file.isEmpty()) {
			//获得文件类型	
			String contextType = file.getOriginalFilename();
			//获得文件后缀名
			pic_path ="/images/upload/teacher/20150915/"+ contextType;
			File file2 = new File(pic_path);
			try {
				if(!file2.exists()){
					file2.createNewFile();
				}
				file.transferTo(file2);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		tb.setCreate_time(new Date());
		tb.setPic_path(pic_path);
		teacherService.save(tb);
		return "redirect:/admin/teacher/list";
	}

	
	
	@RequestMapping("/upinit/{id}")
	public ModelAndView init(@PathVariable("id")int id) {
		ModelAndView mv =new ModelAndView();
		TeacherBean teacherBean =teacherService.getById(id);
		mv.setViewName("/back/teacher/teacherupdate");
		mv.addObject("a",teacherBean);
		return mv;
	}
    
	
	@RequestMapping("/update")
	public String update(@RequestParam MultipartFile file,HttpServletRequest request) {
		System.out.println("5555555555");
		String id =request.getParameter("id");
		String name =request.getParameter("name");
		String th_name =request.getParameter("th_name");
		String th_pw =request.getParameter("th_pw");
		String education =request.getParameter("education");
		String career =request.getParameter("career");
		String is_star =request.getParameter("is_star");
		String status =request.getParameter("status");
		String subject_id =request.getParameter("subject_id");
		String sort =request.getParameter("sort");
		//图片上传
		//获得物理路径webapp所在路径
		String path = request.getRealPath("/upload/");
		String pic_path = "";
		if (!file.isEmpty()) {
			//获得文件类型
			String contextType = file.getOriginalFilename();
			//获得文件后缀名
			File file2 = new File(path,contextType);
			pic_path = "/upload/" + contextType;
			try {
				file.transferTo(file2);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		SubjectBean subjectBean = new SubjectBean();
		subjectBean.setSubject_id(Integer.parseInt(subject_id));
		System.out.println(subject_id+"8888888");
		TeacherBean teacherBean = new TeacherBean(Integer.valueOf(id), name, th_name, th_pw, education, career, Integer.valueOf(is_star), pic_path, Integer.valueOf(status), null, new Date(), subjectBean, Integer.valueOf(sort));
		teacherService.update(teacherBean);
		System.out.println(teacherService+"999999");
		return "redirect:/admin/teacher/list";
	}


}
