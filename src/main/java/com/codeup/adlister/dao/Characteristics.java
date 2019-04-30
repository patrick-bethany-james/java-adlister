package com.codeup.adlister.dao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Characteristic;

import java.util.List;

public interface Characteristics {
        // get a list of all the ads
        List<Characteristic> all();
        // insert a new ad and return the new ad's id
        Long insert(Characteristic character);
        List<Characteristic> searchChar(String category);
        void deleteCharacter(Long id);
        List<Characteristic> updateCharacter(Characteristic Char, Long user_id);







}
