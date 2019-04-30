package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Characteristic;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCharDao implements Characteristics {
    private Connection connection = null;
    public MySQLCharDao(Config config) {
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
    public List<Characteristic> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM characteristics");
            ResultSet rs = stmt.executeQuery();
            return createCharsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all characters.", e);
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






    @Override
    public List<Characteristic> searchChar(String searchBy) { // title, description, gender
        PreparedStatement stmt = null;
        try {
            String selectQuery = "SELECT * FROM ads WHERE species = ?";
            stmt = connection.prepareStatement(selectQuery);
            stmt.setString(1, searchBy);
            ResultSet rs = stmt.executeQuery();
            return createCharsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching all ads.", e);
        }
    }

    @Override
    public Long insert(Characteristic character) {
        try {
            String insertQuery = "INSERT INTO characteristics(id, characteristic) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, character.getId());
            stmt.setString(2,character.getCharacteristic());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new characteristic.", e);
        }
    }


    @Override
    public void deleteCharacter(Long id) {
        try {
            String insertQuery = "DELETE FROM characteristics WHERE id = ?";
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

    public List<Characteristic> updateCharacter(Characteristic character, Long char_id){
        try {
            String insertQuery = "UPDATE characteristics " + "SET characteristic = ? WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, character.getCharacteristic());
            stmt.setLong(2, char_id);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return createCharsFromResults(rs);
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

    private Characteristic extractCharacter(ResultSet rs) throws SQLException {
        return new Characteristic(
                rs.getLong(("id")),
                rs.getString("characteristic"));
    }


    private List<Characteristic> createCharsFromResults(ResultSet rs) throws SQLException {
        List<Characteristic> characters = new ArrayList<>();
        while (rs.next()) {
            characters.add(extractCharacter(rs));
        }
        return characters;
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
