package com.danzhao.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.danzhao.bean.User;
import com.danzhao.dao.UserMapper;
import com.danzhao.dto.UserLoginDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class UserTest {

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	SqlSession session;
	
	@Test
	public void selectTest(){
		System.out.println(userMapper);
		UserLoginDto userLoginDto = new UserLoginDto("13973341321", "123456", 1);
		User user = userMapper.selectOneByDto(userLoginDto);
		System.out.println(user.getUsername());
	}
}
