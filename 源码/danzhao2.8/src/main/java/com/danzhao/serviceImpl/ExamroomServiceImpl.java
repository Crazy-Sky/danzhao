package com.danzhao.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.Examroom;
import com.danzhao.bean.ExamroomExample;
import com.danzhao.dao.ExamroomMapper;
import com.danzhao.dto.ExamroomDto;
import com.danzhao.service.ExamroomService;

@Service
public class ExamroomServiceImpl implements ExamroomService{

	@Autowired
	ExamroomMapper examroomMapper;

	@Override
	public int selectIsErName(Examroom examroom) {
		ExamroomExample examroomExample = new ExamroomExample();
		ExamroomExample.Criteria criteria = examroomExample.createCriteria();
		criteria.andErnameEqualTo(examroom.getErname());
		List<Examroom> examrooms = examroomMapper.selectByExample(examroomExample);
		int message = 0;
		if(examrooms.size() > 0){
			if(examrooms.size() == 1 && examrooms.get(0).getErid() == examroom.getErid()){
				message = 0;
			}else{
				message = 1;
			}
		}
		return message;
	}

	@Override
	public int insertOneExamroom(Examroom examroom) {
		return examroomMapper.insertSelective(examroom);
	}

	@Override
	public int updateOneExamroom(Examroom examroom) {
		return examroomMapper.updateByPrimaryKeySelective(examroom);
	}

	@Override
	public Examroom selectOneExamroom(int erid) {
		// TODO Auto-generated method stub
		return examroomMapper.selectByPrimaryKey(erid);
	}

	@Override
	public List<Examroom> selectAllExamroomByDept(int deptid) {
		ExamroomExample examroomExample = new ExamroomExample();
		ExamroomExample.Criteria criteria = examroomExample.createCriteria();
		criteria.andDeptidEqualTo(deptid);
		return examroomMapper.selectByExample(examroomExample);
	}

	@Override
	public int deleteOne(int erid) {
		return examroomMapper.deleteByPrimaryKey(erid);
	}

	@Override
	public List<ExamroomDto> selectErDtosByDept(int deptid) {
		return examroomMapper.selectErDtosByDept(deptid);
	}
	
	@Override
	public List<ExamroomDto> selectErDtosByDeptAndType(Examroom examroom) {
		return examroomMapper.selectErDtosByDeptAndType(examroom);
	}
	
	@Override
	public List<ExamroomDto> selectsByDeptAndType(Examroom examroom) {
		return examroomMapper.selectsByDeptAndType(examroom);
	}

    @Override
    public Examroom selectOneByName(String ername) {
        ExamroomExample examroomExample = new ExamroomExample();
        ExamroomExample.Criteria criteria = examroomExample.createCriteria();
        criteria.andErnameEqualTo(ername);
        List<Examroom> examrooms = examroomMapper.selectByExample(examroomExample);
        if(examrooms.size() > 0){
            return examrooms.get(0);
        }else{
            return null;
        }
    }

	@Override
	public ExamroomDto selectExamroomDtoByPrimary(int erid) {
		return examroomMapper.selectDtoByPrimaryKey(erid);
	}
}
