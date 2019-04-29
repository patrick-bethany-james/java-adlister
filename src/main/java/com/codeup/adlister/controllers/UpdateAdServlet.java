package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/ads/update")
public class UpdateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/update.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Ad ad = new Ad(
                1,
                request.getParameter("title"),
                request.getParameter("description"),
                request.getParameter("zipCode"),
                request.getParameter("dob"),
                request.getParameter("gender"),
                request.getParameter("pictureURL"),
                request.getParameter("species_type")
        );


        DaoFactory.getAdsDao().updateAd(ad);
        response.sendRedirect("/ads");
    }
}