package com.controller.support;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.bean.Comment;
import com.bean.Edu_User;
import com.bean.imgType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CommentService;
import com.service.Edu_UserService;

@Controller
@RequestMapping("/admin/cy")
public class CommentController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private Edu_UserService Edu_UserService;
	
//	  显示
	@RequestMapping("/listcomment")
	public ModelAndView listcomment(@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		PageHelper.startPage(page,10);
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap<>();
		map=initMap(request, map);
		List<Comment> lists=commentService.listAll(map);
		PageInfo<Comment> pageInfo=new PageInfo<Comment>(lists);
		mv.addObject("lists",lists);
		mv.addObject("page", pageInfo);
		mv.setViewName("/back/comment/comment"); 
		return mv;
	}


//	封装MAp
	private Map initMap(HttpServletRequest request,Map map){
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	    String content=request.getParameter("content");
		String type = request.getParameter("type");
    	String email = request.getParameter("email");
 	String start=request.getParameter("start");
    	String end=request.getParameter("end");
    	
		if (type!=null&&type.trim().length()!=0) {
			int type2 = Integer.parseInt(type);
			request.setAttribute("type",type2);
			map.put("type",type2);
		}
    	if (content!=null&&content.trim().length()!=0) {
			request.setAttribute("content",content);
			map.put("content",content);
		}
    	if (email!=null&&email.trim().length()!=0) {
			request.setAttribute("email",email);
			map.put("email",email);
		}
 	      if (start!=null&&start.trim().length()!=0) {
	       request.setAttribute("start",start); 
			map.putIfAbsent("start", start);
			
		}if (end!=null&&end.trim().length()!=0) {
			request.setAttribute("end",end); 
			map.put("end", end);
			
		}
    	  
		return map;
	} 
	
//	 调方法
@RequestMapping("/to")
public String to(){
	return "/back/comment/commentaa";
}
	
//	删除
	@RequestMapping("/delete/{comment_id}")
	public String delete(@PathVariable(value="comment_id") int comment_id) {
		commentService.detele(comment_id);
		return "redirect:/admin/cy/listcomment";
	}
	
}
