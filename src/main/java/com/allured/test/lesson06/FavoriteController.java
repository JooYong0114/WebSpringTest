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

@RequestMapping("/lesson06/test01")
@Controller
public class FavoriteController {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/home")
	public String homeView(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/test01_home";
	}
	
	@GetMapping("/input")
	public String inputView() {
		return "lesson06/test01_add";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> addFavorite(@RequestParam("name") String name,
			@RequestParam("url") String url) {
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "입력 성공!");
		return result;
	}
}