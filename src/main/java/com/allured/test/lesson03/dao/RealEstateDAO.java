package com.allured.test.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.allured.test.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public RealEstate selectRealEstate(@Param("id") int id);
	public List<RealEstate> selectRealEstate2(@Param("rent") int rent);
	public List<RealEstate> selectRealEstate3(@Param("area") int area, @Param("price") int price);
	// 파라미터 여러게 일때 (실험)
	public List<RealEstate> selectRealEstate4(@Param("type") String type, @Param("area") int area, @Param("price") int price, @Param("address") String address);
}