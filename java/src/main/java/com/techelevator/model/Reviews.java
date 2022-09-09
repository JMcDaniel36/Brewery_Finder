package com.techelevator.model;

import java.time.LocalDateTime;

public class Reviews {
	// Instance Variables
	private Long id;
	private String description;
	private int rating;
	private LocalDateTime createTime;
	private Long beer_Id;
	private Long username;
	private String name;
	

	/****************************************
	 * Getters and Setters
	 *
	 ***/
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
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
	public LocalDateTime getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}
	public long getBeerId() {
		return beer_Id;
	}
	
	public void setBeerId(Long beerId) {
		this.beer_Id = beerId;
	}
	
	public long getUserId() {
		return this.username;
	}
	
	public void setUserId(Long userId) {
		this.username = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}