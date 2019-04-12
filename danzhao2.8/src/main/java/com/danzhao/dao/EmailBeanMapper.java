package com.danzhao.dao;

import com.danzhao.bean.EmailBean;
import com.danzhao.bean.EmailBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmailBeanMapper {
    long countByExample(EmailBeanExample example);

    int deleteByExample(EmailBeanExample example);

    int deleteByPrimaryKey(Integer emailuserid);

    int insert(EmailBean record);

    int insertSelective(EmailBean record);

    List<EmailBean> selectByExample(EmailBeanExample example);

    EmailBean selectByPrimaryKey(Integer emailuserid);

    int updateByExampleSelective(@Param("record") EmailBean record, @Param("example") EmailBeanExample example);

    int updateByExample(@Param("record") EmailBean record, @Param("example") EmailBeanExample example);

    int updateByPrimaryKeySelective(EmailBean record);

    int updateByPrimaryKey(EmailBean record);
}