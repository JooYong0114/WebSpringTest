package com.allured.test.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.allured.test.lesson03.bo.RealEstateBO;
import com.allured.test.lesson03.model.RealEstate;

@RestController
@RequestMapping("/lesson03")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/test01/1")
	public RealEstate test01_1(
			@RequestParam("id") int id) {
		return realEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/test01/2")
	public List<RealEstate> test01_2(
			@RequestParam("rent") int rent) {
		return realEstateBO.getRealEstate2(rent);
	}
	
	@RequestMapping("/test01/3")
	public List<RealEstate> test01_3(
			@RequestParam("area") int area,
			@RequestParam("price") int price) {
		return realEstateBO.getRealEstate3(area, price);
	}
	
	@RequestMapping("/test02/1")
	public String test02_1() {
		RealEstate realEstate = new RealEstate();
		
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateBO.addRealEstate(realEstate);
		
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/test02/2")
	public String test02_2(
			@RequestParam("realtorId") int realtorId) {
		int count = realEstateBO.addRealEstate(realtorId ,"샹떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/test03")
	public String test03() {
		RealEstate realEstate = new RealEstate();
		realEstate.setType("전세");
		realEstate.setPrice(70000);
		realEstate.setId(5);
		int count = realEstateBO.updateRealEstateById(realEstate);
		return "수정 성공 : " + count;
	}
	
	@RequestMapping("/test04")
	public String test04(
			@RequestParam("id") int id) {
		int count = realEstateBO.deleteRealEstateById(id);
		return "삭제 성공 : " + count;
	}
}