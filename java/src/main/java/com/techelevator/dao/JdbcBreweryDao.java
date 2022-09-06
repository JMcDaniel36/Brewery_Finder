package com.techelevator.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;

@Component
public class JdbcBreweryDao implements BreweryDao{
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcBreweryDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

    @Override
    public void assignBrewer(Brewery formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void createNewBrewery(Brewery formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public List<Brewery> getBreweriesByCity(String city) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Brewery> getBreweriesByName(String name) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Brewery> getBreweriesByState(String state) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Brewery> getBreweriesByZipCode(String zipCode) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Brewery> getSingleBreweryInfo(String breweryId) {
        // TODO Auto-generated method stub
        return null;
    }
}
