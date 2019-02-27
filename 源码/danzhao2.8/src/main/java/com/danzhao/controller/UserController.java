package com.danzhao.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danzhao.bean.User;
import com.danzhao.dto.UserDto;
import com.danzhao.dto.UserLoginDto;
import com.danzhao.service.DeptService;
import com.danzhao.service.EmailService;
import com.danzhao.service.ExamroomService;
import com.danzhao.service.UserRoleService;
import com.danzhao.service.UserService;
import com.danzhao.util.CheckUtil;


@Controller
@RequestMapping("user/")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;
	@Autowired
	ExamroomService examroomService;
	@Autowired
	UserRoleService userRoleService;
	@Autowired
	EmailService emailService;
	
	
	@RequestMapping("UserLogin")
	@ResponseBody
	public int UserLogin(HttpSession session,UserLoginDto userLoginDto) throws IllegalAccessException, InvocationTargetException{
//		System.out.println("run");
		int message = 0;
		User tuser = userService.selectOneByDto(userLoginDto);
		if(tuser == null){
			message = -1; //账号错误
		}else if(!tuser.getUserpwd().equals(userLoginDto.getUserpwd())){
			message = 0; //密码错误
		}else{ //正确
			UserDto userDto = userService.selectOneDtoUser(tuser.getUserid());
			session.setAttribute("user", userDto);
			session.setAttribute("userCorePage", "Welcome");
			session.setAttribute("menuSelected", null);
			message =  1;
		}
		System.out.println(message);
		return message;
	}
	
	// 去登陆
	@RequestMapping("goUserLogin")
	public String goUserLogin(){
		return "login/login_user";
	}
	
	// 退出登陆
	@RequestMapping("outLogin")
	public String outLogin(HttpSession session){
		session.removeAttribute("user");
		session.removeAttribute("userCorePage");
		return "login/login_user";
	}
	
	
	//跳转链接
	//menuSelected：保存菜单栏选中状态(数组，每个元素表示当前选中的是第几个)
	@RequestMapping("UserSkip")
	public String UserSkip (HttpSession session,
			@RequestParam(value="page",defaultValue="Welcome")String page,
			@RequestParam(value="oneMenu",defaultValue="-1")int oneMenu, 
			@RequestParam(value="twoMenu",defaultValue="-1")int twoMenu){
		
		if(oneMenu == -1 && twoMenu == -1){
			session.setAttribute("menuSelected", null);
		}else{
			int [] menuSelected = {oneMenu,twoMenu};
			session.setAttribute("menuSelected", menuSelected);
		}
		session.setAttribute("exatOprt", "insert");
		session.removeAttribute("rightparentid");
		session.setAttribute("userCorePage", page);
		return "user/Main";
	}
	
	//返回主页
	@RequestMapping("returnMain")
	public String returnMain (){
		return "user/Main";
	}
	
	//获取单个用户
	@RequestMapping("selectOneUser")
	@ResponseBody
	public UserDto selectOneUser(HttpServletRequest request,
			HttpServletResponse response,int userid) throws IllegalAccessException, InvocationTargetException{
		UserDto userDto = userService.selectOneDtoUser(userid);
		return userDto;
	}
	
	//去修改界面
	@RequestMapping("goUpdate")
	public String goUpdateUser (HttpSession session,String page,int updateId){
		session.setAttribute("userCorePage", page);
		session.setAttribute("updateId", updateId);
		return "user/Main";
	}
	
	//修改自己的信息
	@RequestMapping("updateSelf")
	@ResponseBody
	public int updateSelf(HttpServletRequest request,
			HttpServletResponse response,User user){
		int message = 0;
		//检查信息是否合格
		message = CheckUtil.checkSaveUser(userService, user);
		if(message == 1){
			message = userService.updateByPrimaryKeySelective(user);
		}
		refreshUser(request.getSession(), user.getUserid());
		return message;
	}
	
	//修改单个用户
    @RequestMapping("updateOneUser")
    @ResponseBody
    public int updateOneUser(HttpServletRequest request,
            HttpServletResponse response,User user){
        int message = 0;
        //检查信息是否合格
        message = CheckUtil.checkSaveUser(userService, user);
        if(message == 1){
            message = userService.updateByPrimaryKeySelective(user);
        }
        return message;
    }
	
	//更新自己的信息
	@RequestMapping("refreshUser")
	public void refreshUser(HttpSession session,
			int userid){
		UserDto userDto = userService.selectOneDtoUser(userid);
		session.setAttribute("user", userDto);
		System.out.println(userid);
	}
	
	//添加单个用户
	@RequestMapping("insertOneUser")
	@ResponseBody
	public int InsertOne(HttpServletRequest request,
			HttpServletResponse response,User user){
		int message = 0;
		//检查信息是否合格
		message = CheckUtil.checkSaveUser(userService, user);
		if(message == 1){
			message = userService.insertUser(user);
		}
		return message;
	}
	
	//根据角色查询用户
	@RequestMapping("selectUserByRole")
	@ResponseBody
	public List<UserDto> selectUserByRole(HttpServletRequest request,
            HttpServletResponse response,User user) throws IllegalAccessException, InvocationTargetException{
		List<UserDto> userDtos = userService.selectDtosByRole(user);
		return userDtos;
	}
	
	//根据角色分页查询用户
	@RequestMapping("selectUserDtosByRolePaging")
	@ResponseBody
	public Object selectUserDtosByRolePaging(HttpServletRequest request,
			HttpServletResponse response,User user,
			@RequestParam(value="nowPage", defaultValue="1")int nowPage,
			@RequestParam(value="pageSize", defaultValue="8")int pageSize) throws IllegalAccessException, InvocationTargetException{
		if(user.getUserrole() == null || user.getUserrole() == 0){
			return userService.selectAllExaminer(user.getDeptid());
		}else{
			return userService.selectDtosByRole(user);
		}
	}
	
	//查询所有考官3-6
	@RequestMapping("selectAllExaminer")
	@ResponseBody
	public List<UserDto> selectAllExaminer(HttpServletRequest request,
            HttpServletResponse response,int deptid) throws IllegalAccessException, InvocationTargetException{
		List<UserDto> userDtos = userService.selectAllExaminer(deptid);
		return userDtos;
	}
	
	//删除
	@RequestMapping("deleteOne")
	@ResponseBody
	public int deleteOne(HttpServletRequest request,
			HttpServletResponse response,int id){
		if(id == 0){
			return 0;
		}
		return userService.deleteOne(id);
	}
	
}
