package com.techelevator.model;

public class Brewery {
    private String brewer_Id;
	private String name;
	private String brewery_type;
	private String street;
	private String address_2;
	private String city;
	private String state;
	private String postal_code;
	private String website_url;

	public Brewery(String brewer_Id, String name, String brewery_type, String street, String address_2, String city,
            String state, String postal_code, String website_url) {
        this.brewer_Id = brewer_Id;
        this.name = name;
        this.brewery_type = brewery_type;
        this.street = street;
        this.address_2 = address_2;
        this.city = city;
        this.state = state;
        this.postal_code = postal_code;
        this.website_url = website_url;
    }

    public String getBrewer_Id() {
        return brewer_Id;
    }

    public void setBrewer_Id(String brewer_Id) {
        this.brewer_Id = brewer_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrewery_type() {
        return brewery_type;
    }

    public void setBrewery_type(String brewery_type) {
        this.brewery_type = brewery_type;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getAddress_2() {
        return address_2;
    }

    public void setAddress_2(String address_2) {
        this.address_2 = address_2;
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
    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getWebsite_url() {
        return website_url;
    }

    public void setWebsite_url(String website_url) {
        this.website_url = website_url;
    }
    public Brewery() {
	}
}
