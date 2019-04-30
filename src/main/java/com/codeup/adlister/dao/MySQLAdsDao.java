package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override

    public List<Ad> searchAds(Map<String, List> categorySearch) { // title, description, gender


        PreparedStatement stmt = null;
        try {
            String selectQuery = buildQueryString(categorySearch);
            System.out.println("this is the query i made!" + selectQuery);
            stmt = connection.prepareStatement(selectQuery);
//            stmt.setString(1, selectQuery);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, createDate, zipCode, dob, gender, pictureURL, species) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4,ad.getCreateDate());
            stmt.setString(5,ad.getZipCode());
            stmt.setString(6,ad.getDob());
            stmt.setString(7,ad.getGender());
            stmt.setString(8,ad.getPictureURL());
            stmt.setString(9,ad.getSpecies());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

@Override
    public void deleteAd(Long id) {
        try {
            String insertQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery);
            stmt.setLong(1, id);
            stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//            return all();
        }catch (SQLException e){
            throw new RuntimeException("Error deleting ad", e);
        }
    }

    public Long updateAd(Ad ad){
        try {
            String insertQuery = "UPDATE FROM ads " + "SET title = ?, description = ?, zipCode = ?, dob = ?, gender = ?, pictureURL = ?, species = ? WHERE id = user_id";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setString(3, ad.getZipCode());
            stmt.setString(4, ad.getDob());
            stmt.setString(5, ad.getGender());
            stmt.setString(6, ad.getPictureURL());
            stmt.setString(7, ad.getSpecies());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        }catch(SQLException e){
            throw new RuntimeException("Error updating ad", e);
        }
    }




    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    private String buildQueryString(Map<String, List> categorySearch) {

        String queryString = "SELECT * from ads WHERE ";


 // if it contains a key, build a string like "species = (value of key)" and then build the query string with it.
        if (categorySearch.get("species").isEmpty()){
            queryString += "species = '%'";
        } else {
//            queryString += "species = " + categorySearch.get("species");

            for(Object species : categorySearch.get("species")) {

                queryString += "species = " + "'" + species.toString() + "';";
                return queryString;
            }
        }

        if (categorySearch.get("zipcode").isEmpty()){
            queryString += "zipcode = '%'";
        } else {
            queryString += "zipcode = " + categorySearch.get("zipcode");
        }

        if (categorySearch.get("age").isEmpty()){
            queryString += "age = '%'";
        } else {
            if (categorySearch.get("age").toString().equals("3")) {
                queryString += "age BETWEEN 0 AND 3";
            } else if (categorySearch.get("age").toString().equals("4")) {
                queryString += "age BETWEEN 4 AND 7";
            } else if (categorySearch.get("age").toString().equals("8")) {
                queryString += "age > 8";
            }
        }

        if (categorySearch.get("sex").isEmpty()){
            queryString += "sex = '%'";
        } else {
            queryString += "sex = " + categorySearch.get("sex");
        }

        if (categorySearch.get("characteristics").isEmpty()) {
            queryString += "characteristics = '%'";
        }
//        } else {
//            queryString += "characteristics = " + searchByMap.get("characteristics").toArray(); ;
//            for(Object characteristics : searchByMap.get("characteristics")){
//                queryString += "AND" + characteristics.toString();
//            }
//
//
//            queryString += "characteristics = " + searchByMap.get("characteristics");
//        }



        // KEY         -     VALUE
        // species           [ cat ] or [ dog ] or [ rodent ]
        // zipcode
        // age
        // sex
        // characteristics      [ kid-friendly, shy, active ]
        System.out.println("look at this garbage: " + queryString);
        return queryString;
    }
}
