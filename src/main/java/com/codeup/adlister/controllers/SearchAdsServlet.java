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
import java.util.List;

@WebServlet(urlPatterns = "/search")
public class SearchAdsServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        request.setAttribute("ads", DaoFactory.getAdsDao().all());

        String species = request.getParameter("species");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String characteristics = request.getParameter("characteristics");
        List<Ad> searchBy = new ArrayList<>();

        if (species != null) {
//            searchBy.add(species);
            searchBy = DaoFactory.getAdsDao().searchAds(species);
            request.setAttribute("ads", searchBy);
        }
//        } else if (age != null) {
//            searchBy.add(age);
////            DaoFactory.getAdsDao().searchAds(age);
////            request.setAttribute("searchdiv", age);
//        } else if (sex != null) {
//            searchBy.add(sex);
////            DaoFactory.getAdsDao().searchAds(sex);
////            request.setAttribute("searchdiv", sex);
//        } else if (characteristics != null) {
//            searchBy.add(characteristics);
////            DaoFactory.getAdsDao().searchAds(characteristics);
////            request.setAttribute("searchdiv", characteristics);
//        }

//        DaoFactory.getAdsDao().searchAds(searchBy);

            request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);

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
