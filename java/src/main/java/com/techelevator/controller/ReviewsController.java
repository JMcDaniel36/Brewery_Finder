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

    @RequestMapping(path = "/reviews/{beerId}", method = RequestMethod.GET) 
    public List<Reviews> getReviews(@PathVariable String beerId) {
        return reviewsDao.getReviews(beerId);
    }

    @RequestMapping(path = "/reviews", method = RequestMethod.POST)
    public void addReview(@RequestBody Reviews aReview) {
        reviewsDao.addReview(aReview);
    }

    @RequestMapping(path = "/reviews/{breweryId}/averageStars", method = RequestMethod.GET)
    public List<Reviews> getAverageStarsById(@PathVariable String beerId){
        return reviewsDao.getAverageStarsById(beerId);
    }

}


