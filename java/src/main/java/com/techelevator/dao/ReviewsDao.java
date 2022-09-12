package com.techelevator.dao;

import java.util.List;

import javax.validation.Valid;

import com.techelevator.model.Reviews;

public interface ReviewsDao {

	List<Reviews> getReviews(String beerId);
	
	void addReview(Reviews aReview);

	List <Reviews> getAverageStarsById(String beerId);

}