package com.controller.support;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Edu_User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.Edu_UserService;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
@Controller
@RequestMapping("/admin/user")
public class TestController {
	@Autowired 
	private Edu_UserService edu_UserService;
	@RequestMapping("/listUser")
	public ModelAndView test1(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request){
		PageHelper.startPage(page, 5);
		Map map=new HashMap<>();
		map=initMap(request, map);
		List<Edu_User> list=edu_UserService.listUser(map);
		PageInfo<Edu_User> pageInfo=new PageInfo<Edu_User>(list);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/back/user/index");
		mv.addObject("listUser", list);
		mv.addObject("page", pageInfo);
		return mv;
	}

	@RequestMapping("/excel")
	public String excel(String filename,HttpServletRequest request,HttpServletResponse response){
		Map map=new HashMap<>();
		map=initMap(request, map);
		List<Edu_User> list=edu_UserService.listUser(map);
		////////////////////将ArrayList中的数据写入到本地excel中///////////////////////////          
		//第一步，创建一个workbook对应一个excel文件  
		HSSFWorkbook workbook = new HSSFWorkbook();  
		//第二步，在workbook中创建一个sheet对应excel中的sheet  
		HSSFSheet sheet = workbook.createSheet("用户表一");  
		//第三步，在sheet表中添加表头第0行，老版本的poi对sheet的行列有限制  
		HSSFRow row = sheet.createRow(0);  
		//第四步，创建单元格，设置表头  
		HSSFCell cell = row.createCell(0);  
		cell.setCellValue("用户Id");  
		cell = row.createCell(1);  
		cell.setCellValue("手机号");  
		cell=row.createCell(2);  
		cell.setCellValue("邮箱号");  
		cell=row.createCell(3);  
		cell.setCellValue("用户名"); 
		cell=row.createCell(4);  
		cell.setCellValue("昵称"); 
		cell=row.createCell(5);  
		cell.setCellValue("性别"); 
		cell=row.createCell(6);  
		cell.setCellValue("年龄"); 
		cell=row.createCell(7);  
		cell.setCellValue("状态"); 
		//第五步，写入实体数据，实际应用中这些数据从数据库得到,对象封装数据，集合包对象。对象的属性值对应表的每行的值  
		for (int i = 0; i <list.size(); i++)   
		{  
			HSSFRow row1 = sheet.createRow(i+1);  
			Edu_User user=list.get(i);  
			//创建单元格设值  
			row1.createCell(0).setCellValue(user.getUser_id());  
			row1.createCell(1).setCellValue(user.getMobile());  
			row1.createCell(2).setCellValue(user.getEmail()); 
			row1.createCell(3).setCellValue(user.getUser_name()); 
			row1.createCell(4).setCellValue(user.getShow_name()); 
			row1.createCell(5).setCellValue(user.getSex()); 
			row1.createCell(6).setCellValue(user.getAge()); 
			row1.createCell(7).setCellValue(user.getIs_avalible()); 
			
		}  
		//将文件保存到指定的位置  
		try   
		{  
			FileOutputStream fos = new FileOutputStream(filename);  
			workbook.write(fos);  
			System.out.println("恭喜您！导入成功！！！！！！");  
			fos.close();  
		}   
		catch (IOException e)   
		{  
			System.out.println("写入文件出错啦！");  
			e.printStackTrace();  
		}  
		return "/admin/user/listUser";

	}



public Map initMap(HttpServletRequest request,Map map){
	String name=request.getParameter("name");
	String type=request.getParameter("type");
	String statr=request.getParameter("start");
	String end=request.getParameter("end");
	if (statr!=null&&statr.length()>0) {
		map.put("start", statr);
	}
	if (end!=null&&end.length()>0) {
		map.put("end", end);
	}

	if (type==null) {
		type="-1";
	}
	map.put("type", Integer.valueOf(type));
	map.put("name", name);
	return map;

}
@RequestMapping("/updatepwd")
@ResponseBody
public int update(@RequestParam int id,@RequestParam String fir) {
	Map map = new HashMap<>();
	System.out.println(id+","+fir);
	map.put("user_id", id);
	map.put("password", fir);
	edu_UserService.update(map);
	return 1;
}


@RequestMapping("/dongjiezz")
@ResponseBody
public int update(@RequestParam int id,@RequestParam int zz) {
	System.out.println(zz);
	Map map = new HashMap<>();
	map.put("user_id", id);
	if (zz == 2) {
		map.put("zz", 1);
	} else {
		map.put("zz", 2);
	}
	edu_UserService.updateZZ(map);
	return 1;
}
@RequestMapping("/down")
public String downAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
	java.io.OutputStream o = response.getOutputStream();
	byte b[] = new byte[500];
	java.io.File fileLoad = new java.io.File(request.getRealPath("/Excel/user.xls"));
	System.out.println(fileLoad.getPath());
	response.reset();
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("content-disposition",
			"attachment; filename=text.xls");
	long fileLength = fileLoad.length();
	String length1 = String.valueOf(fileLength);
	response.setHeader("Content_Length", length1);
	java.io.FileInputStream in = new java.io.FileInputStream(fileLoad);
	int n;
	while ((n = in.read(b)) != -1) {
		o.write(b, 0, n);
	}
	in.close();
	o.close();

	return null;
}


@RequestMapping("/open")
public String open(){
	return "/back/user/parseExcel";	
}

@RequestMapping("/parseExcel")
public String parseExcel(@RequestParam("file")MultipartFile file,Edu_User user)throws Exception{
	//创建输入流  
	InputStream stream =file.getInputStream();  
	//获取Excel文件对象  
	Workbook  rwb = Workbook.getWorkbook(stream);  
	//获取文件的指定工作表 默认的第一个  
	Sheet sheet = rwb.getSheet(0);    
	//行数(表头的目录不需要，从1开始)  
	for(int i=2; i<sheet.getRows(); i++){  
		//创建一个数组 用来存储每一列的值  
		String[] str = new String[sheet.getColumns()];  
		Cell cell = null;  
		//列数  
		for(int j=0; j<sheet.getColumns(); j++){  
			//获取第i行，第j列的值  
			cell = sheet.getCell(j,i);      
			str[j] = cell.getContents();  

			if (j==0) {
				if (str[j].equals("")||str[j]==null) {
					return "redirect:/admin/user/listUser";
				}
				user.setMobile(str[j]);
			}if (j==1) {
				user.setEmail(str[j]);

			}if (j==2) {
				user.setPassword(str[j]);

			}if (j==3) {
				user.setUser_name(str[j]);

			}if (j==4) {
				user.setShow_name(str[j]);

			}if (j==5) {
				if (str[j].equals("男")) {
					user.setSex(0);
				}else {
					user.setSex(1);
				}
			}if (j==6) {
				user.setAge(Integer.valueOf(str[j]));

			}if (j==7) {
				user.setCreate_time(Timestamp.valueOf(str[j]));
			}
		}  
		Date date=new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strdate = format.format(date);
		user.setLast_system_time(Timestamp.valueOf(strdate));
		System.out.println(user);
		edu_UserService.save(user);
	}  
	return "redirect:/admin/user/listUser";
}


}