package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> filter(String inputSpecies, String inputLocation, String inputGender, String inputAge);

    List<Ad> searchAds(String category);
    void deleteAd(Long id);
    List<Ad> updateAd(Ad ad, Long user_id);

}
