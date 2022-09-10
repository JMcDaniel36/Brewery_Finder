package com.techelevator.controller;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.BreweryInfoDao;
import com.techelevator.dao.ReviewsDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryInfo;
import com.techelevator.model.Reviews;

@RestController
@CrossOrigin

public class ApplicationController {

	private BreweryDao breweryDao;
	private BeerDao beerDao;
	private BreweryInfoDao breweryInfoDao;
	private ReviewsDao reviewsDao;


    public ApplicationController(BreweryDao breweryDao, BeerDao beerDao, BreweryInfoDao breweryInfoDao, ReviewsDao reviewsDao) {
        this.breweryDao = breweryDao;
        this.beerDao = beerDao;
        this.breweryInfoDao = breweryInfoDao;
        this.reviewsDao = reviewsDao;
    }

    @RequestMapping(path = "/breweryfinder/breweries/{breweryId}", method = RequestMethod.GET)
	public List<Brewery> getBreweryById(@PathVariable String breweryId) {
	    return breweryDao.getBreweryById(breweryId);
	}
	
}