package com.danzhao.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examroom;
import com.danzhao.bean.Student;
import com.danzhao.dto.ExamroomDto;
import com.danzhao.dto.ShowStuDto;
import com.danzhao.dto.StuInfoDto;
import com.danzhao.service.ExamroomService;
import com.danzhao.service.StuService;
import com.danzhao.service.UserService;
import com.danzhao.util.StringUtil;

/**
 * 
 * <p>
 * Title:ChiefExaminerController
 * </p>
 * <p>
 * Description: 主考官控制器
 * </p>
 * 
 * @author cx
 * @date 2018年11月14日
 *
 */
@Controller
@RequestMapping("chiefExaminer/")
public class ChiefExaminerController {

    @Autowired
    ExamroomService examroomService;

    @Autowired
    StuService stuService;

    @Autowired
    UserService userService;

    /**
     * 
     * @Title: CallingStu
     * @Description: (操作考生 如：呼叫考生、开始考试)
     * @realization: (首先根据学生id改变数据库中学生状态，然后改变该考生的专业的session状态 表示有更新) 0：表示候考 1：表示正在呼叫 2：表示正在考试 3：表示考试结束 4：缺考 5：评分结束
     * @author: cx
     * @param session
     * @param stuid
     * @return
     */
    @RequestMapping("updateStuState")
    @ResponseBody
    public int updateStuState(HttpSession session, int stuid, int state, int deptid, int erid) {
        System.out.println("state:" + state);
        if (stuid == 0) {
            return 0;
        }
        if (state == 2) { // 开始考试 把考场所有考官的评分状态初始化
            userService.initExaminerIsGrade(erid);
            stuService.updateteststarttime(stuid);
        }
        if (state == 5) { // 结束评分 判断所有考官是否已经提交评分 计算总成绩
            if (userService.selectExaminerIsGradeByErId(erid) == 0) { // 还有考官未评分
                System.out.println(-1);
                return -1;
            } else if (userService.selectCountExaminerIsGradeByErId(erid) == 0) {
                System.out.println(-2);
                return -2;
            } else {
                stuService.updatetestendtime(stuid);
                stuService.countTotleScore(stuid);
            }
        }
        int message = 0;
        // 改变考生状态
        Student student = stuService.selectOneStu(stuid);
        student.setStustatus(state);
        message = stuService.updateOneStu(student);
        // 改变该考生的专业的session状态 表示被呼叫人有更新 如果是结束考试则不改变(结束考试，被呼叫的人没变)
        if (state == 1 || state == 2 || state == 4) {
            int testRoomId = student.getErid();
            ServletContext application = session.getServletContext();
            // 获取所有候考场 然后把存在此测试考场的候考场的状态赋为1
            Examroom tExamroom = new Examroom();
            tExamroom.setDeptid(deptid);
            tExamroom.setErtype(0);
            List<ExamroomDto> examrooms = examroomService.selectErDtosByDeptAndType(tExamroom);
            for (ExamroomDto examroom : examrooms) {
                List<String> testRoomList = StringUtil.StringToList(examroom.gettestRoomList());
                for (String string : testRoomList) {
                    if (Integer.parseInt(string) == testRoomId) {
                        System.out.println("状态改变的考场：" + "exam_" + examroom.getErid() + "testRoom_" + testRoomId);
                        application.setAttribute("exam_" + examroom.getErid() + "testRoom_" + testRoomId, 1);
                        break;
                    }
                }
            }
        }
        return message;
    }

    /**
     * 
     * @Title: getStuInfoDtoByErId
     * @Description: (根据考场号、考生状态、考试时间获取学生)
     * @realization: (实现的方法) 0：表示候考 1：表示正在呼叫 2：表示正在考试 3：表示考试结束 4：缺考 5： 评分结束 testTime: 1代表上午，2代表下午，3代表晚上；
     * @author: cx
     * @param request
     * @param response
     * @param student 需要erid、stustatus、testtime
     * @return
     */
    @RequestMapping("getStuInfoDtoByErIdAndStateAndTestTime")
    @ResponseBody
    public List<StuInfoDto> getStuInfoDtoByErIdAndStateAndTestTime(HttpServletRequest request,
        HttpServletResponse response, Student student) {
        if (student.getErid() == 0) {
            return null;
        }
        List<StuInfoDto> studentInfoDtos = stuService.selectStusByErIdAndState(student);
        return studentInfoDtos;
    }

    // 分页
    @RequestMapping("getStuInfoDtoByErIdAndStateAndTestTimePaging")
    @ResponseBody
    public Object getStuInfoDtoByErIdAndStateAndTestTimePaging(HttpServletRequest request, HttpServletResponse response,
        Student student, @RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
        @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        if (student.getErid() == 0) {
            return null;
        }
        List<StuInfoDto> studentInfoDtos = stuService.selectStusByErIdAndState(student);
        return studentInfoDtos;
    }

    /**
     * 
     * @Title: getStuInfoDtoByShowStuDtoPaging
     * @Description: (根据考场号、考生多个状态、考试时间分页获取学生)
     * @realization: (实现的方法)
     * @author: cx
     * @param request
     * @param response
     * @param showStuDto 需要 erid beginState endState testtime
     * @return
     */
    @RequestMapping("getStuInfoDtoByShowStuDtoPaging")
    @ResponseBody
    public Object getStuInfoDtoByShowStuDtoPaging(HttpServletRequest request, HttpServletResponse response,
        ShowStuDto showStuDto, @RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
        @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        if (showStuDto.getErid() == 0) {
            return null;
        }
        // System.out.println("当前页："+nowPage);
        List<StuInfoDto> studentInfoDtos = stuService.selectStusByShowStuDto(showStuDto);
        return studentInfoDtos;
    }

}
