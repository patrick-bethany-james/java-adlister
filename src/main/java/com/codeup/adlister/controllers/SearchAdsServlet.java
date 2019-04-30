package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/search")
public class SearchAdsServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);


        String species = request.getParameter("species");
        String zipcode = request.getParameter("zipcode");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String characteristics = request.getParameter("characteristics");
        List<Ad> searchedAds = new ArrayList<>();
        Map <String, List> categorySearch = new HashMap<>();
        List<String> speciesArray = new ArrayList<>();
        List<String> ageArray = new ArrayList<>();
        List<String> sexArray = new ArrayList<>();
        List<String> charArray = new ArrayList<>();
        List<String> zipcodeArray = new ArrayList<>();


        if (species != null) {
            speciesArray.add(species);
            categorySearch.put("species", speciesArray);
//            searchedAds = DaoFactory.getAdsDao().searchAds(species);
//            request.setAttribute("ads", searchedAds);
        }

        if (zipcode != null) {
            zipcodeArray.add(zipcode);
            categorySearch.put("zipcode", zipcodeArray);

        }

        if (age != null) {
            ageArray.add(age);
            categorySearch.put("age", ageArray);
//            DaoFactory.getAdsDao().searchAds(age);
//            request.setAttribute("ads", searchedAds);
        }

        if (sex != null) {
            sexArray.add(sex);
            categorySearch.put("sex", sexArray);
//            DaoFactory.getAdsDao().searchAds(sex);
//            request.setAttribute("searchdiv", sex);
        }

        if (characteristics != null) {
            charArray.add(characteristics);
//            DaoFactory.getAdsDao().searchAds(characteristics);
//            request.setAttribute("searchdiv", characteristics);
        }

//            System.out.println(categorySearch.entrySet());

            searchedAds =  DaoFactory.getAdsDao().searchAds(categorySearch);
        System.out.println(searchedAds);
            request.setAttribute("ads", searchedAds);

            request.getRequestDispatcher("WEB-INF/ads/search.jsp").forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {

//        String species = request.getParameter("species");
//        String age = request.getParameter("age");
//        String sex = request.getParameter("sex");
//        String characteristics = request.getParameter("characteristics");
//
//
//        if(species != null) {
//            DaoFactory.getAdsDao().searchAds(species);
//            request.setAttribute("searchdiv", species);
//        } else if (age != null) {
//            DaoFactory.getAdsDao().searchAds(age);
//            request.setAttribute("searchdiv", age);
//        } else if (sex != null) {
//            DaoFactory.getAdsDao().searchAds(sex);
//            request.setAttribute("searchdiv", sex);
//        } else if (characteristics != null) {
//            DaoFactory.getAdsDao().searchAds(characteristics);
//            request.setAttribute("searchdiv", characteristics);
//        }


    }
}
