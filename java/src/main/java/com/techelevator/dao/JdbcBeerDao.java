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
    public void addABeer(Beer formData) {
        String myNewBeer = "insert into beers (brewery_id, beer_name, brewery, description, image, abv, beer_type) values (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(myNewBeer, formData.getBrewery_Id(), formData.getName(), formData.getBrewery(),
         formData.getDescription(), formData.getImage(), formData.getAbv(), formData.getType());   
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
    public List<Beer> getBeerListByBrewery(String breweryId) {
        List<Beer> listBeers = new ArrayList();
		String sqlQuery = "select * from beers where brewery_id = ? order by beer_name asc";
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
