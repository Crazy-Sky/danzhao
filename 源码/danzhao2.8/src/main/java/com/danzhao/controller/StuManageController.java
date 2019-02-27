package com.danzhao.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Student;
import com.danzhao.dto.StuAllInfoDto;
import com.danzhao.dto.StuInfoDto;
import com.danzhao.dto.UserDto;
import com.danzhao.service.DeptService;
import com.danzhao.service.ProfService;
import com.danzhao.service.StuService;

@Controller
@RequestMapping("student/")
public class StuManageController {

	
	@Autowired
	StuService stuService;
	
	@Autowired
	ProfService profService;
	
	@Autowired
	DeptService deptService;
	
	/**
	 * @Description: TODO 导入学生 通过 jquery.form.js 插件提供的ajax方式上传文件 ,导入Excel
	 * @param @param request
	 * @param @param response
	 * @param @return
	 * @param @throws Exception   
	 * @return String  
	 * @throws
	 * @author zsx
	 * @date 2018年11月4日上午12:20:13
	 */
	@RequestMapping("/importExcelToStu") 
    @ResponseBody
    public int importExcelToStu(HttpServletRequest request,HttpServletResponse response
            ) throws Exception {  
		return stuService.importExcelToStu(request, response);
    }
   
    /**
     * @Description: TODO 导出Excel
     * @param @param request
     * @param @param response
     * @param @throws Exception   
     * @return void  
     * @throws
     * @author zsx
     * @date 2018年11月4日上午12:21:38
     */
    @RequestMapping("/exportStuToExcel")
    @ResponseBody
    public void exportStuToExcel(HttpServletRequest request,
            HttpServletResponse response) throws Exception{
        response.reset(); //清除buffer缓存
//        Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
        // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
        response.setHeader("Content-Disposition", "attachment;filename=students.xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        UserDto user = (UserDto)request.getSession().getAttribute("user");
        int deptid = user.getDeptid();
        workbook = stuService.exportExcel(deptid);
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    //导出考生签名表
    @RequestMapping("/exportStuSignatureExcel")
    @ResponseBody
    public void exportStuSignatureExcel(HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.reset(); //清除buffer缓存
//        Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
        // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
        response.setHeader("Content-Disposition", "attachment;filename=students.xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        UserDto user = (UserDto)request.getSession().getAttribute("user");
        int deptid = user.getDeptid();
        workbook = stuService.exportStuSignatureExcel(deptid);
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    // 未完
    //导出考生成绩表
    @RequestMapping("/exportStuScoreExcel")
    @ResponseBody
    public void exportStuScoreExcel(HttpServletRequest request,HttpServletResponse response, int erid) throws Exception{
        response.reset(); //清除buffer缓存
//        Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
        // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
        response.setHeader("Content-Disposition", "attachment;filename=students.xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        workbook = stuService.exportStuScoreExcel(erid);
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    //下载考生模板
	@SuppressWarnings("resource")
	@RequestMapping("/downExcelToStuModel")
	public void downExcelToStuModel(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//模拟文件，myfile.txt为需要下载的文件
		String fileName = request.getSession().getServletContext().getRealPath("static")+"/upload/studentModel/students.xlsx";
		//获取输入
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
		//假如以中文名下载的话
		String filename = "students.xlsx";
		//转码，免得文件名中文乱码  
		filename = URLEncoder.encode(filename,"UTF-8");
		//设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + filename);
		//1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while((len=bis.read())!=-1){
			out.write(len);
			out.flush();
		}
		out.close();
	}

	
	
	@RequestMapping("selectStusByDeptAndNameOrProfPaging")
	@ResponseBody
	public Object selectStusByDeptAndNameOrProfPaging(HttpServletRequest request,
			HttpServletResponse response,StuInfoDto stuInfoDto,
			@RequestParam(value="insertAccord", defaultValue="all")String insertAccord,
			@RequestParam(value="nowPage", defaultValue="1")int nowPage,
			@RequestParam(value="pageSize", defaultValue="10")int pageSize) throws IllegalAccessException, InvocationTargetException{
		if(insertAccord.equals("stuname")){
			stuInfoDto.setProfname(null);
		}else if(insertAccord.equals("profname")){
			stuInfoDto.setStuname(null);
		}else{
			stuInfoDto.setProfname(null);
			stuInfoDto.setStuname(null);
		}
		List<StuInfoDto> studentShowDtos = stuService.selectStusByDeptAndNameOrProf(stuInfoDto);
		request.getSession().setAttribute("stu_nowPage", nowPage);
		return studentShowDtos;
	}
	
	//跳转链接
	@RequestMapping("goUpdateView")
	public String UserSkip (HttpSession session,int stuid){
		session.setAttribute("stuinfo_stuid", stuid);
		System.out.println(session.getAttribute("stuinfo_stuid"));
		session.setAttribute("userCorePage", "deptAdmin/stuInfoManage");
		return "user/Main";
	}
	
	@RequestMapping("updateOne")
	@ResponseBody
	public int updateOne(HttpServletRequest request,
			HttpServletResponse response,Student student){
		return stuService.updateOneStu(student);
	}
	
	@RequestMapping("insertOne")
    @ResponseBody
    public int insertOne(HttpServletRequest request,
            HttpServletResponse response,Student student){
        return stuService.insertOneStu(student);
    }
	
	@RequestMapping("selectOneStuAllInfoDto")
	@ResponseBody
	public StuAllInfoDto selectOneStuAllInfoDto(HttpServletRequest request,
			HttpServletResponse response,int stuid){
		if(stuid == 0){
			return null;
		}
		return stuService.selectOneStuAllInfoDto(stuid);
	}
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return stuService.deleteOne(id);
	}
	
}
