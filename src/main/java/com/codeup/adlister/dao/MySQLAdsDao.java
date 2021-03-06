package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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



//    @Override
//    public List<Ad> all(String input) {
//        PreparedStatement stmt = null;
//        try {
//            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user");
//            ResultSet rs = stmt.executeQuery();
//            return createAdsFromResults(rs);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error retrieving all ads.", e);
//        }
//    }
//
//    @Override
//    public List<Ad> search() {
//        PreparedStatement stmt = null;
//        try {
//            stmt = connection.prepareStatement("SELECT * FROM ads where user_id = '1'");
//            ResultSet rs = stmt.executeQuery();
//            return createAdsFromResults(rs);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error retrieving all ads.", e);
//        }
//    }



    public List<Ad> filter(String inputSpecies, String inputLocation, String inputGender, String inputAge) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE species like ? AND zipCode like ? AND gender like ? AND dob like ?");
            stmt.setString(1,inputSpecies);
            stmt.setString(2,inputLocation);
            stmt.setString(3,inputGender);
            stmt.setString(4,inputAge);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }



    @Override

    public List<Ad> searchAds(String searchBy) { // title, description, gender
        PreparedStatement stmt = null;
        try {
            String selectQuery = "SELECT * FROM ads WHERE species = ?";
            stmt = connection.prepareStatement(selectQuery);
            stmt.setString(1, searchBy);
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

    public List<Ad> updateAd(Ad ad, Long ad_id){
        try {
            String insertQuery = "UPDATE ads " + "SET title = ?, description = ?, zipCode = ?, dob = ?, gender = ?, pictureURL = ?, species = ? WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setString(3, ad.getZipCode());
            stmt.setString(4, ad.getDob());
            stmt.setString(5, ad.getGender());
            stmt.setString(6, ad.getPictureURL());
            stmt.setString(7, ad.getSpecies());
            stmt.setLong(8, ad_id);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return createAdsFromResults(rs);
        }catch(SQLException e){
            throw new RuntimeException("Error updating ad", e);
        }
    }







//    private Ad extractAd(ResultSet rs) throws SQLException {
//        return new Ad(
//            rs.getLong("id"),
//            rs.getLong("user_id"),
//            rs.getString("title"),
//            rs.getString("description")
//        );
//    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong(("id")),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("zipCode"),
                rs.getString("dob"),
                rs.getString("gender"),
                rs.getString("pictureURL"),
                rs.getString("species")
        );
    }


    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

//    private String buildQueryString(List<String> searchByArray) {
//
//        String queryString = "SELECT * from ads WHERE";
//        for(String category : searchByArray) {
//
//        }
//
//        // need to know what was selected. search by species is equal to blank, and
//    }
}
