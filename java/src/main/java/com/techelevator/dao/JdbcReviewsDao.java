package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.validation.Valid;

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
	public List<Reviews> getReviews(String beerId){
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
		String sqlQuery = "INSERT INTO reviews (description, rating, beer_id, username, name) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlQuery, aReview.getDescription(), aReview.getRating(), aReview.getBeerId(),aReview.getUserId(), aReview.getName());
	}
	
	public List<Reviews> getAverageStarsById(String beerId) {
		List<Reviews> returnedDetails = new ArrayList();
		String sqlQuery = "select review_id as review_id, beer_id as beer_id, (select cast(count(star_rating) as varchar) as review_text from reviews where beer_id = ?), (select cast(avg(star_rating) as int) as star_rating from reviews where beer_id = ?), username as username from reviews where beer_id = ?";
		SqlRowSet theRowSet = jdbcTemplate.queryForRowSet(sqlQuery, beerId, beerId, beerId);
		while(theRowSet.next()) {
			Reviews returnedDetail = mapRowToReview(theRowSet);
			returnedDetails.add(returnedDetail);
		}
		return returnedDetails;
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