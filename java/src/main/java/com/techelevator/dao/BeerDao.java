package com.techelevator.dao;


import java.util.List;

import com.techelevator.model.Beer;

public interface BeerDao {
	
	List <Beer> getAllBeers();
	
	List <Beer> getBeerByBreweryId(Long breweryId);
	
	List <Beer> getSingleBeerInfo(String beerId);
		
	void addABeer(Beer aBeer);
	
	void deleteABeer(String beerId);
}
