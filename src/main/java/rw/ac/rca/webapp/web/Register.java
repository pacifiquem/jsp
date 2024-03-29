package rw.ac.rca.webapp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.ac.rca.webapp.orm.User;
import rw.ac.rca.webapp.util.UserRole;
import rw.ac.rca.webapp.util.Util;
import rw.ac.rca.webapp.dao.UserDAO;
import rw.ac.rca.webapp.dao.impl.UserDAOImpl;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet(name = "Register", urlPatterns = "/register.php")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = UserDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        UserRole[] userRoles = UserRole.values();
        httpSession.setAttribute("userRoles", userRoles);
        request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(
                request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        User user = new User();
        String usernameauth = request.getParameter("username");
        String passwordauth = request.getParameter("password");
        String userfullname = request.getParameter("userfullname");
        String email = request.getParameter("email");
        String userRole = request.getParameter("userRole");
//        set user role to user (default) if not selected (null)
        if (userRole == null) {
            userRole = "GUEST";
        }
        UserRole usrr = UserRole.valueOf(userRole);

        try {
            String hashedPsw = Util.generateHashed512(passwordauth);
            user.setUsername(usernameauth);
            user.setPassword(hashedPsw);
            user.setFullName(userfullname);
            user.setEmail(email);
            user.setUserRole(usrr);

            userDAO.saveOrUpdateUser(user);

            httpSession.setAttribute("message", "Created successfully");
            request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(
                    request, response);
        } catch (Exception e) {
            httpSession.setAttribute("message", "Can't Create");
        }
    }

}
