package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.sql.DataSource;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;;

public class JdbcBeerDao implements BeerDao {

    private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public JdbcBeerDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

    @Override
    public void addABeer(Beer formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void deleteABeer(String beerId) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public List<Beer> getBeerListByBrewery(String breweryId) {
        List<Beer> returnedBeers = new ArrayList();
		String sqlQuery = "select * from beers where brewery_id = ? order by beer_name asc";
		SqlRowSet theRowSet = jdbcTemplate.queryForRowSet(sqlQuery, breweryId);
		while(theRowSet.next()) {
			Beer returnedBeer = mapRowToBeer(theRowSet);
			returnedBeers.add(returnedBeer);
		}
		return returnedBeers;
    }

    @Override
    public List<Beer> getSingleBeerInfo(String beerId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void updateBeerStatus(Beer formData) {
        // TODO Auto-generated method stub
        
    }

    private Beer mapRowToBeer(SqlRowSet rs) {
    	Beer beer = new Beer();
		beer.setBeer_Id(rs.getString("beer_id"));
		beer.setBrewery_Id(rs.getString("brewery_id"));
		beer.setName(rs.getString("beer_name"));
		beer.setBrewery(rs.getString("brewery"));
		beer.setDescription(rs.getString("description"));
		beer.setImage(rs.getString("image"));
		beer.setAbv(rs.getString("abv"));
		beer.setType(rs.getString("beer_type"));
        return beer;

    }
    
}
