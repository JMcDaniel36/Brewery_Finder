package com.techelevator.dao;

import java.util.List;

//import javax.validation.Valid;

import com.techelevator.model.Reviews;

public interface ReviewsDao {

	List<Reviews> getReviews(Integer userId);

	List<Reviews> getReviewsByBeerName(String beer_name);
	
	void addReview(Reviews aReview);

}