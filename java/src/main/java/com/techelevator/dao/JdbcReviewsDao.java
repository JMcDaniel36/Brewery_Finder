package com.techelevator.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.dao.ReviewsDao;
import com.techelevator.model.Reviews;

@Component
public class JdbcReviewsDao implements ReviewsDao{
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcReviewsDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//GET REVIEWS BY ID
	@Override
	public List<Reviews> getReviews(Long beerId){
		 List<Reviews> reviews = new ArrayList<>();
		 String sqlGetReviewByBeerId = "SELECT * FROM reviews WHERE beer_id = ? ORDER BY create_date";
		 SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetReviewByBeerId, beerId);
		 
		 while(results.next()) {
			 Reviews aReview = mapRowToReview(results);
			 reviews.add(aReview);
		 }
		 return reviews;
	}
	
	//ADD A REVIEW
	
	@Override
	public void addReview(Reviews aReview) {
		String sqladdReview = "INSERT INTO reviews (description, rating, beer_id, username, name) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqladdReview, aReview.getDescription(), aReview.getRating(), aReview.getBeerId(),aReview.getUserId(), aReview.getName());
	}
	
	//SAVE REVIEW
	@Override
	public void saveReview(@Valid Reviews review) {
		String sqlSaveReview = "INSERT INTO reviews(description, rating, create_date, beer_id) VALUES(?,?,?,?)";
		jdbcTemplate.update(sqlSaveReview, review.getDescription(), review.getRating(), 
				review.getCreateTime(), review.getBeerId());
		
	}
	
	// GET REVIEWS BY BEER ID
	
	@Override
	public List<Reviews> searchReviewsByBeerId(long beerId) {
		List<Reviews> reviewList = new ArrayList<>();
		String sqlSearchReviewByBeerId = "SELECT * FROM reviews WHERE beer_id = ? ORDER BY create_date";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchReviewByBeerId, beerId);
		
		while(results.next()){
			reviewList.add(mapRowToReview(results));
		}
		
		
		return reviewList;
	}
	
	//MAP ROW TO REVIEW

	private Reviews mapRowToReview(SqlRowSet row) {
		Reviews review = new Reviews();
		
		review.setId(row.getLong("reviews_id"));
		review.setName(row.getString("name"));
		review.setDescription(row.getString("description"));
		review.setRating(row.getInt("rating"));
		review.setBeerId(row.getLong("beer_id"));
		review.setUserId(row.getLong("user_id"));
		return review;
	}

}