package com.controller.support;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.img;
import com.bean.imgType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.imgMapper;

import com.service.imgService;
import com.service.imgTypeService;


@Controller
@RequestMapping("/admin/hello")
public class imgController {
	@Autowired
	private imgService imgService;
	@Autowired
	private imgTypeService imgTypeService;
//	显示
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request) {
		PageHelper.startPage(page,5);
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap<>();
		map=initMap(request, map);
		List<img> list=imgService.listAll(map);
		PageInfo<img> pageInfo=new PageInfo<img>(list);
		List<imgType> types= imgTypeService.listtype();
		mv.addObject("types",types);
		mv.addObject("list", list);
		mv.addObject("page", pageInfo);
		mv.setViewName("/back/img/aa");
		return mv;
	}


//	封装MAP
	private Map initMap(HttpServletRequest request,Map map){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String title=request.getParameter("title");
		String typeId=request.getParameter("typeId");
		if (typeId==null) {
			typeId="-1";
		}
		map.put("title",title);
		map.put("typeId", typeId);
		return map;
	}
//	查找类型
	@RequestMapping("/listtype")
	public ModelAndView listtype() {
		ModelAndView mv=new ModelAndView();
		List<imgType> types= imgTypeService.listtype();
		mv.addObject("types",types);
		mv.setViewName("/back/img/imgadd");
		return mv;
	}

//	添加
	@RequestMapping("/save")
	public String save(@RequestParam("file") MultipartFile file,HttpServletRequest request,img img,int typeId) {
		    imgType imgType=new imgType();
	        imgType.setTypeId(typeId);
	        img.setImgType(imgType);
	        //ͼƬ�ϴ�
			//�������·��webapp����·��  
			String path = request.getRealPath("/images/upload/image/20180408/");  
			String pathRoot = "";
			String imgpath = "";
			if(!file.isEmpty()){  
				//����uuid��Ϊ�ļ�����  
				String uuid = UUID.randomUUID().toString().replaceAll("-","");  
				//����ļ����ͣ������ж��������ͼƬ����ֹ�ϴ���  
				String contentType=file.getOriginalFilename(); 
				//����ļ���׺����  
				String imageName=contentType.substring(contentType.lastIndexOf(".")+1,contentType.length());  
				pathRoot = path+"/"+uuid+"."+imageName;
				File newfile=new File(pathRoot);
				imgpath = "/images/upload/image/20180408/"+uuid+"."+imageName;
				try {
					file.transferTo(newfile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	    img.setImageUrl(imgpath);
	    img.setPreviewUrl(imgpath);
		imgService.save(img);
		return "redirect:/admin/hello/list";
	}
	
	
	
	
//	批量删除
	@RequestMapping("/del")  
	public void batchDeletes(HttpServletRequest request) {  
	    String items = request.getParameter("delitems");  
	    String[] strs = items.split(",");  
	  
	    for (int i = 0; i < strs.length; i++) {  
	        try {  
	            int a = Integer.parseInt(strs[i]);  
	            imgService.delete(a);  
	        } catch (Exception e) {  
	        }  
	    }  
	}

	

	@RequestMapping("/checkName/{title}")
	@ResponseBody
	public int checkName(@PathVariable("title")String title) {
		try{
			title=new String(title.getBytes("ISO-8859-1"),"utf-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		Map map=new HashMap<>();
		map.put("title", title);
		List<img>check=imgService.checkName(map);
		
		if (check.size()>0) {
			return 1;
		}else {
			return 0;
		}
	
	}




//	删除
	@RequestMapping("/delete/{imageId}")
	public String delete(@PathVariable(value="imageId") int imageId) {
		imgService.delete(imageId);
		return "redirect:/admin/hello/list";
	}

	
	
	
//	拿ID
	@RequestMapping("/getById/{imageId}")
	public ModelAndView  getById(@PathVariable (value="imageId") int imageId) {
		ModelAndView mv=new ModelAndView();
		img img= imgService.getById(imageId);
		mv.addObject("img", img);
		List<imgType> types=imgTypeService.listtype();
		mv.addObject("types",types);
		mv.setViewName("/back/img/imgEdit");
		return mv;
	}
	
	
//	 修改
	@RequestMapping("/update")
	public String update(@RequestParam("file") MultipartFile file,@RequestParam("file1") MultipartFile file1,HttpServletRequest request,img img,@RequestParam("typeId") int typeId) {
		imgType imgType=new imgType();
        imgType.setTypeId(typeId);
        img.setImgType(imgType);
//      System.out.println(img);
		String path = request.getRealPath("/images/upload/image/20180408/");  
		String pathRoot = "";
		String imgpath = "";
		String imgpath1 = "";
		if(!file.isEmpty()){  
			String uuid = UUID.randomUUID().toString().replaceAll("-","");  
			String contentType=file.getOriginalFilename(); 
			String imageName=contentType.substring(contentType.lastIndexOf(".")+1,contentType.length());  
			pathRoot = path+"/"+uuid+"."+imageName;
			File newfile=new File(pathRoot);
			imgpath = "/images/upload/image/20180408/"+uuid+"."+imageName;
			try {
				file.transferTo(newfile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(!file1.isEmpty()){  
			String uuid = UUID.randomUUID().toString().replaceAll("-","");  
			String contentType=file1.getOriginalFilename(); 
			String imageName=contentType.substring(contentType.lastIndexOf(".")+1,contentType.length());  
			pathRoot = path+"/"+uuid+"."+imageName;
			File newfile=new File(pathRoot);
			imgpath1 = "/images/upload/image/20180408/"+uuid+"."+imageName;
			try {
				file1.transferTo(newfile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
        img.setImageUrl(imgpath);
        img.setPreviewUrl(imgpath1);
        imgService.update(img);
		return "redirect:/admin/hello/list";
	}

}