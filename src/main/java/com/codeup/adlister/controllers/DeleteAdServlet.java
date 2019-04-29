package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


    @WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/delete")
    public class DeleteAdServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            Long id = Long.parseLong(request.getParameter("id"));
//
            DaoFactory.getAdsDao().deleteAd(id);
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
//            response.sendRedirect("/ads");
        }
    }




