package com.danzhao.util;



import com.danzhao.bean.Department;
import com.danzhao.bean.Profession;
import com.danzhao.bean.User;
import com.danzhao.service.DeptService;
import com.danzhao.service.ProfService;
import com.danzhao.service.UserService;

public class CheckUtil {

	// 检查user是否合格
	public static int checkSaveUser(UserService userService,User user){
		if(user == null){
			return 0;
		}
		//查看手机号是否存在
		if(user.getUserphone() != null && userService.selectIsPhone(user) == 1){
			return -1;
		}
		//查看邮箱是否存在
		if(user.getUseremail() != null && userService.selectIsEmail(user) == 1){
			return -2;
		}
		//系部管理员一个系只有一个
		if(user.getUserrole() == 2 && user.getDeptid() != null && userService.selectIsDeptAdmin(user) == 1){
			return -3;
		}
		//一个考场只有一个主考官
		if(user.getUserrole() == 3 && user.getErid() != null && userService.selectIsExaminerByExamroom(user) == 1){
			return -4;
		}
		//一个考场只有一个候考管理员
		if(user.getUserrole() == 4 && user.getErid() != null && userService.selectIsExaminerByExamroom(user) == 1){
			return -5;
		}
		//一个考场只有一个统分员
		if(user.getUserrole() == 6 && user.getErid() != null && userService.selectIsExaminerByExamroom(user) == 1){
			return -6;
		}
		return 1;
	}
	
	//检查系部Department
	public static int checkDept(Department department,DeptService deptService){
		if(department == null){
			return 0;
		}
		//检查专业名称是否存在
		if(deptService.selectIsName(department) == 1){
			return -1; //名称已存在
		}
		//检查专业大类是否存在
		if(deptService.selectIsProfClass(department) == 1){
			return -2; //专业大类已存在
		}
		return 1;
	}
	
	//检查专业Profession
	public static int checkProf(Profession profession, ProfService profService){
		if(profession == null){
			return 0;
		}
		if(profService.selectIsByprofName(profession) == 1){
			return -1;
		}
		return 1;
	}
}
