package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.Brewery;

@Component
public class JdbcBreweryDao implements BreweryDao{
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcBreweryDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

    // CREATE A BREWERY
	@Override
	public void addNewBrewery(Brewery aBrewery) {
		String sqlAddBrewery = "INSERT INTO breweries (brewery_id, owner_id, brewery_name, address, city,"
				+ "state, website) VALUES (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddBrewery, aBrewery.getBreweryId(), aBrewery.getOwner_id(), aBrewery.getBreweryName(), aBrewery.getAddress(),
				aBrewery.getCity(), aBrewery.getState(), aBrewery.getWebsite());
	}



	// GET ALL BREWERIES
	
	@Override
	public List<Brewery> getAllBreweries(){
		List<Brewery> allBreweries = new ArrayList<>();
		String sqlGetAllBreweries = "SELECT * FROM breweries";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBreweries);
		
		while(results.next()) {
			Brewery aBrewery = mapRowToBrewery(results);
			allBreweries.add(aBrewery);
		}
		return allBreweries;
	}
	
// GET BREWERY BY ID
	@Override
	public List<Brewery> getBreweryById(Long breweryId) {
		List<Brewery> returnedBreweries = new ArrayList<>();
		String sqlGetABrewery = "SELECT * FROM breweries WHERE brewery_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetABrewery, breweryId);
		
		while(results.next()) {
			Brewery returnedBrewery = mapRowToBrewery(results);
			returnedBreweries.add(returnedBrewery);
		}
		
		return returnedBreweries;
	}
	
	
// UPDATE A BREWERY
	
	@Override
	public void updateBrewery(Brewery aBrewery) {
		String sqlUpdateBrewery = "UPDATE breweries SET brewery_name = ?, address = ?,"
				+ " city = ?, state = ?, website = ? WHERE brewery_id = ?";
		jdbcTemplate.update(sqlUpdateBrewery, aBrewery.getBreweryName(), aBrewery.getAddress(),
				aBrewery.getCity(), aBrewery.getState(), aBrewery.getBreweryId(), aBrewery.getWebsite());
	}
	
// DELETE A BREWERY
	
	
	  @Override 
	  public void deleteBrewery(String breweryId) {
		  String sqlDeleteBrewery = "DELETE FROM breweries WHERE brewery_id = ?";
		  jdbcTemplate.update(sqlDeleteBrewery, breweryId);
	  }


	  @Override
	  public List<Brewery> getUrlByBreweryId(String breweryId) {
		  List<Brewery> urlList = new ArrayList<>();
  
		  String sql = "SELECT brewery_id, website FROM breweries WHERE brewery_id = ?;";
  
		  SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
		  while(results.next()) {
			  Brewery url = mapRowToBrewery(results);
			  urlList.add(url);
		  }
		  return urlList;
	  }
	 
	
	// MAP ROW TO BREWERY
	
	private Brewery mapRowToBrewery(SqlRowSet row) {
	Brewery newBrewery = new Brewery();
	newBrewery.setBreweryId(row.getLong("brewery_id"));
	newBrewery.setOwner_id(row.getLong("owner_id"));
	newBrewery.setBreweryName(row.getString("brewery_name"));
	newBrewery.setAddress(row.getString("address"));
	newBrewery.setCity(row.getString("city"));
	newBrewery.setState(row.getString("state"));
	newBrewery.setWebsite(row.getString("website"));
	return newBrewery;
	}
}
