package com.allured.test.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.test.lesson05.dao.WeatherHistoryDAO;
import com.allured.test.lesson05.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public List<WeatherHistory> getWeatherHistory() {
		return weatherHistoryDAO.selectWeatherHistory();
	}
	
	public int addWeatherHistory(WeatherHistory weatherHistory) {
		return weatherHistoryDAO.insertWeatherHistory(weatherHistory);
	}
}
