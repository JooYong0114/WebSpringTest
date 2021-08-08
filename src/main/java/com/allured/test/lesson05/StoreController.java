package com.allured.test.lesson05;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.allured.test.lesson02.bo.StoreBO;
import com.allured.test.lesson02.model.Store;
import com.allured.test.lesson05.bo.NewReviewBO;
import com.allured.test.lesson05.model.NewReview;

@RequestMapping("lesson05/test06")
@Controller
public class StoreController {
	@Autowired 
	private StoreBO storeBO;
	@Autowired
	private NewReviewBO newReviewBO;		
	
	@GetMapping("/home")
	public String home(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "lesson05/test06_home";
	}
	
	@GetMapping("/reviews")
	public String review(Model model,
			@RequestParam("storeId") int storeId,
			@RequestParam("storeName") String storeName
			) {
		model.addAttribute("storeId", storeId);
		model.addAttribute("storeName", storeName);
		
		List<Store> storeList = storeBO.getStoreList();
		List<NewReview> reviewList = newReviewBO.getNewReviewList();
		model.addAttribute("storeList", storeList);
		model.addAttribute("reviewList", reviewList);
		
		// 중복을 제거한 모든 storeId 값을 저장할 Set
		Set<Integer> storeIdSet = new HashSet<>();
		
		for(NewReview review : reviewList) {
			storeIdSet.add(review.getStoreId());
		}
		
		// Set은 바로 참조하기 힘들어서 List로 변환
		List<Integer> storeIdList = new ArrayList<>(storeIdSet);
		model.addAttribute("storeIdList", storeIdList);
		
		return "lesson05/test06_review";
	}
}