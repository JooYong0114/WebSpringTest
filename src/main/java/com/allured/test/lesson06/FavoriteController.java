package com.allured.test.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allured.test.lesson06.bo.FavoriteBO;
import com.allured.test.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class FavoriteController {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/test01/home")
	public String homeView(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/test01_home";
	}
	
	@GetMapping("/test01/input")
	public String inputView() {
		return "lesson06/test01_add";
	}
	
	@PostMapping("/test01/add")
	@ResponseBody
	public Map<String, String> addFavorite(@RequestParam("name") String name,
			@RequestParam("url") String url) {
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "입력 성공!");
		return result;
	}
	
	@GetMapping("/test02/home")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/test02_home";
	}
	
	@GetMapping("/test02/input")
	public String addFavorite() {
		return "lesson06/test02_add";
	}
	
	@PostMapping("/test02/add")
	@ResponseBody
	public Map<String, Boolean> checkDuplication(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(favoriteBO.existUrl(url)) {
			result.put("isDuplicate", true);
		}
		else {
			result.put("isDuplicate", false);
		}
		
		return result;
	}
	
	@GetMapping("/test02/delete")
	@ResponseBody
	public Map<String, Boolean> deleteUrl(
			@RequestParam("id") int id) {
		Map<String, Boolean> delete = new HashMap<>();
		
		if(favoriteBO.deleteFavorite(id)) {
			delete.put("delete", true);
		}
		else {
			delete.put("delete", false);
		}
		
		return delete;
	}
}