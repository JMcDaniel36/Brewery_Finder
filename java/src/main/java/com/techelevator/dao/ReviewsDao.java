package com.techelevator.dao;

import java.util.List;

import javax.validation.Valid;

import com.techelevator.model.Reviews;

public interface ReviewsDao {

	List<Reviews> getReviews(Long beer_id);
	
	void addReview(Reviews aReview);

	void saveReview(@Valid Reviews review);

	List<Reviews> searchReviewsByBeerId(long beerId);

}