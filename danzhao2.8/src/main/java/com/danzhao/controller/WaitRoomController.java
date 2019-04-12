package com.danzhao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examroom;
import com.danzhao.bean.Student;
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
    public List<StuInfoDto> getCallingStu(HttpServletRequest request, HttpServletResponse response, int erid) {
        // 根据考场号获取其中的专业
        Examroom examroom = examroomService.selectOneExamroom(erid);
        List<String> testRoomList = StringUtil.StringToList(examroom.getTestRoomList());
        List<StuInfoDto> studentInfoDtos = new ArrayList<StuInfoDto>();
        // 获取每个专业中正在被呼叫的学生
        Student student = new Student();
        for (String testRoom : testRoomList) {
            int testRoomId = Integer.parseInt(testRoom);
            // application.setAttribute("exam_"+erid+"prof_"+profid, 0);
            student.setErid(testRoomId);
            student.setStustatus(1);
            List<StuInfoDto> studentInfoDtos2 = stuService.selectStusByErIdAndState(student);
            if (studentInfoDtos2.size() > 0) {
                studentInfoDtos.addAll(studentInfoDtos2);
            }
        }
        return studentInfoDtos;
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
        List<StuInfoDto> studentInfoDtos = this.getCallingStu(request, response, erid);
        System.out.print("当前呼叫的人：");
        for (StuInfoDto stuInfoDto : studentInfoDtos) {
            System.out.print(stuInfoDto.getStuname() + "\t");
        }
        System.out.println();
        CallingUtil callingUtil = new CallingUtil();
        return callingUtil.produceWar(request, studentInfoDtos, erid);
    }

}
