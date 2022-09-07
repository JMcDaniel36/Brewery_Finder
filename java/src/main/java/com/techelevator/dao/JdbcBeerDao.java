package com.techelevator.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.sql.DataSource;
import com.techelevator.model.Beer;

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
        // TODO Auto-generated method stub
        return null;
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
    
}
