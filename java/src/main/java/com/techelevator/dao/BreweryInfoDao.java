package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.BreweryInfo;

public interface BreweryInfoDao {
	
	List<BreweryInfo> getBreweryInfoById(String id);
	
	void addBreweryInfo(BreweryInfo formData);
	
	void updateBreweryImage(BreweryInfo formData);

	void updateBreweryHourOpen(BreweryInfo formData);

	void updateBreweryHourClosed(BreweryInfo formData);

	void updateBreweryOpenSun(BreweryInfo formData);

	void updateBreweryOpenMon(BreweryInfo fromData);

	void updateBreweryOpenTue(BreweryInfo formData);

	void updateBreweryOpenWed(BreweryInfo formData);

	void updateBreweryOpenThu(BreweryInfo formData);

	void updateBreweryOpenFri(BreweryInfo formData);

	void updateBreweryOpenSat(BreweryInfo formData);
}