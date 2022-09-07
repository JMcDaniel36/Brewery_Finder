package com.techelevator.dao;

import java.util.List;

import javax.sql.DataSource;
import com.techelevator.dao.ReviewsDao;
import com.techelevator.model.Reviews;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcReviewsDao implements ReviewsDao {

	private JdbcTemplate jdbcTemplate;
	
	public JdbcReviewsDao(DataSource aDataSource) {
        this.jdbcTemplate = new JdbcTemplate(aDataSource);
    }

    @Override
    public void addReview(Reviews newReview) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void deleteReview(int reviewId) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public List<Reviews> getAverageStarsById(int obdbId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Reviews> getReviewsByBeerId(int id) {
        // TODO Auto-generated method stub
        return null;
    } 
}