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
		String sqlAddBrewery = "INSERT INTO breweries (name, address, city,"
				+ "zipcode, phone_number, description, brewery_logo_url, website_url,"
				+ "user_id, hours, lat, lng) VALUES (?, ?, ?, ?, ?, ?, ?, ?,"
				+ "?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddBrewery, aBrewery.getName(), aBrewery.getAddress(),
				aBrewery.getCity(), aBrewery.getZipcode(), aBrewery.getPhone(), aBrewery.getWebsiteUrl(),
				aBrewery.getUser_Id(), aBrewery.getHours());
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
		String sqlUpdateBrewery = "UPDATE breweries SET name = ?, address = ?,"
				+ " city = ?, zipcode = ?, phone_number = ?, description = ?, "
				+ "brewery_logo_url = ?, user_id = ?, hours = ?, lat = ?, lng = ?"
				+ "WHERE brewery_id = ?";
		jdbcTemplate.update(sqlUpdateBrewery, aBrewery.getName(), aBrewery.getAddress(),
				aBrewery.getCity(), aBrewery.getZipcode(), aBrewery.getPhone(), aBrewery.getUser_Id(),
				aBrewery.getHours(), aBrewery.getBreweryId());
	}
	
// DELETE A BREWERY
	
	
	  @Override 
	  public void deleteBrewery(String breweryId) {
		  String sqlDeleteBrewery = "DELETE FROM breweries WHERE brewery_id = ?";
		  jdbcTemplate.update(sqlDeleteBrewery, breweryId);
	  }
	 
	  
// GET BREWERY BY USERID
	  @Override
	  public List<Brewery> getBreweryByUserID(Long userId) {
		  List<Brewery> allBreweriesByUserId = new ArrayList<>();
			String sqlGetAllBreweriesByUserId = "SELECT * FROM breweries WHERE user_id = ?";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBreweriesByUserId, userId);
			
			while(results.next()) {
				Brewery aBrewery = mapRowToBrewery(results);
				allBreweriesByUserId.add(aBrewery);
			}
			return allBreweriesByUserId;
	  }
	 
	
	// MAP ROW TO BREWERY
	
	private Brewery mapRowToBrewery(SqlRowSet row) {
	Brewery newBrewery = new Brewery();
	newBrewery.setBreweryId(row.getLong("brewery_id"));
	newBrewery.setName(row.getString("name"));
	newBrewery.setAddress(row.getString("address"));
	newBrewery.setCity(row.getString("city"));
	newBrewery.setZipcode(row.getString("zipcode"));
	newBrewery.setPhone(row.getString("phone_number"));
	newBrewery.setWebsiteUrl(row.getString("website_url"));
	newBrewery.setUser_Id(row.getInt("user_id"));
	return newBrewery;
	}
}
