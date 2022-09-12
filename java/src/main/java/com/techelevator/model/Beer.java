package com.techelevator.model;

public class Beer {
    private String beer_Id;
    private String beer_name;
    private String brewery_name;
    private String style;
    private String abv;
    private String description;
    private String brewery_Id;
    private String img_url;

    public Beer(String beer_Id, String beer_name, String brewery_Id, String brewery_name, String description, String img_url, String abv,
            String style) {
        this.beer_Id = beer_Id;
        this.beer_name = beer_name;
        this.brewery_Id = brewery_Id;
        this.brewery_name = brewery_name;
        this.description = description;
        this.img_url = img_url;
        this.abv = abv;
        this.style = style;
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

    public String getBrewery_name() {
        return brewery_name;
    }

    public void setBrewery_name(String brewery_name) {
        this.brewery_name = brewery_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getAbv() {
        return abv;
    }

    public void setAbv(String abv) {
        this.abv = abv;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getBeer_name() {
        return beer_name;
    }

    public void setBeer_name(String beer_name) {
        this.beer_name = beer_name;
    }
}