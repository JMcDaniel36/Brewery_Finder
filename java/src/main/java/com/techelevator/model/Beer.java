package com.techelevator.model;

public class Beer {
    private String beer_Id;
    private String brewery_Id;
    private String name;
    private String brewery;
    private String description;
    private String image;
    private String abv;
    private String type;

    public Beer(String beer_Id, String brewery_Id, String name, String brewery, String description, String image, String abv,
            String type) {
        this.beer_Id = beer_Id;
        this.brewery_Id = brewery_Id;
        this.name = name;
        this.brewery = brewery;
        this.description = description;
        this.image = image;
        this.abv = abv;
        this.type = type;
    }

    public Beer() {
    }

    public String getBeer_Id() {
        return beer_Id;
    }

    public void setBeer_Id(String beer_Id) {
        this.beer_Id = beer_Id;
    }

    public String getBrewery_Id() {
        return brewery_Id;
    }

    public void setBrewery_Id(String brewery_Id) {
        this.brewery_Id = brewery_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrewery() {
        return brewery;
    }

    public void setBrewery(String brewery) {
        this.brewery = brewery;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAbv() {
        return abv;
    }

    public void setAbv(String abv) {
        this.abv = abv;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}