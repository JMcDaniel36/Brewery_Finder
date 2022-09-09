package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.model.BreweryInfo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
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
        String myNewInfo = "insert into userbrewerydetails (brewery_id, image_url, hour_open, hour_closed, open_sun, open_mon, open_tue, open_wed, open_thu, open_fri, open_sat) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(myNewInfo, formData.getBrewery_Id(), formData.getImage_url(), formData.getHour_open(), formData.getHour_closed(), formData.getOpen_sun(), formData.getOpen_mon(), formData.getOpen_tue(), formData.getOpen_wed(), formData.getOpen_thu(), formData.getOpen_fri(), formData.getOpen_sat());   
    }

    @Override
    public List<BreweryInfo> getBreweryInfoById(String id) {
        List<BreweryInfo> returnedDetails = new ArrayList();
		String sqlQuery = "select * from userbrewerydetails where brewery_id = ?";
		SqlRowSet theRowSet = jdbcTemplate.queryForRowSet(sqlQuery, id);
		while(theRowSet.next()) {
			BreweryInfo returnedInfo = mapRowToBreweryInfo(theRowSet);
			returnedDetails.add(returnedInfo);
		}
		return returnedDetails;
    }

    @Override
    public void updateBreweryHourClosed(BreweryInfo formData) {
        String myNewInfo = "update userbrewerydetails set hour_open = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getHour_open(), formData.getBrewery_Id());
        
    }

    @Override
    public void updateBreweryHourOpen(BreweryInfo formData) {
        String myNewInfo = "update userbrewerydetails set hour_closed = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getHour_closed(), formData.getBrewery_Id());
        
    }

    @Override
    public void updateBreweryImage(BreweryInfo formData) {
        String myNewInfo = "update userbrewerydetails set image_url = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getImage_url(), formData.getBrewery_Id());
    }

    @Override
	public void updateBreweryOpenSun(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_sun = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_sun(), formData.getBrewery_Id());
	}
	
	@Override
	public void updateBreweryOpenMon(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_mon = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_mon(), formData.getBrewery_Id());
	}

	@Override
	public void updateBreweryOpenTue(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_tue = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_tue(), formData.getBrewery_Id());
	}

	@Override
	public void updateBreweryOpenWed(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_wed = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_wed(), formData.getBrewery_Id());
	}
	@Override
	public void updateBreweryOpenThu(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_thu = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_thu(), formData.getBrewery_Id());
	}
	
	@Override
	public void updateBreweryOpenFri(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_fri = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_fri(), formData.getBrewery_Id());

    }
	@Override
	public void updateBreweryOpenSat(BreweryInfo formData) {
		String myNewInfo = "update userbrewerydetails set open_sat = ? where brewery_id = ?";
		jdbcTemplate.update(myNewInfo, formData.getOpen_sat(), formData.getBrewery_Id());
	}
    
    private BreweryInfo mapRowToBreweryInfo(SqlRowSet rs) {
       
    	BreweryInfo info = new BreweryInfo();
    	info.setBrewery_Id(rs.getString("brewery_id"));
    	info.setImage_url(rs.getString("image_url"));
    	info.setHour_open(rs.getString("hour_open"));
    	info.setHour_closed(rs.getString("hour_closed"));
    	info.setOpen_sun(rs.getBoolean("open_sun"));
    	info.setOpen_mon(rs.getBoolean("open_mon"));
    	info.setOpen_tue(rs.getBoolean("open_tue"));
    	info.setOpen_wed(rs.getBoolean("open_wed"));
    	info.setOpen_thu(rs.getBoolean("open_thu"));
    	info.setOpen_fri(rs.getBoolean("open_fri"));
    	info.setOpen_sat(rs.getBoolean("open_sat"));
        return info;
    }
}
