package com.allured.test.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.test.lesson03.dao.RealEstateDAO;
import com.allured.test.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstate2(int rent) {
		return realEstateDAO.selectRealEstate2(rent);
	}
	
	public List<RealEstate> getRealEstate3(int area, int price) {
		return realEstateDAO.selectRealEstate3(area, price);
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	public int addRealEstate(int realtorId,
			String address,
			int area,
			String type,
			int price,
			int rentPrice) {
		return realEstateDAO.insertRealEstateFromField(realtorId, address, area, type, price, rentPrice);
	}
}