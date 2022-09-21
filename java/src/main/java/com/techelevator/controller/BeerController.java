package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.ReviewsDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;

@RestController
@CrossOrigin
public class BeerController {
 
    @Autowired
    private BeerDao beerDAO;
    @Autowired
    private BreweryDao breweryDAO;
    @Autowired
    private ReviewsDao reviewDAO;


    /************** Controller****************/

    public BeerController(BeerDao beerDAO) {
        this.beerDAO = beerDAO;
    }

	@PreAuthorize("permitAll")
	@RequestMapping(path="/beers", method=RequestMethod.GET)
	public List<Beer> showAllBeers() {
		List<Beer> beerList = beerDAO.getAllBeers();

		return beerList;
	}

    @PreAuthorize("permitAll")
	@RequestMapping(path="/breweries/{breweryId}/beers", method = RequestMethod.GET)
	public List<Beer> getBeerByBreweryId(@PathVariable String breweryId) {
		return beerDAO.getBeerByBreweryId(Long.valueOf(breweryId));
	}


    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beers/{beerId}", method = RequestMethod.GET)
	public List<Beer> getSingleBeerInfo(@PathVariable String beerId) {
	    return beerDAO.getSingleBeerInfo(beerId);
	}

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beers/addBeer", method = RequestMethod.POST)
	public void addABeer(@RequestBody Beer aBeer) {
	    beerDAO.addABeer(aBeer);
	}

    @RequestMapping(path = "/beers/{beerId}", method = RequestMethod.DELETE)
	public void deleteABeer(@PathVariable String beerId) {
		beerDAO.deleteABeer(beerId);
	}
	

}
