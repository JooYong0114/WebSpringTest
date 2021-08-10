package com.allured.test.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.test.lesson06.dao.FavoriteDAO;
import com.allured.test.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavoriteList();
	}
	
	public int addFavorite(String name, String url) {
		return favoriteDAO.insertFavorite(name, url);
	}
	
	public boolean existUrl(String url) {
		if(favoriteDAO.selectCountUrl(url) == 0) {
			return false;
		}
		else {
			return true;
		}
	}
	
	public boolean deleteFavorite(int id) {
		if(favoriteDAO.deleteFavorite(id) > 0) {
			return false;
		}
		else {
			return true;
		}
	}
}