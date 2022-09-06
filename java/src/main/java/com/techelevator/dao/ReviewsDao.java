package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Reviews;

public interface ReviewsDao {

	
	List<Reviews> getReviewsByBeerId(int id);
	
	List<Reviews> getAverageStarsById(int obdbId);
	
	void addReview(Reviews newReview);
	
	void deleteReview(int reviewId);
	
}