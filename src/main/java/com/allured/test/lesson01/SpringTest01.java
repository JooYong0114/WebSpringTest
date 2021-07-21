package com.allured.test.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/test01")
@Controller
public class SpringTest01 {
	
	@ResponseBody
	@RequestMapping("/1")
	public String testProject() {
		String str1 = "테스트 프로젝트 완성";
		String str2 = "해당 프로젝트를 통해서 문제 풀이를 진행 합니다.";
		return str1 + "\n" + str2;
	}
	
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Object> scores() {
		Map<String, Object> map = new HashMap<>();
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		return map;
	}
}