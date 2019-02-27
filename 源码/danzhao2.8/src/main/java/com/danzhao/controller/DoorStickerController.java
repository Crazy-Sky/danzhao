package com.danzhao.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.danzhao.bean.Examroom;
import com.danzhao.dto.DoorStickerDto;
import com.danzhao.service.ExamroomService;
import com.danzhao.util.WordUtil;

@Controller
@RequestMapping("word/")
public class DoorStickerController {
	
    @Autowired
    ExamroomService examroomService;
    
	/*@RequestMapping("exportDoorSticker")
    public String exportDoorSticker(HttpServletRequest request,HttpServletResponse response, 
    		DoorStickerDto doorStickerDto) throws IOException{
		 System.out.println(doorStickerDto.toString());
    	 Map<String, Object> map = new HashMap<String, Object>();  
    	 map.put("year", doorStickerDto.getYear());
    	 map.put("dept", doorStickerDto.getDept());
    	 map.put("examroom", doorStickerDto.getExamroom());
    	 map.put("ertype", doorStickerDto.getErtype());
    	 
    	 // 提示：在调用工具类生成Word文档之前应当检查所有字段是否完整  
         // 否则Freemarker的模板殷勤在处理时可能会因为找不到值而报错 这里暂时忽略这个步骤了  
         File file = null;  
         InputStream fin = null;  
         ServletOutputStream out = null;  
         try {  
             // 调用工具类WordGenerator的createDoc方法生成Word文档  
             file = WordUtil.createDoc(map, "DoorSticker");  
             fin = new FileInputStream(file);  
               
             response.setCharacterEncoding("utf-8");  
             response.setContentType("application/msword");  
             // 设置浏览器以下载的方式处理该文件默认名为resume.doc  
             response.addHeader("Content-Disposition", "attachment;filename=DoorSticker.doc");  
               
             out = response.getOutputStream();  
             byte[] buffer = new byte[1024];  // 缓冲区  
             int bytesToRead = -1;  
             // 通过循环将读入的Word文件的内容输出到浏览器中  
             while((bytesToRead = fin.read(buffer)) != -1) {  
                 out.write(buffer, 0, bytesToRead);  
             }  
         } finally {  
             if(fin != null) fin.close();  
             if(out != null) out.close();  
             if(file != null) file.delete(); // 删除临时文件  
         }  
    	 return null;
    }*/
    
    @RequestMapping("exportDoorSticker")
    public String exportDoorSticker(HttpServletRequest request,HttpServletResponse response, 
            DoorStickerDto doorStickerDto) throws IOException, IllegalAccessException, InvocationTargetException{
         
        List<DoorStickerDto> dataList = new ArrayList<DoorStickerDto>();
         if(doorStickerDto.getExamrooms() != null && doorStickerDto.getExamrooms().size() > 0){
             Examroom examroom ;
             DoorStickerDto doorStickerDto2;
             for (String erid : doorStickerDto.getExamrooms()) {
                 doorStickerDto2 = new DoorStickerDto();
                 examroom = examroomService.selectOneExamroom(Integer.parseInt(erid));
                 BeanUtils.copyProperties(doorStickerDto2, doorStickerDto);
                 if(examroom.getErtype() == 0){
                     doorStickerDto2.setErtype("候考场");
                 }else if(examroom.getErtype() == 1){
                     doorStickerDto2.setErtype("考场");
                 }else{
                     continue;
                 }
                 doorStickerDto2.setExamroom(examroom.getErname());
                 System.out.println(examroom.getErname());
                 dataList.add(doorStickerDto2);
            }
         }else{
             return null;
         }
         
         Map<String, List<DoorStickerDto>> dataMap = new HashMap<String, List<DoorStickerDto>>();
         dataMap.put("dataList", dataList);
         
         // 提示：在调用工具类生成Word文档之前应当检查所有字段是否完整  
         // 否则Freemarker的模板殷勤在处理时可能会因为找不到值而报错 这里暂时忽略这个步骤了  
         File file = null;  
         InputStream fin = null;  
         ServletOutputStream out = null;  
         try {  
             // 调用工具类WordGenerator的createDoc方法生成Word文档  
             file = WordUtil.createDoc(dataMap, "DoorSticker");  
             fin = new FileInputStream(file);  
               
             response.setCharacterEncoding("utf-8");  
             response.setContentType("application/msword");  
             // 设置浏览器以下载的方式处理该文件默认名为resume.doc  
             response.addHeader("Content-Disposition", "attachment;filename=DoorSticker.doc");  
               
             out = response.getOutputStream();  
             byte[] buffer = new byte[1024];  // 缓冲区  
             int bytesToRead = -1;  
             // 通过循环将读入的Word文件的内容输出到浏览器中  
             while((bytesToRead = fin.read(buffer)) != -1) {  
                 out.write(buffer, 0, bytesToRead);  
             }  
         } finally {  
             if(fin != null) fin.close();  
             if(out != null) out.close();  
             if(file != null) file.delete(); // 删除临时文件  
         }  
         return null;
    }

    

}
