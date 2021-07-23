package com.allured.test.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.allured.test.lesson03.bo.RealEstateBO;
import com.allured.test.lesson03.model.RealEstate;

@RestController
@RequestMapping("/lesson03/test01")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public RealEstate test01_1(
			@RequestParam("id") int id) {
		return realEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/2")
	public List<RealEstate> test01_2(
			@RequestParam("rent") int rent) {
		return realEstateBO.getRealEstate2(rent);
	}
	
	@RequestMapping("/3")
	public List<RealEstate> test01_3(
			@RequestParam("area") int area,
			@RequestParam("price") int price) {
		return realEstateBO.getRealEstate3(area, price);
	}
	
	// 파라미터 여러게 일때 (실험)
	@RequestMapping("/4")
	public List<RealEstate> test01_4(
			@RequestParam("type") String type,
			@RequestParam("area") int area,
			@RequestParam("price") int price,
			@RequestParam("address") String address) {
		return realEstateBO.getRealEstate4(type, area, price, address);
	}
}