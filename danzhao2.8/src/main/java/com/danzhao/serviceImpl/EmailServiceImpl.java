package com.danzhao.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.EmailBean;
import com.danzhao.dao.EmailBeanMapper;
import com.danzhao.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	EmailBeanMapper emailBeanMapper;
	
	@Override
	public EmailBean selectOne(int emailid) {
		return emailBeanMapper.selectByPrimaryKey(emailid);
	}

	
}
