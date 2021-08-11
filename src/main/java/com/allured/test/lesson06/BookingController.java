package com.allured.test.lesson06;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.allured.test.lesson06.bo.BookingBO;
import com.allured.test.lesson06.model.Booking;

@RequestMapping("/lesson06/test03")
@Controller
public class BookingController {
	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/home")
	public String homeView() {
		return "lesson06/test03/test03_home";
	}
	
	@GetMapping("/list")
	public String listView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "lesson06/test03/test03_reserve_list";
	}
	
	@GetMapping("/reserve")
	public String reserveView() {
		return "lesson06/test03/test03_reserve_input";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> addBooking(Model model,
			@RequestParam("name") String name,
			@RequestParam("date") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		Map<String, String> result = new HashMap<>();
		
		result.put("result", "예약이 완료 되었습니다.");
		
		return result;
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteBooking(@RequestParam("id") int id) {
		bookingBO.deleteBooking(id);
		Map<String, String> result = new HashMap<>();
		
		result.put("message", "삭제 되었습니다.");
		
		return result;
	}
	
	@PostMapping("/lookUp")
	@ResponseBody
	public Map<String, Object> lookUpReserve(@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		Booking booking = bookingBO.getBooking(name, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formatDate = formatter.format(booking.getDate());
		
		result.put("name", booking.getName());
		result.put("date", formatDate);
		result.put("day", booking.getDay());
		result.put("headcount", booking.getHeadcount());
		result.put("state", booking.getState());
		result.put("phoneNumber", booking.getPhoneNumber());
		
		return result;
	}
}