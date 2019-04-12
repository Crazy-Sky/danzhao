package com.danzhao.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.JSONString;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.danzhao.dto.ExaminerGradeDto;
import com.danzhao.service.LevelrightService;
import com.danzhao.service.StuService;
import com.danzhao.util.GradeUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	StuService stuService;
	
	@Autowired
	LevelrightService levelrightService;
	
	@Test
	public void test() {
		// TODO 根据主键查询一个商品
		List<Map<String, Object>> tList = stuService.selectStuGradeByErIdAnDeptAndkType(3, "", -1);
		List<Map<String, String>> mList = new ArrayList<Map<String, String>>();
		for (int i = 0; i < tList.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			Map<String, Object> tmap = tList.get(i);
			map.put("id", i+"");
            map.put("prof",tmap.get("profName") + "");
            map.put("number", tmap.get("examNumber") + "");
            map.put("name", tmap.get("stuName") + "");
            float g1 = 0f,g2 = 0f,g3 =0f;
            if (tmap.get("score") != null) {
            	map.put("g1", tmap.get("score") + "");
            	g1 = (Float) tmap.get("score");
            }else {
            	map.put("g1","0");
            }
            map.put("g2", "0");
            map.put("g3", "0");
			if ((i + 1) < tList.size() && tList.get(i).get("stuId").equals(tList.get(i + 1).get("stuId"))) {		
				map.put("g2", tList.get(++i).get("score") + "");
				g2 = (Float) tList.get(i).get("score");
			}
			if ((i + 1) < tList.size() && tList.get(i).get("stuId").equals(tList.get(i + 1).get("stuId"))) {		
				map.put("g3", tList.get(++i).get("score") + "");
				g3 = (Float) tList.get(i).get("score");
			}
			map.put("gavg", (float)(Math.round((g1  + g2 + g3) / 3*10))/10 + "");
            map.put("grade", (g1  + g2 + g3) + "");
            mList.add(map);
		}
		
		for (Map<String, String> map : mList) {
			System.out.println(map);
		}
	}
}
