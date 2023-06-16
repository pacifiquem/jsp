package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.impl.CourseDAOImpl;
import rw.ac.rca.webapp.orm.Course;
import rw.ac.rca.webapp.util.UserRole;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ListCourse
 */
public class ListCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourseDAOImpl courseDAO = CourseDAOImpl.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListCourse() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String pageRedirect = request.getParameter("page");

		HttpSession httpSession = request.getSession();
		Object course = httpSession.getAttribute("authenticatedCourse");
		System.out.println("The user in session is: " + course);

		if (pageRedirect != null) {
			if (pageRedirect.equals("createcourse") && request.getParameter("action").equals("list")) {

				List<Course> courses = courseDAO.getAllCourses();
				httpSession.setAttribute("courses", courses);
				UserRole[] userRoles = UserRole.values();
				httpSession.setAttribute("userRoles", userRoles);
				request.getRequestDispatcher("WEB-INF/course.jsp").forward(request, response);

			}
		} else {
			httpSession.setAttribute("error", "Invalid Course. Try again!");
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}