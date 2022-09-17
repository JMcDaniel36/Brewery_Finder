package com.techelevator.model;

import java.time.LocalDateTime;

public class Reviews {
	// Instance Variables
	private Long review_id;
	private String brewery_name;
	private String beer_name;
	private String description;
	private int rating;
	private Long user_id;


	public Reviews(Long review_id, String brewery_name, String beer_name, String description, int rating, Long user_id) {
		this.review_id = review_id;
		this.brewery_name = brewery_name;
		this.beer_name = beer_name;
		this.description = description;
		this.rating = rating;
		this.user_id = user_id;
	}

	public Reviews() {

	}

	/****************************************
	 * Getters and Setters
	 *
	 ***/



	public Long getReview_id() {
		return review_id;
	}

	public void setReview_id(Long review_id) {
		this.review_id = review_id;
	}

	public String getBrewery_name() {
		return brewery_name;
	}

	public void setBrewery_name(String brewery_name) {
		this.brewery_name = brewery_name;
	}

	public String getBeer_name() {
		return beer_name;
	}

	public void setBeer_name(String beer_name) {
		this.beer_name = beer_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
}