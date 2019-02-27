package com.danzhao.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danzhao.bean.ExaminerGrade;
import com.danzhao.bean.ExaminerGradeExample;
import com.danzhao.bean.Testright;
import com.danzhao.bean.User;
import com.danzhao.dao.ExaminerGradeMapper;
import com.danzhao.dto.ExaminerGradeDto;
import com.danzhao.service.ExaminerGradeService;
import com.danzhao.service.LevelrightService;
import com.danzhao.service.TestrightService;
import com.danzhao.service.UserService;
import com.danzhao.util.GradeUtil;

@Service
public class ExaminerGradeServiceImpl implements ExaminerGradeService{

	@Autowired
	ExaminerGradeMapper examinerGradeMapper;
	
	@Autowired
	TestrightService testrightService;
	
	@Autowired
	LevelrightService levelrightService;
	
	@Autowired
	UserService userService;
	
	@Override
	public int saveOne(ExaminerGrade examinerGrade,List<String> sroce1,List<String> sroce2) {
		String result = "";
		int testRightId,rightvalue,levelId, levelvalue;
		Float score1 = 0f, score2 = 0f , t;
		Testright testright1 = null, testright2 = null;
		for (String s : sroce1) {
			//计算成绩
			testRightId = Integer.parseInt(s.substring(0, s.indexOf(":")));
			testright1 = testrightService.selectOneTestrightById(testRightId);
			rightvalue = testright1.getRightvalue();
			System.out.println("权重值："+rightvalue);
			levelId = Integer.parseInt(s.substring(s.indexOf(":")+1));
			levelvalue = levelrightService.selectOneLevelright(levelId).getLevelvalue();
			System.out.println("等级值："+levelvalue);
			t = Float.valueOf((float) (levelvalue*0.01));
			System.out.println("转换："+t);
			t *= rightvalue;
			System.out.println("成绩："+t);
			score1 += t;
			System.out.println(score1);
			
			result += s;
			result += ";";
		}
		if(testright1 != null){
			testright1 = testrightService.selectOneTestrightById(testright1.getRightparentid());
			score1 *= Float.valueOf((float) (testright1.getRightvalue()*0.01));
		}
		System.out.println("最终成绩1："+score1);
		
		result = result.substring(0, result.length()-1);
		result += "|";
		for (String s : sroce2) {
			//计算成绩
			testRightId = Integer.parseInt(s.substring(0, s.indexOf(":")));
			testright2 = testrightService.selectOneTestrightById(testRightId);
			rightvalue = testright2.getRightvalue();
			System.out.println("权重值："+rightvalue);
			
			levelId = Integer.parseInt(s.substring(s.indexOf(":")+1));
			levelvalue = levelrightService.selectOneLevelright(levelId).getLevelvalue();
			
			t = Float.valueOf((float) (levelvalue*0.01));
			t *= rightvalue;
			score2 += t;
			System.out.println(score2);
			
			result += s;
			result += ";";
		}
		if(testright2 != null){
			testright2 = testrightService.selectOneTestrightById(testright2.getRightparentid());
			score2 *= Float.valueOf((float) (testright2.getRightvalue()*0.01));
		}
		System.out.println("最终成绩2："+score2);
		result = result.substring(0, result.length()-1);
		System.out.println(result);
		//改变考官状态
		User user = userService.selectOneUser(examinerGrade.getExaminerid());
		user.setIsgrade(1);
		userService.updateByPrimaryKeySelective(user);
		//存入数据库
		examinerGrade.setResult(result);
		System.out.println("总成绩："+(score1+score2));
		examinerGrade.setScore(score1+score2);
		int gradeId = this.selectIsGrade(examinerGrade);
		int message = 0;
		if(gradeId != 0){
			examinerGrade.setExaminergardeid(gradeId);
			message = examinerGradeMapper.updateByPrimaryKeySelective(examinerGrade);
		}else{
			message = examinerGradeMapper.insertSelective(examinerGrade);
		}
		
		return message;
	}

	@Override
	public List<ExaminerGrade> selectAll() {
		return examinerGradeMapper.selectByExample(null);
	}

	@Override
	public int selectIsGrade(ExaminerGrade examinerGrade) {
		ExaminerGradeExample gradeExample = new ExaminerGradeExample();
		ExaminerGradeExample.Criteria criteria = gradeExample.createCriteria();
		criteria.andExamineridEqualTo(examinerGrade.getExaminerid());
		criteria.andStuidEqualTo(examinerGrade.getStuid());
		List<ExaminerGrade> grades = examinerGradeMapper.selectByExample(gradeExample);
		if(grades.size() > 0){
			return grades.get(0).getExaminergardeid();
		}else{
			return 0;
		}
	}

	@Override
	public ExaminerGrade selectOneById(int gradeid) {
		return examinerGradeMapper.selectByPrimaryKey(gradeid);
	}

	@Override
	public List<ExaminerGradeDto> selectExaminerGradesByStu(int stuid) {
		ExaminerGradeExample gradeExample = new ExaminerGradeExample();
		ExaminerGradeExample.Criteria criteria = gradeExample.createCriteria();
		criteria.andStuidEqualTo(stuid);
		List<ExaminerGradeDto> gradeDtos = examinerGradeMapper.selectGradeDtoByExample(gradeExample);
		// 填充dto
		for (int i = 0; i < gradeDtos.size(); i++) {
			gradeDtos.set(i, GradeUtil.fillExaminerGradeDto(gradeDtos.get(i)));
			// 将等级id 改成等级名称
			for (int j = 0; j < gradeDtos.get(i).getResult1_level().size(); j++) {
				String levelid = gradeDtos.get(i).getResult1_level().get(j);
				gradeDtos.get(i).getResult1_level().set(j, levelrightService.selectOneLevelright(Integer.parseInt(levelid)).getLevelname());
				
			}
			for (int j = 0; j < gradeDtos.get(i).getResult2_level().size(); j++) {
				String levelid = gradeDtos.get(i).getResult2_level().get(j);
				gradeDtos.get(i).getResult2_level().set(j, levelrightService.selectOneLevelright(Integer.parseInt(levelid)).getLevelname());
				
			}
		}
		return gradeDtos;
	}

	@Override
	public List<ExaminerGradeDto> selectExaminerGradesByExaminerId(int examinerid) {
		List<ExaminerGradeDto> gradeDtos = examinerGradeMapper.selectGradeDtoByExaminerId(examinerid);
		// 填充dto
		for (int i = 0; i < gradeDtos.size(); i++) {
			gradeDtos.set(i, GradeUtil.fillExaminerGradeDto(gradeDtos.get(i)));
		}
		return gradeDtos;
	}

	
	
}
