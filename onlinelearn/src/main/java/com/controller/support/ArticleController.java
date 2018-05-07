package com.controller.support;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Article;
import com.bean.ArticleContent;
import com.bean.ArticleType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.ArticleContentService;
import com.service.ArticleService;

@RequestMapping("/admin/article")
@Controller
public class ArticleController {

	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleContentService articleContentService;
	//	查询and模糊查询
	@RequestMapping("/showlist")
	public ModelAndView listAll(@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap<>();
		PageHelper.startPage(page, 8);
		map=initMap(request, map);
		List<Article> list = articleService.listAll(map);
		PageInfo<Article> pageInfo=new PageInfo<>(list);
		mv.addObject("list", list);
		mv.addObject("page", pageInfo);
		mv.setViewName("/back/article/article");
		return mv;
	}

	public Map initMap(HttpServletRequest request,Map map) {
		String qname = request.getParameter("qname");
		String create_time = request.getParameter("create_time");
		String publish_time = request.getParameter("publish_time");
		map.put("qname",qname);
		if (create_time!=null&&create_time.length()>0) {
			map.put("create_time", create_time);
		}
        if (publish_time!=null&&publish_time.length()>0) {
        	map.put("publish_time", publish_time);
		}
		return map;
	}

	//	删除
	@RequestMapping("/delete")
	public String delete(int article_id) {
		articleService.delete(article_id);
		return "redirect:/admin/article/showlist";
	}


//	修改  文本框赋值
	@RequestMapping("/updateValue")
	public ModelAndView updateValue(int article_id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.getById(article_id);
		List<ArticleContent> list = articleContentService.listAll();
		mv.addObject("article", article);
		mv.addObject("list", list);
		mv.setViewName("/back/article/editarticle");
		return mv;
	}
	
	
	//修改
	@RequestMapping("/update")
	public String update(@RequestParam("file")MultipartFile file,HttpServletRequest request,Article article,int article_id,String content) throws IOException {
		if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getRealPath("/upload/");
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);         
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            try {
				file.transferTo(new File(path + File.separator + filename));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
            article.setImage_url("/upload/"+filename);
		}
		ArticleContent articleContent = new ArticleContent();
		articleContent.setArticle_id(article_id);
		articleContent.setContent(content);
		article.setArticleContent(articleContent);
		articleService.update(article);
		articleService.updateContent(article);
		return "redirect:/admin/article/showlist";
	}

	
//	修改  文本框赋值
	@RequestMapping("/saveValue")
	public ModelAndView saveValue() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/article/addarticle");
		return mv;
	}
	

	//添加
		@RequestMapping("/save")
		public String save(@RequestParam("file")MultipartFile file,HttpServletRequest request,Article article, String publish_time) throws IOException {
			if(!file.isEmpty()) {
	            //上传文件路径
	            String path = request.getRealPath("/upload/");
	            //上传文件名
	            String filename = file.getOriginalFilename();
	            File filepath = new File(path,filename);
	            //判断路径是否存在，如果不存在就创建一个
	            if (!filepath.getParentFile().exists()) { 
	                filepath.getParentFile().mkdirs();
	            }
	            //将上传文件保存到一个目标文件当中
	            try {
					file.transferTo(new File(path + File.separator + filename));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	            article.setImage_url("/upload/"+filename);
			}
			
			String content=request.getParameter("content");
			ArticleContent articleContent = new ArticleContent();
			SimpleDateFormat sFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			articleContent.setContent(content);
			article.setPublish_time(date);
			article.setCreate_time(date);
			article.setArticleContent(articleContent);
			articleService.save(article);
			articleService.saveContent(article);
			return "redirect:/admin/article/showlist";
		}


	


}
