package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Brewery;

public interface BreweryDao {
	

		List<Brewery> getAllBreweries();
	
		void addNewBrewery(Brewery aBrewery);
	
		Brewery getBreweryById(Long breweryId);
	
		void updateBrewery(Brewery aBrewery);
	
		void deleteBrewery(Long breweryId);
	
		List<Brewery> getBreweryByUserID(Long userId);
	
}
