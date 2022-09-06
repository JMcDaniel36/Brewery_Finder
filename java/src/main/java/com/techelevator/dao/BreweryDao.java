package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Brewery;

public interface BreweryDao {
	
	
	List<Brewery> getBreweriesByName(String name);
		
	List<Brewery> getBreweriesByCity(String city);
	
	List<Brewery> getBreweriesByState(String state);

    List<Brewery> getBreweriesByZipCode(String zipCode);
	
	List<Brewery> getSingleBreweryInfo(String breweryId);
	
	void createNewBrewery(Brewery formData);
	
	void assignBrewer(Brewery formData);
}