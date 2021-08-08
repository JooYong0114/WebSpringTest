package com.allured.test.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.allured.test.lesson05.model.NewReview;

@Repository
public interface NewReviewDAO {
	public List<NewReview> selectNewReviewList();
}