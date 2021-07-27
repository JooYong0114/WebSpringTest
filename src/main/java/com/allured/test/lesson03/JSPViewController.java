package com.allured.test.lesson03;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allured.test.lesson03.bo.RealEstateBO;

@Controller
public class JSPViewController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/insertHome")
	public String homeView() {
		return "lesson03/test02";
	}
	
	@ResponseBody
	@RequestMapping("/insertResult")
	public String resultView(
			@RequestParam("realtorId") int realtorId,
			@RequestParam("address") String address,
			@RequestParam("area") int area,
			@RequestParam("type") String type,
			@RequestParam("price") int price,
			@RequestParam("rentPrice") int rentPrice) {
		 
		int count = realEstateBO.addRealEstate(realtorId, address, area, type, price, rentPrice);
		return "입력 성공 : " + count;
	}
}