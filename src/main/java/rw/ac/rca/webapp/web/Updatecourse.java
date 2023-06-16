package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.impl.CourseDAOImpl;
import rw.ac.rca.webapp.orm.Course;
import rw.ac.rca.webapp.util.UserRole;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Updatecourse extends HttpServlet {
    Course course;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageDirect = request.getParameter("page");
        HttpSession session = request.getSession();
        CourseDAOImpl courseDAO=CourseDAOImpl.getInstance();
        if (pageDirect !=null){
            if (pageDirect.equals("updatecourse")){
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                course= courseDAO.getCourseById(Integer.parseInt(request.getParameter("id")));
                session.setAttribute("course",course);
                session.setAttribute("end",formatter.format(course.getEnd()));
                session.setAttribute("start",formatter.format(course.getStart()));
                UserRole[] userRoles = UserRole.values();
                session.setAttribute("userRoles", userRoles);
                request.getRequestDispatcher("WEB-INF/updatecourse.jsp").forward(request,response);

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageDirect = request.getParameter("page");
        HttpSession session = request.getSession();
        CourseDAOImpl courseDAO=CourseDAOImpl.getInstance();
        if (pageDirect != null) {
            if (pageDirect.equals("updatecourse")) {
                Course course= courseDAO.getCourseById(Integer.parseInt(request.getParameter("id")));
                session.setAttribute("course",course);
                if (request.getParameter("updateCourse") != null) {
                    Course course1 = new Course();
                    String name = request.getParameter("name");
                    String code = request.getParameter("code");
                    String minStudent = request.getParameter("minStudent");
                    String maxStudent = request.getParameter("maxStudent");
                    String dateIn = request.getParameter("dateIn");
                    String dateEnd = request.getParameter("dateEnd");
                    String isCanceled = request.getParameter("isCanceled");

                    try {
                        course1.setName(name);
                        course1.setCode(code);
                        course1.setMinStudent(Integer.parseInt(minStudent));
                        course1.setMaxStudent(Integer.parseInt(maxStudent));
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        try {
                            Date date1 = dateFormat.parse(dateIn);
                            Date date2 = dateFormat.parse(dateEnd);
                            course1.setStart(date1);
                            course1.setEnd(date2);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }

                        course1.setCancelled(isCanceled.equals("NO"));
                        course1.setId(course.getId());
                        Course course2=courseDAO.updateCourse(course1);
                        if (course2 !=null){
                            session.setAttribute("message", "updated successfully");
                        }
                        else {
                            session.setAttribute("message", "Can't update");
                        }
                        System.out.println("This is the course you are updating "+course.getName());

                    }
                    catch (Exception e) {
                        session.setAttribute("message", e.toString());
                        e.printStackTrace();
                    }



                }
                UserRole[] userRoles = UserRole.values();
                session.setAttribute("userRoles", userRoles);
                request.getRequestDispatcher("WEB-INF/updatecourse.jsp").forward(request,response);


            }

        }

    }

}
