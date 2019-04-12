package com.danzhao.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.Examroom;
import com.danzhao.dto.ExamroomDto;
import com.danzhao.service.DeptService;
import com.danzhao.service.ExamroomService;
import com.danzhao.service.ProfService;
import com.danzhao.service.UserService;
import com.danzhao.util.StringUtil;

@Controller
@RequestMapping("examroom/")
public class ExamroomController {

    @Autowired
    ExamroomService examroomService;

    @Autowired
    DeptService deptService;

    @Autowired
    UserService userService;

    @Autowired
    ProfService profService;

    @RequestMapping("insertOneEr")
    @ResponseBody
    public int insert(HttpServletRequest request, HttpServletResponse response, Examroom examroom,
        String[] testRoomList) {
        int message = 0;
        if (examroomService.selectIsErName(examroom) == 1) {
            return -1;
        }
        if (examroom.getErtype() == 0 && testRoomList != null) { // 如果是测试考场

            List<String> testRoomLists = new ArrayList<String>();
            for (int i = 0; i < testRoomList.length; i++) {
                testRoomLists.add(testRoomList[i]);
            }
            examroom.setTestRoomList(StringUtil.listToString(testRoomLists));
        }

        message = examroomService.insertOneExamroom(examroom);
        return message;
    }

    @RequestMapping("selectOneErDto")
    @ResponseBody
    public ExamroomDto selectOneErDto(HttpServletRequest request, HttpServletResponse response, int erid)
        throws IllegalAccessException, InvocationTargetException {
        ExamroomDto examroomDto = examroomService.selectExamroomDtoByPrimary(erid);
        if (examroomDto.gettestRoomList() != null) {
            examroomDto.settestRoomLists(StringUtil.StringToList(examroomDto.gettestRoomList()));
        }
        return examroomDto;
    }

    @RequestMapping("selectAllErByDept")
    @ResponseBody
    public List<ExamroomDto> selectAllErByDept(HttpServletRequest request, HttpServletResponse response, int deptid)
        throws IllegalAccessException, InvocationTargetException {
        List<ExamroomDto> examroomDtos = examroomService.selectErDtosByDept(deptid);
        return examroomDtos;
    }

    /**
     * 
     * @Title: selectErsByDeptAndType
     * @Description: (这里用一句话描述这个方法的作用)
     * @realization: (实现的方法)
     * @author: cx
     * @param request
     * @param response
     * @param examroom 需要deptid ertype
     * @return
     */
    @RequestMapping("selectErsByDeptAndType")
    @ResponseBody
    public List<ExamroomDto> selectErsByDeptAndType(HttpServletRequest request, HttpServletResponse response,
        Examroom examroom) {
        List<ExamroomDto> examroomDtos = examroomService.selectErDtosByDeptAndType(examroom);
        return examroomDtos;
    }

    /**
     * 
     * @Title: selectsByDeptAndType
     * @Description: (selectsByDeptAndType)
     * @realization: (查询不带user的ErDto 用于select的显示)
     * @author: cx
     * @date 2019年1月6日
     * @param request
     * @param response
     * @param examroom 传入deptid ertype
     * @return
     */
    @RequestMapping("selectsByDeptAndType")
    @ResponseBody
    public List<ExamroomDto> selectsByDeptAndType(HttpServletRequest request, HttpServletResponse response,
        Examroom examroom) {
        List<ExamroomDto> examroomDtos = examroomService.selectsByDeptAndType(examroom);
        return examroomDtos;
    }

    // 根据系部查询考场
    @RequestMapping("selectAllTrueErByDept")
    @ResponseBody
    public List<Examroom> selectAllTrueErByDept(HttpServletRequest request, HttpServletResponse response, int deptid) {
        List<Examroom> examrooms = new ArrayList<Examroom>();
        examrooms = examroomService.selectAllExamroomByDept(deptid);
        return examrooms;
    }

    @RequestMapping("selectErDtosByDeptPaging")
    @ResponseBody
    public Object selectErDtosByDeptPaging(HttpServletRequest request, HttpServletResponse response, int deptid,
        @RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
        @RequestParam(value = "pageSize", defaultValue = "10") int pageSize)
        throws IllegalAccessException, InvocationTargetException {
        List<ExamroomDto> result = examroomService.selectErDtosByDept(deptid);
        List<ExamroomDto> examroomDtos = new ArrayList<ExamroomDto>();
        // 解析字符串 并将考场id字符串转化为name
        for (ExamroomDto examroomDto : result) {
            if (examroomDto.gettestRoomList() != null) {
                List<String> testRoomListNames = new ArrayList<String>();
                examroomDto.settestRoomLists(StringUtil.StringToList(examroomDto.gettestRoomList()));
                for (String id : examroomDto.gettestRoomLists()) {
                    ExamroomDto examroom = examroomService.selectExamroomDtoByPrimary(Integer.parseInt(id));
                    testRoomListNames.add(examroom.getErname());
                }
                examroomDto.settestRoomListsNames(testRoomListNames);
            }
            examroomDtos.add(examroomDto);
        }
        return examroomDtos;
    }

    @RequestMapping("updateOneEr")
    @ResponseBody
    public int updateOneEr(HttpServletRequest request, HttpServletResponse response, Examroom examroom,
        String[] testRoomList) {
        int message = 0;
        if (examroomService.selectIsErName(examroom) == 1) {
            return -1;
        }
        if (examroom.getErtype() == 0) { // 如果是测试考场
            List<String> testRoomLists = new ArrayList<String>();
            if (testRoomList != null) {
                for (int i = 0; i < testRoomList.length; i++) {
                    testRoomLists.add(testRoomList[i]);
                }
            }
            examroom.setTestRoomList(StringUtil.listToString(testRoomLists));
        }
        message = examroomService.updateOneExamroom(examroom);
        return message;
    }

    // 删除
    @RequestMapping("deleteOne")
    @ResponseBody
    public int deleteOne(HttpServletRequest request, HttpServletResponse response, int id) {
        if (id == 0) {
            return 0;
        }
        return examroomService.deleteOne(id);
    }

}
