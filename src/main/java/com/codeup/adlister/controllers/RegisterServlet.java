package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setAttribute("username", "");
        request.setAttribute("email", "");
        request.setAttribute("password", "");
        String username = request.getParameter("username");
        System.out.println(username);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hash = Password.hash(password);
        String passwordConfirmation = request.getParameter("confirm_password");






        if (DaoFactory.getUsersDao().findByUsername(username) != null) {
            request.setAttribute("error", username + " Username is already taken, please try another");
            request.setAttribute("username", username);
            request.setAttribute("email", email);

            return;
        }

        // validate input
        boolean inputHasErrors =
                username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (! password.equals(passwordConfirmation));


        if(username.equals("")){
            request.setAttribute("usernameError", "<div class='alert alert-danger'>Please enter username</div>" );
//            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }else{
            request.setAttribute("username", username);
        }
        if(email.equals("")){
            request.setAttribute("emailError", "<div class='alert alert-danger'>Please enter email</div>" );
//            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }else{
            request.setAttribute("email", email);
        }
        if(password.equals("")){
            request.setAttribute("passwordError", "<div class='alert alert-danger'>Please enter password</div>" );
//            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }else{
            request.setAttribute("password", password);
        }
        if (!passwordConfirmation.equals(password)) {
            request.setAttribute("confirmError", "<div class='alert alert-danger'>Passwords must match</div>");
        }




//        Map<String, String> Errors = new HashMap<>();
//        if (username.isEmpty()) {
//            Errors.put("username", "<div class='alert alert-danger'>Please enter username</div>");
//        }else{
//            request.setAttribute("username", username);
//        }
//        if (email.isEmpty()) {
//            Errors.put("email", "<div class='alert alert-danger'>Please enter email address</div>");
//        }else{
//            request.setAttribute("email", email);
//        }
//
//        if (password.isEmpty()) {
//            Errors.put("password", "<div class='alert alert-danger'>Please enter password</div>");
//        }


//        request.setAttribute("Errors", Errors);




        if (inputHasErrors) {
//            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            response.sendRedirect("/register");
            return;
        }



        // create and save a new user
        User user = new User(username, email, hash);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
