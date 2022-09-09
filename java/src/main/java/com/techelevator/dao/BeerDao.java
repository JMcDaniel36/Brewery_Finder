package com.techelevator.dao;


import java.util.List;

import com.techelevator.model.Beer;

public interface BeerDao {
	
	List<Beer> getBeerListByBrewery(String breweryId);
	
	List<Beer> getSingleBeerInfo(String beerId);
		
	void addABeer(Beer formData);
	
	void deleteABeer(String beerId);
}
