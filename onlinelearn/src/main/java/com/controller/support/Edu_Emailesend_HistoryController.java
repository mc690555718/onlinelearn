package com.controller.support;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Edu_Emailesend_History;
import com.bean.Edu_User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.Edu_Emailesend_HistoryService;
import com.service.Edu_UserService;
import com.tools.JavaEmailSender;
import com.tools.MyJob;
import com.tools.QuartzManager;

@Controller
public class Edu_Emailesend_HistoryController {

	public static String JOB_NAME = "动态任务调度";  
	public static String TRIGGER_NAME = "动态任务触发器";  
	public static String JOB_GROUP_NAME = "XLXXCC_JOB_GROUP";  
	public static String TRIGGER_GROUP_NAME = "XLXXCC_JOB_GROUP"; 

	@Autowired
	private Edu_Emailesend_HistoryService eService;
	@Autowired
	private Edu_UserService Edu_UserService;

	@RequestMapping("/admin/email/sendEmaillist")
	public ModelAndView list(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request) {
		PageHelper.startPage(page, 1);
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map = initMap(request, map);
		List<Edu_Emailesend_History> list = eService.list(map);
		PageInfo<Edu_Emailesend_History> pageInfo=new PageInfo<Edu_Emailesend_History>(list);
		mv.setViewName("/back/email/edu_emailesend_historyList");
		mv.addObject("list",list);
		mv.addObject("page", pageInfo);
		return mv;
	}

	@RequestMapping("/admin/email/sendEmailinit/{id}")
	public ModelAndView init(@PathVariable("id")int id) {
		ModelAndView mv = new ModelAndView();
		Edu_Emailesend_History list = eService.getById(id);
		mv.setViewName("/back/email/edu_emailesend_historyEdit");
		mv.addObject("list",list);
		return mv;
	}

	public Map initMap(HttpServletRequest request,Map map) {
		String email = request.getParameter("email");
		String type = request.getParameter("type");
		if (type!=null&&type.trim().length()!=0) {
			int type2 = Integer.parseInt(type);
			request.setAttribute("type",type2);
			map.put("type",type2);
		}
		if (email!=null) {
			request.setAttribute("email", email);
			map.put("email",email);
		}
		return map;
	}

	@RequestMapping("/admin/email/toEmail")
	public ModelAndView send(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap<>();
		List<Edu_User> list=Edu_UserService.listUser(map);
		mv.setViewName("/back/email/edu_emailesend_historyAdd");
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/saveEmail")
	public String sendEmail(Model model, HttpServletRequest request) throws Exception{
		String email=request.getParameter("email");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String type=request.getParameter("type");
		String send_time=request.getParameter("send_time");
		
		System.out.println(email+":"+title+":"+content+":"+type+":"+send_time);
		Edu_Emailesend_History e=new Edu_Emailesend_History();
		e.setType(Integer.valueOf(type));
		String emailArray[] = email.split(";");
		for (int i = 0; i < emailArray.length; i++) {
			e.setEmail(emailArray[i]);
			if (type.equals("1")) {
				e.setTitle(title);
				e.setContent(content);
				JavaEmailSender.sendEmail(e);//发送邮件
				e.setCreate_time(new Date());
				e.setSend_time(new Date());
			}else {
				e.setTitle(title);
				e.setContent(content);
				send_time=send_time.replace("T"," ");
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				e.setSend_time(sdf.parse(send_time));
				System.out.println(send_time);
				e.setSend_time(new Date());
				JobDetail job = JobBuilder.newJob(MyJob.class)
						.withIdentity("myJob", "group1")
						.usingJobData("title",title)
						.usingJobData("content",content)
						.usingJobData("email",e.getEmail())
						.build();
				String[] dates=send_time.split(" ");
				String[] date_year=dates[0].split("-");
				String[] date_time=dates[1].split(":");//0 51 15 26 4 ? 2016
				String cons="0 "+date_time[1]+" "+date_time[0]+" "+date_year[2]+" "+date_year[1]+" ?"+" "+date_year[0];
				QuartzManager.addJob(JOB_NAME, JOB_GROUP_NAME, TRIGGER_NAME, TRIGGER_GROUP_NAME, job,cons); 
			}
			e.setCreate_time(new Date());
			eService.save(e);
			model.addAttribute("e", e);
		}
		return "redirect:/admin/email/sendEmaillist";
	}
}
