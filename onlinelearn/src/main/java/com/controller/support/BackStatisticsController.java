package com.controller.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.EduDayCouseTimeService;
import com.service.EduUserEnrollTimeService;
import com.service.EduUserLoginLogService;
import com.service.EduVedioTimeService;
import com.vo.LoginLogVo;

@Controller
@RequestMapping("/admin")
public class BackStatisticsController {
	
	        @Autowired
	        private EduUserLoginLogService eus;
	        
	        @Autowired
	        private EduUserEnrollTimeService eues;
	        
	        @Autowired
	        private EduDayCouseTimeService ecs;
	        
	        @Autowired
	        private EduVedioTimeService evt;
	
	       @RequestMapping("/statisticsPage/login")  
	       public String stuLogin(String stuLogtime,Model model){
	    	   Map map=new HashMap();
	    	   map.put("stuLogtime", stuLogtime);
	    	   List<LoginLogVo> list=eus.listTime(map);
	    	   String days="[";
		    	  String nums="[";
		    	  for(LoginLogVo vo:list){
		    		  days+="'"+vo.getTime()+"',";
		    		  nums+="'"+vo.getNum()+"',";
		    	  }
		    	  if(days.length()>1){
		    		  days=days.substring(0,days.length()-1);
		    		  nums=nums.substring(0,nums.length()-1);
		    	  }
		    	  days+="]";
		    	  nums+="]";
		    	  model.addAttribute("days",days);
		    	  model.addAttribute("nums",nums);
	        return "web/backStatistics/studentLogin";
	       }
	       

	       @RequestMapping("/statisticsPage/registered")  
	       public String stuDayLog(String createTime,Model model){
	    	   Map map=new HashMap();
	    	   map.put("createTime", createTime);
	    	   List<LoginLogVo> list=eues.listEnrollTime(map);
	    	   String days="[";
		    	  String nums="[";
		    	  for(LoginLogVo vo:list){
		    		  days+="'"+vo.getTime()+"',";
		    		  nums+="'"+vo.getNum()+"',";
		    	  }
		    	  if(days.length()>1){
		    		  days=days.substring(0,days.length()-1);
		    		  nums=nums.substring(0,nums.length()-1);
		    	  }
		    	  days+="]";
		    	  nums+="]";
		    	  model.addAttribute("days",days);
		    	  model.addAttribute("nums",nums);
	        return "web/backStatistics/stuEnrollTime";
	       }
	       
	       
	       @RequestMapping("/statisticsPage/dailyCourseNumber")  
	       public String dayCourseTime(String createTime,Model model){
	    	   Map map=new HashMap();
	    	   map.put("createTime", createTime);
	    	   List<LoginLogVo> list=ecs.EduDayCouseTime(map);
	    	   String days="[";
		    	  String nums="[";
		    	  for(LoginLogVo vo:list){
		    		  days+="'"+vo.getTime()+"',";
		    		  nums+="'"+vo.getNum()+"',";
		    	  }
		    	  if(days.length()>1){
		    		  days=days.substring(0,days.length()-1);
		    		  nums=nums.substring(0,nums.length()-1);
		    	  }
		    	  days+="]";
		    	  nums+="]";
		    	  model.addAttribute("days",days);
		    	  model.addAttribute("nums",nums);
	        return "web/backStatistics/dayCouseTime";
	       }
	       
	       
	       
	       @RequestMapping("/statisticsPage/videoViewingNum")  
	       public String vedioTime(String createTime,Model model){
	    	   Map map=new HashMap();
	    	   map.put("createTime", createTime);
	    	   List<LoginLogVo> list=evt.VedioTime(map);
	    	   String days="[";
		    	  String nums="[";
		    	  for(LoginLogVo vo:list){
		    		  days+="'"+vo.getTime()+"',";
		    		  nums+="'"+vo.getNum()+"',";
		    	  }
		    	  if(days.length()>1){
		    		  days=days.substring(0,days.length()-1);
		    		  nums=nums.substring(0,nums.length()-1);
		    	  }
		    	  days+="]";
		    	  nums+="]";
		    	  model.addAttribute("days",days);
		    	  model.addAttribute("nums",nums);
	        return "web/backStatistics/vedioTime";
	       }

}
