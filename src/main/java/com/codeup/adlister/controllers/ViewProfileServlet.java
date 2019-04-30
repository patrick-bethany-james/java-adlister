package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Long id = Long.parseLong(request.getParameter("id"));
        DaoFactory.getAdsDao().deleteAd(id);
        response.sendRedirect("/profile");
//        Long user_id = Long.parseLong(request.getParameter("user_id"));
//        User user = (User) request.getSession().getAttribute("user");
//        Ad ad = new Ad(user.getId(),
//                request.getParameter("title"),
//                request.getParameter("description"),
//                request.getParameter("zipCode"),
//                request.getParameter("dob"),
//                request.getParameter("gender"),
//                request.getParameter("pictureURL"),
//                request.getParameter("species_type")
//        );
//
//
//        DaoFactory.getAdsDao().updateAd(ad, user_id);
//        response.sendRedirect("/profile");
    }
}

