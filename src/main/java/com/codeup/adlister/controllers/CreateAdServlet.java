package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {


//         User username =  (User) request.getSession().getAttribute("user");
//
//
//        System.out.println(username);
//
//        Ad ad = new Ad(username.getId(),
//                request.getParameter("title"),
//                request.getParameter("description"),
//                request.getParameter("zipCode"),
//                request.getParameter("dob"),
//                request.getParameter("gender"),
//                request.getParameter("pictureURL"),
//                request.getParameter("species_type")
//        );


//        Ad ad = new Ad(username.getId());
//
        DaoFactory.getAdsDao().search();


//        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");


    }
}
