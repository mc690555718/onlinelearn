package com.controller.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Course_purchase;
import com.service.Course_purchaseService;
import com.util.CookieUtils;
import com.util.JsonUtils;

@Controller
@RequestMapping("/front")
public class Alipay {
	@Autowired
	private Course_purchaseService course_purchaseService;
	
	@RequestMapping("/Alipay/toindex")
	public String toindex(Double courseprice,Model model,String coursename){
		if(courseprice!=null){
			model.addAttribute("courseprice",courseprice);
		}
		if(!"".equals(coursename)&&coursename!=null){
			try {
				coursename = new String(coursename .getBytes("iso8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 
			model.addAttribute("coursename",coursename);
			
			System.out.println(coursename);
		}
		return "Alipay/index";
	}
	@RequestMapping("/Alipay/topay")
	public String pagepay(){
		return "Alipay/alipay.trade.page.pay";
	}
	@RequestMapping("/Alipay/query")
	public String query(){
		return "Alipay/alipay.trade.query";
	}
	@RequestMapping("/Alipay/refund")
	public String refund(){
		return "Alipay/alipay.trade.refund";
	}
	@RequestMapping("/Alipay/refundquery")
	public String refundquery(){
		return "Alipay/alipay.trade.fastpay.refund.query";
	}
	@RequestMapping("/Alipay/close")
	public String close(){
		return "Alipay/alipay.trade.close";
	}
	@RequestMapping("/Alipay/notify_url")
	public String notify_url(){
		
		return "Alipay/notify_url";
	}
	@RequestMapping("/Alipay/return_url")
	public String return_url(HttpServletRequest request){
		System.out.println("进入了付费课程！！");
		String cookieValue = CookieUtils.getCookieValue(request, "cookpurchase");
		System.out.println(cookieValue);
		Course_purchase course_purchase=JsonUtils.jsonToPojo(cookieValue, Course_purchase.class);
		
		System.out.println(course_purchase.getCourseId()+"健康楼上单"+course_purchase.getUserId());
		course_purchaseService.addCourse_purchase(course_purchase);
		return "Alipay/return_url";
	}
}
