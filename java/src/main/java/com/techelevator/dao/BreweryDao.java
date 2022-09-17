package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Brewery;

public interface BreweryDao {
	

		List<Brewery> getAllBreweries();
	
		void addNewBrewery(Brewery aBrewery);

		List<Brewery> getBreweryById(Long breweryId);

		void updateBrewery(Brewery aBrewery);
	
		void deleteBrewery(String breweryId);

		List <Brewery> getUrlByBreweryId(String breweryId);


	
}
