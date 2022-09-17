package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
//import javax.validation.Valid;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.Reviews;

@Component
public class JdbcReviewsDao implements ReviewsDao{
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcReviewsDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//GET REVIEWS BY ID
	@Override
	public List<Reviews> getReviews(Integer userId){
		 List<Reviews> reviews = new ArrayList<>();
		 String sqlGetReviewByUserId = "SELECT * FROM reviews WHERE user_id = ?";
		 SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetReviewByUserId, userId);
		 
		 while(results.next()) {
			 Reviews aReview = mapRowToReview(results);
			 reviews.add(aReview);
		 }
		 return reviews;
	}
	
	//ADD A REVIEW
	
	@Override
	public void addReview(Reviews aReview) {
		String sqlQuery = "INSERT INTO reviews (description, rating, beer_name, brewery_name, user_id, review_id) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sqlQuery, aReview.getDescription(), aReview.getRating(), aReview.getBeer_name(),
				aReview.getBrewery_name(), aReview.getUser_id(), aReview.getReview_id());
	}

	public List<Reviews> getReviewsByBeerName(String beer_name) {
		List<Reviews> returnedDetails = new ArrayList();
		String sqlQuery = "select * from reviews where beer_name = ?";
		SqlRowSet theRowSet = jdbcTemplate.queryForRowSet(sqlQuery, beer_name);
		while(theRowSet.next()) {
			Reviews returnedDetail = mapRowToReview(theRowSet);
			returnedDetails.add(returnedDetail);
		}
		return returnedDetails;
	}
	
	
	//MAP ROW TO REVIEW

	private Reviews mapRowToReview(SqlRowSet row) {
		Reviews review = new Reviews();
		
		review.setReview_id(row.getLong("review_id"));
		review.setBrewery_name(row.getString("brewery_name"));
		review.setBeer_name(row.getString("beer_name"));
		review.setDescription(row.getString("description"));
		review.setRating(row.getInt("rating"));
		review.setUser_id(row.getLong("user_id"));
		return review;

	}
}