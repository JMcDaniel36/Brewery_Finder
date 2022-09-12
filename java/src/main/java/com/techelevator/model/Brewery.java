package com.techelevator.model;

public class Brewery {
    private Long breweryId;
    private Long owner_id;
	private String breweryName;
    private String website;
	private String address;
	private String city;
	private String state;
	private int user_Id;
    private String imagePath;

    public Brewery(Long breweryId, Long ownerId, String breweryName, String website, String address, String city, String state,
     int user_Id, String imagePath) {
        this.breweryId = breweryId;
        this.owner_id = ownerId;
        this.breweryName = breweryName;
        this.website = website;
        this.address = address;
        this.city = city;
        this.state = state;
        this.user_Id = user_Id;
        this.imagePath = imagePath;
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

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

}
