package com.danzhao.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.User;
import com.danzhao.bean.UserExample;
import com.danzhao.dao.UserMapper;
import com.danzhao.dto.UserDto;
import com.danzhao.dto.UserLoginDto;
import com.danzhao.service.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public int selectIsPhone(User user) {
		int message = 0;
		//查看是否存在
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUserphoneEqualTo(user.getUserphone());
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			//如果存在一个且是本身 true
			if(users.size() == 1 && users.get(0).getUserid() == user.getUserid()){
				message = 0;
			}else{
				message = 1; //已存在 false
			}
		}
		return message;
	}

	@Override
	public int selectIsExaminerByExamroom(User user) {
		int message = 0;
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUserroleEqualTo(user.getUserrole());
		criteria.andEridEqualTo(user.getErid());
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			//如果存在一个且是本身 true
			if(users.size() == 1 && users.get(0).getUserid() == user.getUserid()){
				message = 0;
			}else{
				message = 1; //已存在 false
			}
		}
		return message;
	}
	
	@Override
	public int selectIsDeptAdmin(User user) {
		int message = 0;
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUserroleEqualTo(2);
		criteria.andDeptidEqualTo(user.getDeptid());
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			//如果存在一个且是本身 true
			if(users.size() == 1 && users.get(0).getUserid() == user.getUserid()){
				message = 0;
			}else{
				message = 1; //已存在 false
			}
		}
		return message;
	}
	
	@Override
	public int selectIsEmail(User user) {
		int message = 0;
		//查看是否存在
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUseremailEqualTo(user.getUseremail());
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			//如果存在一个且是本身 true
			if(users.size() == 1 && user.getUserid() != null && users.get(0).getUserid() == user.getUserid()){
				message = 0;
			}else{
				message = 1; //已存在 false
			}
		}
		return message;
	}
	
	@Override
	public int selectIsExamroom(User user) {
		int message = 0;
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andEridEqualTo(user.getErid());
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			//如果存在一个且是本身 true
			if(users.size() == 1 && users.get(0).getUserid() == user.getUserid()){
				message = 0;
			}else{
				message = 1; //已存在 false
			}
		}
		return message;
	}
	
	@Override
	public User selectOneByDto(UserLoginDto userLoginDto) {
		return userMapper.selectOneByDto(userLoginDto);
	}

	@Override
	public int insertUser(User user) {
		user.setUserpwd("123456"); // 密码默认为123456
		return userMapper.insertSelective(user);
	}

	@Override
	public int updateByPrimaryKeySelective(User user) {
		int message = userMapper.updateByPrimaryKeySelective(user);
		return message;
	}

	@Override
	public User selectOneUser(int userid) {
		return userMapper.selectByPrimaryKey(userid);
	}


	

	@Override
	public User selectOneUserByExamroom(int erid) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andEridEqualTo(erid);
		criteria.andUserroleBetween(3, 4);
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			return userMapper.selectByExample(userExample).get(0);
		}else{
			return null;
		}
		
		
	}

	@Override
	public int updatePwdByEmail(User user) {
		return userMapper.updatePwdByEmail(user);
	}
	

	@Override
	public int selectIsPhoneToResetPwd(String phone) {
		int message = 0;
		//查看是否存在
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUserphoneEqualTo(phone);
		List<User> users = userMapper.selectByExample(userExample);
		if(users.size() > 0){
			message = 1; //存在
		}
		return message;
	}

	@Override
	public UserDto selectOneDtoUser(int userid) {
		return userMapper.selectOneDto(userid);
	}

	@Override
	public int deleteOne(int userid) {
		return userMapper.deleteByPrimaryKey(userid);
	}

	@Override
	public int initExaminerIsGrade(int erid) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andEridEqualTo(erid);
		List<User> users = userMapper.selectByExample(userExample);
		for (User user : users) {
			user.setIsgrade(0);
			userMapper.updateByPrimaryKeySelective(user);
		}
		return 1;
	}

	@Override
	public int selectExaminerIsGradeByErId(int erid) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andEridEqualTo(erid);
		criteria.andUserroleEqualTo(3);
		
		UserExample.Criteria criteria2 = userExample.createCriteria();
		criteria2.andEridEqualTo(erid);
		criteria2.andUserroleEqualTo(5);
		
		userExample.or(criteria2);
		List<User> users = userMapper.selectByExample(userExample);
		for (User user : users) {
			if(user.getIsgrade() == 0){ //0 ： 未评分
				return 0;
			}
		}
		return 1;
	}

	@Override
	public int selectCountExaminerIsGradeByErId(int erid) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andEridEqualTo(erid);
		criteria.andUserroleEqualTo(6);
		 
		List<User> users = userMapper.selectByExample(userExample);
		for (User user : users) {
			if(user.getIsgrade() == 0){ //0 ： 未评分
				return 0;
			}
		}
		return 1;
	}
	
    @Override
    public List<UserDto> selectDtos(int deptid) {
        return userMapper.selectDtos(deptid);
    }

    @Override
    public List<UserDto> selectDtosByRole(User user) {
        return userMapper.selectDtosByRole(user);
    }

    @Override
    public List<UserDto> selectAllExaminer(int deptid) {
        return userMapper.selectAllExaminer(deptid);
    }

}
