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
				+ "state, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddBrewery, aBrewery.getBreweryId(), aBrewery.getOwner_id(), aBrewery.getBreweryName(), aBrewery.getAddress(),
				aBrewery.getCity(), aBrewery.getState(), aBrewery.getUser_Id());
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
	public List<Brewery> getBreweryById(String breweryId) {
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
				+ " city = ?, state = ?, user_id = ?, WHERE brewery_id = ?";
		jdbcTemplate.update(sqlUpdateBrewery, aBrewery.getBreweryName(), aBrewery.getAddress(),
				aBrewery.getCity(), aBrewery.getState(), aBrewery.getUser_Id(), aBrewery.getBreweryId());
	}
	
// DELETE A BREWERY
	
	
	  @Override 
	  public void deleteBrewery(String breweryId) {
		  String sqlDeleteBrewery = "DELETE FROM breweries WHERE brewery_id = ?";
		  jdbcTemplate.update(sqlDeleteBrewery, breweryId);
	  }
	 
	  
// GET BREWERY BY USERID
	  @Override
	  public List<Brewery> getBreweryByUserId(Long userId) {
		  List<Brewery> allBreweriesByUserId = new ArrayList<>();
			String sqlGetAllBreweriesByUserId = "SELECT * FROM breweries WHERE user_id = ?";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBreweriesByUserId, userId);
			
			while(results.next()) {
				Brewery aBrewery = mapRowToBrewery(results);
				allBreweriesByUserId.add(aBrewery);
			}
			return allBreweriesByUserId;
	  }

	  @Override
	  public List<Brewery> getImagesByBreweryId(String breweryId) {
		  List<Brewery> imageList = new ArrayList<>();
  
		  String sql = "SELECT brewery_id, img_url FROM img_url WHERE brewery_id = ?;";
  
		  SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
		  while(results.next()) {
			  Brewery image = mapRowToBrewery(results);
			  imageList.add(image);
		  }
		  return imageList;
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
	newBrewery.setUser_Id(row.getInt("user_id"));
	newBrewery.setImagePath(row.getString("img_url"));
	return newBrewery;
	}
}
