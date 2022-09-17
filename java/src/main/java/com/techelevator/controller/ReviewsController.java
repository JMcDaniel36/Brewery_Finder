package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.ReviewsDao;
import com.techelevator.model.Reviews;

@CrossOrigin
@RestController
public class ReviewsController {

    @Autowired
    ReviewsDao reviewsDao;

    @Autowired
    BeerDao beerDao;

    public ReviewsController(ReviewsDao reviewsDao){
        this.reviewsDao = reviewsDao;
    }

    @RequestMapping(path = "/reviews/id/{userId}", method = RequestMethod.GET)
    public List<Reviews> getReviews(@PathVariable Integer userId) {
        return reviewsDao.getReviews(userId);
    }

    @RequestMapping(path = "/reviews", method = RequestMethod.POST)
    public void addReview(@RequestBody Reviews aReview) {
        reviewsDao.addReview(aReview);
    }

    @RequestMapping(path = "/reviews/name/{beer_name}", method = RequestMethod.GET)
    public List<Reviews> getReviewsByBeerName(@PathVariable String beer_name) {
        return reviewsDao.getReviewsByBeerName(beer_name);
    }

}


