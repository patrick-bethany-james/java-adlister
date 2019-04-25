package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long user_id;
    private String title;
    private String description;
    private String createDate = "2018-04-25";
    private String soldDate;
    private String zipCode;
    private String dob;
    private String gender;
    private String pictureURL;
    private String species;

    public Ad(long user_id, String title, String description, String zipCode, String dob, String gender, String pictureURL, String species) {
        this.user_id = user_id;
        this.title = title;
        this.description = description;
        this.zipCode = zipCode;
        this.dob = dob;
        this.gender = gender;
        this.pictureURL = pictureURL;
        this.species = species;
    }

    public Ad(long id, long userId, String title, String description) {
        this.id = id;
        this.user_id = userId;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String title, String description) {
        this.user_id = userId;
        this.title = title;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return user_id;
    }

    public void setUserId(long userId) {
        this.user_id = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getSoldDate() {
        return soldDate;
    }

    public void setSoldDate(String soldDate) {
        this.soldDate = soldDate;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }
}
