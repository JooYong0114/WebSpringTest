package com.allured.test.lesson05;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.allured.test.lesson05.bo.WeatherHistoryBO;
import com.allured.test.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05/test05")
@Controller
public class WeatherHistoryController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/home")
	public String homeView(Model model) {
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("weatherHistory", weatherHistoryList);
		return "lesson05/test05_home";
	}
	
	@GetMapping("/input")
	public String inputView(Model model) {
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistory();
		
		// select box option 중복된 값 없애기 위해 Set으로 세팅
		// 날씨 선택창 => 비, 흐림, 구름조금, 맑음
		// 미세먼지 선택창 => 최악, 보통, 나쁨, 좋음
		Set<String> weather = new HashSet<>();
		Set<String> microDust = new HashSet<>();
		
		for(WeatherHistory element : weatherHistoryList) {
			weather.add(element.getWeather());
			microDust.add(element.getMicroDust());
		}
		
		model.addAttribute("weather", weather);
		model.addAttribute("microDust", microDust);
		return "lesson05/test05_input";
	}
	
	@PostMapping("/add")
	public String addInfo(@ModelAttribute WeatherHistory weatherHistory) {
		weatherHistoryBO.addWeatherHistory(weatherHistory);
		return "redirect:/lesson05/test05/home";
	}
}