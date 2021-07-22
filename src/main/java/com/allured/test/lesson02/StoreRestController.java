package com.allured.test.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.allured.test.lesson02.bo.StoreBO;
import com.allured.test.lesson02.model.Store;

@RestController
public class StoreRestController {
	
	@Autowired
	private StoreBO storeBO;
	@RequestMapping("/lesson02/test01")
	public List<Store> test01() {
		return storeBO.getStoreList();
	}
}
