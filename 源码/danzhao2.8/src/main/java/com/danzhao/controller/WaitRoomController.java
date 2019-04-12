package com.danzhao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examroom;
import com.danzhao.bean.Student;
import com.danzhao.dto.ShowStuDto;
import com.danzhao.dto.StuInfoDto;
import com.danzhao.service.ExamroomService;
import com.danzhao.service.StuService;
import com.danzhao.util.CallingUtil;
import com.danzhao.util.StringUtil;

/**
 * <p>
 * Title:WaitRoomController
 * </p>
 * <p>
 * Description: 候考室控制器
 * </p>
 * 
 * @author cx
 * @date 2018年11月14日
 *
 */
@Controller
@RequestMapping("waitroom/")
public class WaitRoomController {

    @Autowired
    ExamroomService examroomService;

    @Autowired
    StuService stuService;

    /**
     * 
     * @Title: getCallingState
     * @Description: (获取该考场的被呼叫考生是否有更新)
     * @realization: (根据考场id 获得其中所有专业，依次在session中查看专业的更新状态)
     * @author: cx
     * @param session
     * @param erid
     * @return 0：没有更新 1：有更新
     */
    @RequestMapping("getCallingState")
    @ResponseBody
    public int getCallingState(HttpServletRequest request, HttpServletResponse response, int erid) {
        // 根据考场号获取其中的专业
        Examroom examroom = examroomService.selectOneExamroom(erid);
        List<String> testRoomList = StringUtil.StringToList(examroom.getTestRoomList());
        int message = 0, testRoomId = 0;
        for (String testRoom : testRoomList) {
            testRoomId = Integer.parseInt(testRoom);
            if (request.getSession().getServletContext()
                .getAttribute("exam_" + erid + "testRoom_" + testRoomId) != null) {
                int state = (Integer)request.getSession().getServletContext()
                    .getAttribute("exam_" + erid + "testRoom_" + testRoomId);
                if (state == 1) {
                    message = 1;
                    break;
                }
            }
        }

        // 如果有更新 生成新的语音文件
        if (message == 1) {
            System.out.println("状态有更新 当前application:" + "exam_" + erid + "testRoom_" + testRoomId + ":"
                + request.getSession().getServletContext().getAttribute("exam_" + erid + "testRoom_" + testRoomId));
            String fileName = produceCallingStu(request, response, erid);
            request.getSession().getServletContext().setAttribute("audioFileName", fileName);
            request.getSession().getServletContext().setAttribute("exam_" + erid + "testRoom_" + testRoomId, 0);
            System.out.println("音频生成完毕 当前application:" + "exam_" + erid + "testRoom_" + testRoomId + ":"
                + request.getSession().getServletContext().getAttribute("exam_" + erid + "testRoom_" + testRoomId));
        }
        // System.out.println("考场："+erid+"---状态："+message+"---正在播放的音频文件："+request.getSession().getServletContext().getAttribute("audioFileName"));
        return message;
    }

    /**
     * 
     * @Title: getCallingStu
     * @Description: (获取该候考室被呼叫的考生)
     * @realization: (实现的方法)
     * @author: cx
     * @param request
     * @param response
     * @param erid
     * @return List<StudentInfoDto>
     */
    @RequestMapping("getCallingStu")
    @ResponseBody
    public Map<String, List<StuInfoDto>> getCallingStu(HttpSession session,ShowStuDto request) {
        // 根据考场号获取其所属测试考生
    	Map<String, List<StuInfoDto>> map = new HashMap<String, List<StuInfoDto>>();
        Examroom examroom = examroomService.selectOneExamroom(request.getErid());
        List<String> testRoomList = StringUtil.StringToList(examroom.getTestRoomList());
        List<StuInfoDto> studentInfoDtos = new ArrayList<StuInfoDto>();
        ServletContext application = session.getServletContext();
        // 获取每个候考室中正在被呼叫的学生
        Student student = new Student();
        ShowStuDto showStuDto = new ShowStuDto();
        List<StuInfoDto> callingStus = new ArrayList<StuInfoDto>();
        List<StuInfoDto> waitCallingStus = new ArrayList<StuInfoDto>();
        for (String testRoom : testRoomList) {
        	if(testRoom != null) {
        		int testRoomId = Integer.parseInt(testRoom);
                student.setErid(testRoomId);
                student.setStustatus(1);
                callingStus = stuService.selectStusByErIdAndState(student);
                if (callingStus.size() > 0 && waitCallingStus != null) {
                    studentInfoDtos.addAll(callingStus);
                }
                // 获取备考考生
                showStuDto.setErid(testRoomId);
                showStuDto.setTesttime((Integer)application.getAttribute("testtime"));
                waitCallingStus = stuService.selectWaitCallingStuDtos(showStuDto);
                if (waitCallingStus.size() > 0 && waitCallingStus != null) {
                    studentInfoDtos.addAll(callingStus);
                }
        	}
        }
        map.put("callingStu", callingStus);
        map.put("waitCallingStu", waitCallingStus);
        return map;
    }

    /**
     * 
     * @Title: produceCallingStu
     * @Description: (根据候考室id 生成该候考室被呼叫学生的语音文件（同样候考室同样学生不能生成两次）)
     * @realization:
     * @author: cx
     * @param request
     * @param response
     * @param erid
     * @return fileName
     */
    public String produceCallingStu(HttpServletRequest request, HttpServletResponse response, int erid) {
        ShowStuDto showStuDto  = new ShowStuDto();
        showStuDto.setErid(erid);
    	Map<String, List<StuInfoDto>>  map = this.getCallingStu(showStuDto);
        System.out.print("当前呼叫的人：");
        for (StuInfoDto stuInfoDto : map.get("callingStu")) {
            System.out.print(stuInfoDto.getStuname() + "\t");
        }
        System.out.println();
        CallingUtil callingUtil = new CallingUtil();
        return callingUtil.produceWar(request, map.get("callingStu"), erid);
    }

}
