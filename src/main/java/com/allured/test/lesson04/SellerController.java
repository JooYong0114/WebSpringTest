package com.allured.test.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.allured.test.lesson04.bo.SellerBO;
import com.allured.test.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04")
public class SellerController {
	@Autowired
	private SellerBO sellerBO;
	
	@RequestMapping("/test01/1")
	public String inputView() {
		return "lesson04/add_seller";
	}
	
	@RequestMapping("/test01/add_seller")
	public String actionView(
			@RequestParam("nickname") String nickname
			, @RequestParam(value="profileImageUrl", required=false) String profileImageUrl
			, @RequestParam("temperature") double temperature) {
		int count = sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/input_success";
	}
	
	@RequestMapping("/test01/seller_info")
	public String sellerView(Model model,
			@RequestParam(value="id", required=false) Integer id) {
	//	Seller seller = sellerBO.getLastSeller();
		Seller sellerById = sellerBO.getSeller(id);
		
		model.addAttribute("subject", "판매자 정보");
	//  model.addAttribute("seller", seller);
		model.addAttribute("seller", sellerById);
		
		return "lesson04/seller_info";
	}
}