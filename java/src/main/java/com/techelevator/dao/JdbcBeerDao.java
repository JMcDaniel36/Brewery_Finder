package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import com.techelevator.model.Beer;

@Component
public class JdbcBeerDao implements BeerDao {

    private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public JdbcBeerDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Beer> getAllBeers() {
		List<Beer> allBeers = new ArrayList<>();
		String sqlSelectAllBeers = "SELECT * FROM beers";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBeers);
		
		while(results.next()) {
			Beer aBeer = mapRowToBeer(results);
			allBeers.add(aBeer);
		}
		return allBeers;
	}

	@Override
	public void addABeer(Beer aBeer) {
		String newBeer = "insert into beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) values (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(newBeer, aBeer.getBeer_Id(), aBeer.getBeer_name(), aBeer.getBrewery_name(), aBeer.getStyle(),
		aBeer.getAbv(), aBeer.getDescription(), aBeer.getBrewery_Id(), aBeer.getImg_url());
	}

    @Override
    public void deleteABeer(String beerId) {
        Integer convertedId = Integer.parseInt(beerId);
		String deleteReview = "delete from reviews where beer_id = ?";
		String deleteBeer = "delete from beers where beer_id = ?";
		jdbcTemplate.update(deleteReview, convertedId);
		jdbcTemplate.update(deleteBeer, convertedId);  
    }

    @Override
    public List<Beer> getBeerByBreweryId(Long breweryId) {
        List<Beer> listBeers = new ArrayList();
		String sqlQuery = "SELECT * from beers WHERE brewery_id = ?";
		SqlRowSet theRowSet = jdbcTemplate.queryForRowSet(sqlQuery, breweryId);
		while(theRowSet.next()) {
			Beer returnedBeer = mapRowToBeer(theRowSet);
			listBeers.add(returnedBeer);
		}
		return listBeers;
    }

    @Override
	public List<Beer> getSingleBeerInfo(String beerId) {
		Integer convertedId = Integer.parseInt(beerId);
		List<Beer> returnedBeer = new ArrayList();
		String sqlQuery = "select * from beers where beer_id = ?";
		SqlRowSet theRowSet = jdbcTemplate.queryForRowSet(sqlQuery, convertedId);
		while(theRowSet.next()) {
			Beer oneReturnedBeer = mapRowToBeer(theRowSet);
			returnedBeer.add(oneReturnedBeer);
		}
		return returnedBeer;
	}

    private Beer mapRowToBeer(SqlRowSet rs) {
    	Beer beer = new Beer();
		beer.setBeer_Id(rs.getString("beer_id"));
		beer.setDescription(rs.getString("description"));
		beer.setBrewery_Id(rs.getString("brewery_id"));
		beer.setBeer_name(rs.getString("beer_name"));
		beer.setBrewery_name(rs.getString("brewery_name"));
		beer.setImg_url(rs.getString("img_url"));
		beer.setAbv(rs.getString("abv"));
		beer.setStyle(rs.getString("style"));
        return beer;

    }
    
}
