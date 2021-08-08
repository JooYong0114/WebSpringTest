package com.allured.test.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.test.lesson05.dao.NewReviewDAO;
import com.allured.test.lesson05.model.NewReview;

@Service
public class NewReviewBO {
	@Autowired
	private NewReviewDAO newReviewDAO;
	
	public List<NewReview> getNewReviewList() {
		return newReviewDAO.selectNewReviewList();
	}
}
