package java.com.codeup.adlister.dao;

import main.java.com.codeup.adlister.dao.MySQLAdsDao;

public class DaoFactory {
    private static com.codeup.adlister.dao.Ads adsDao;
    private static com.codeup.adlister.dao.Users usersDao;
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
}
