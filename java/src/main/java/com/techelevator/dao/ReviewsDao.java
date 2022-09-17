package com.techelevator.dao;

import java.util.List;

import javax.validation.Valid;

import com.techelevator.model.Reviews;

public interface ReviewsDao {

	List<Reviews> getReviews(Long userId);
	
	void addReview(Reviews aReview);

	List <Reviews> getAverageStarsByUserId(String userId);

}