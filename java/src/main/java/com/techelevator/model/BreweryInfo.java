package com.techelevator.model;

public class BreweryInfo {
	private String brewery_Id;
	private String image_url;
	private String hour_open;
	private String hour_closed;
	private Boolean open_sun;
	private Boolean open_mon;
	private Boolean open_tue;
	private Boolean open_wed;
	private Boolean open_thu;
    private Boolean open_fri;
	private Boolean open_sat;

	
	public BreweryInfo(String brewery_Id,String image_url, String hour_open, String hour_closed,
            Boolean open_sun, Boolean open_mon, Boolean open_tue, Boolean open_wed, Boolean open_thu, Boolean open_fri,
            Boolean open_sat) {
        this.brewery_Id = brewery_Id;
        this.image_url = image_url;
        this.hour_open = hour_open;
        this.hour_closed = hour_closed;
        this.open_sun = open_sun;
        this.open_mon = open_mon;
        this.open_tue = open_tue;
        this.open_wed = open_wed;
        this.open_thu = open_thu;
        this.open_fri = open_fri;
        this.open_sat = open_sat;
    }


    public BreweryInfo() {
	}
    
	public String getBrewery_Id() {
        return brewery_Id;
    }


    public void setBrewery_Id(String brewery_Id) {
        this.brewery_Id = brewery_Id;
    }

    public String getImage_url() {
        return image_url;
    }


    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }


    public String getHour_open() {
        return hour_open;
    }


    public void setHour_open(String hour_open) {
        this.hour_open = hour_open;
    }


    public String getHour_closed() {
        return hour_closed;
    }


    public void setHour_closed(String hour_closed) {
        this.hour_closed = hour_closed;
    }


    public Boolean getOpen_sun() {
        return open_sun;
    }


    public void setOpen_sun(Boolean open_sun) {
        this.open_sun = open_sun;
    }


    public Boolean getOpen_mon() {
        return open_mon;
    }


    public void setOpen_mon(Boolean open_mon) {
        this.open_mon = open_mon;
    }


    public Boolean getOpen_tue() {
        return open_tue;
    }


    public void setOpen_tue(Boolean open_tue) {
        this.open_tue = open_tue;
    }


    public Boolean getOpen_wed() {
        return open_wed;
    }


    public void setOpen_wed(Boolean open_wed) {
        this.open_wed = open_wed;
    }


    public Boolean getOpen_thu() {
        return open_thu;
    }


    public void setOpen_thu(Boolean open_thu) {
        this.open_thu = open_thu;
    }


    public Boolean getOpen_fri() {
        return open_fri;
    }


    public void setOpen_fri(Boolean open_fri) {
        this.open_fri = open_fri;
    }


    public Boolean getOpen_sat() {
        return open_sat;
    }


    public void setOpen_sat(Boolean open_sat) {
        this.open_sat = open_sat;
    }


}