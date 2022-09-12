package com.techelevator.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;


@RestController
@CrossOrigin

public class BreweryController {

	private BreweryDao breweryDao;

    public BreweryController(BreweryDao breweryDao) {
        this.breweryDao = breweryDao;
    }

    @RequestMapping(path= "/breweries", method = RequestMethod.GET)
    public List<Brewery> getAllBreweries() {
        return breweryDao.getAllBreweries();
    }

    @RequestMapping(path = "/breweries", method = RequestMethod.POST)
    public void addNewBrewery(@RequestBody Brewery aBrewery) {
        breweryDao.addNewBrewery(aBrewery);
    }

    @RequestMapping(path = "/breweries/{breweryId}", method = RequestMethod.GET)
	public List<Brewery> getBreweryById(@PathVariable String breweryId) {
	    return breweryDao.getBreweryById(breweryId);
	}

    @RequestMapping(path = "/breweries", method = RequestMethod.PUT)
	public void updateBrewery(@RequestBody Brewery aBrewery) {
		breweryDao.updateBrewery(aBrewery);
	}

    @RequestMapping(path = "/breweries/{breweryId}", method = RequestMethod.DELETE)
	public void deleteBrewery(@PathVariable String breweryId) {
		breweryDao.deleteBrewery(breweryId);
	}

    @RequestMapping(path = "/users/{userId}/breweries", method = RequestMethod.GET)
	public List<Brewery> getBreweriesByUserId(@PathVariable Long userId) {
		return breweryDao.getBreweryByUserId(userId);
	}	
}