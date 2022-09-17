package com.techelevator.model;

public class Brewery {
    private Long breweryId;
    private Long owner_id;
	private String breweryName;
    private String website;
	private String address;
	private String city;
	private String state;

    public Brewery(Long breweryId, Long ownerId, String breweryName, String website, String address, String city, String state) {
        this.breweryId = breweryId;
        this.owner_id = ownerId;
        this.breweryName = breweryName;
        this.website = website;
        this.address = address;
        this.city = city;
        this.state = state;
    }

    public Brewery(){
        
    }

    public Long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(Long breweryId) {
        this.breweryId = breweryId;
    }
    
    public Long getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(Long owner_id) {
        this.owner_id = owner_id;
    }

    public String getBreweryName() {
        return breweryName;
    }

    public void setBreweryName(String breweryName) {
        this.breweryName = breweryName;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setOwner_Id(int owner_id) {
    }
}
