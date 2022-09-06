package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.BreweryInfo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Component
public class JdbcBreweryInfo implements BreweryInfoDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcBreweryInfo(DataSource aDataSource) {
        this.jdbcTemplate = new JdbcTemplate(aDataSource);
    } 

    @Override
    public void addBreweryInfo(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public List<BreweryInfo> getBreweryInfoById(String id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void updateBreweryHistory(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryHourClosed(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryHourOpen(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryImage(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenFri(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenMon(BreweryInfo fromData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenSat(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenSun(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenThu(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenTue(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBreweryOpenWed(BreweryInfo formData) {
        // TODO Auto-generated method stub
        
    }
    
    
}
