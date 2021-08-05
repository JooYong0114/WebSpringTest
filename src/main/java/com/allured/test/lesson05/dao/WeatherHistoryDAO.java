package com.allured.test.lesson05.dao;

import java.util.List;

import com.allured.test.lesson05.model.WeatherHistory;

public interface WeatherHistoryDAO {

	public List<WeatherHistory> selectWeatherHistory();
	
	public int insertWeatherHistory(WeatherHistory weatherHistory);
	
}