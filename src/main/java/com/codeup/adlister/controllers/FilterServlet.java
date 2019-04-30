package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.FilterServlet", urlPatterns = "/search")
public class FilterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String species = "%";
        String zip = "%";
        String age = "%";
        String sex = "%";

//        System.out.println(species);
//        System.out.println(zip);
//        System.out.println(age);
//        System.out.println(sex);

        request.setAttribute("ads", DaoFactory.getAdsDao().filter(species,
                zip,
                age,
                sex));
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String species = request.getParameter("species");
        String zip = request.getParameter("location");
        String age = request.getParameter("age");
        String sex = request.getParameter("gender");


        if (species == null) {
            species = "%";
        } if (zip.equals("")) {
            zip = "%";
        } if (age == null) {
            age = "%";
        } if (sex == null) {
            sex = "%";
        }


//        species = "%";
//        zip = "%";
//        age = "%";
//        sex = "%";


        System.out.println("Species:"+species);
        System.out.println("Zip:"+zip);
        System.out.println("Age:"+age);
        System.out.println("Gender:"+sex);

        request.setAttribute("ads", DaoFactory.getAdsDao().filter(species,
                zip,
                sex,
                age));
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);


    }
}
