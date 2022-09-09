package com.techelevator.model;

public class Brewery {
    private Long breweryId;
	private String name;
	private String address;
	private String city;
	private String zipcode;
	private String phone;
	private int user_Id;
    private String hours;
	private String websiteUrl;

    public Brewery(Long breweryId, String name, String address, String city, String zipcode, String phone, int user_Id,
            String hours, String websiteUrl) {
        this.breweryId = breweryId;
        this.name = name;
        this.address = address;
        this.city = city;
        this.zipcode = zipcode;
        this.phone = phone;
        this.user_Id = user_Id;
        this.hours = hours;
        this.websiteUrl = websiteUrl;
    }

    public Brewery(){
        
    }

    public Long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(Long breweryId) {
        this.breweryId = breweryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }
}
