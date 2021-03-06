package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Characteristic;

public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;
    private static Characteristics characterDao;
    private static Config config = new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Characteristics getCharacterDao(){
        if(characterDao == null){
            characterDao = new MySQLCharDao(config);
        }
        return characterDao;
    }
}
