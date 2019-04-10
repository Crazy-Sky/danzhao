package com.danzhao.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.Profession;
import com.danzhao.bean.ProfessionExample;
import com.danzhao.dao.ExamroomMapper;
import com.danzhao.dao.ProfessionMapper;
import com.danzhao.service.ProfService;

@Service
public class ProfServiceImpl implements ProfService {

    @Autowired
    ProfessionMapper profMapper;

    @Autowired
    ExamroomMapper examroomMapper;

    @Override
    public int insertOne(Profession profession) {
        // TODO Auto-generated method stub
        return profMapper.insertSelective(profession);
    }

    @Override
    public int updateOne(Profession profession) {
        // TODO Auto-generated method stub
        return profMapper.updateByPrimaryKeySelective(profession);
    }

    @Override
    public List<Profession> selectAll() {
        // TODO Auto-generated method stub
        return profMapper.selectByExample(null);
    }

    @Override
    public List<Profession> selectByDept(int deptId) {
        // TODO Auto-generated method stub
        ProfessionExample professionExample = new ProfessionExample();
        ProfessionExample.Criteria criteria = professionExample.createCriteria();
        criteria.andDeptidEqualTo(deptId);
        return profMapper.selectByExample(professionExample);
    }

    @Override
    public int selectIsByprofName(Profession profession) {
        // TODO Auto-generated method stub
        ProfessionExample professionExample = new ProfessionExample();
        ProfessionExample.Criteria criteria = professionExample.createCriteria();
        criteria.andProfnameEqualTo(profession.getProfname());
        criteria.andDeptidEqualTo(profession.getDeptid());
        int message = 0;
        List<Profession> professions = profMapper.selectByExample(professionExample);
        if (professions.size() > 0) {
            if (professions.size() == 1 && professions.get(0).getProfid() == profession.getProfid()) {
                message = 0;
            } else {
                message = 1;
            }
        }
        return message;
    }

    @Override
    public Profession selectOneProf(int profid) {
        return profMapper.selectByPrimaryKey(profid);
    }

    /**
     * 删除专业 删除此专业的学生
     * 
     */
    @Override
    public int deleteOne(int profid) {
        // Profession profession = profMapper.selectByPrimaryKey(profid);
        // int deptid = profession.getDeptid();
        // // 获取此系部的所有考场
        // List<ExamroomDto> examrooms = examroomMapper.selectErDtosByDept(deptid);
        // List<String> profs, tprofs;
        // Examroom examroom = null;
        // for (ExamroomDto examroomDto : examrooms) {
        // // 获取专业
        // profs = examroomDto.getProflists();
        // tprofs = new ArrayList<String>();
        // examroom = new Examroom();
        // examroom.setErid(examroomDto.getErid());
        // if(profs != null){
        // for (String prof : profs) {
        // if(Integer.parseInt(prof) != profid){
        // tprofs.add(prof);
        // }
        // }
        // examroom.setProflist(StringUtil.listToString(tprofs));
        // examroomMapper.updateByPrimaryKeySelective(examroom);
        // }
        // }
        return profMapper.deleteByPrimaryKey(profid);
    }

    @Override
    public Profession selectOneByProfName(String profname) {
        ProfessionExample professionExample = new ProfessionExample();
        ProfessionExample.Criteria criteria = professionExample.createCriteria();
        criteria.andProfnameEqualTo(profname);
        List<Profession> professions = profMapper.selectByExample(professionExample);
        if (professions.size() > 0) {
            return professions.get(0);
        }
        return null;
    }

}
