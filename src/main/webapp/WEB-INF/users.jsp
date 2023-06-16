<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="cssfile.css" type="text/css"/>
    <link rel="stylesheet" href="css/displaytag.css" type="text/css"/>
    <link rel="stylesheet" href="css/screen.css" type="text/css"/>
    <link rel="stylesheet" href="css/site.css" type="text/css"/>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <title>User Registrations</title>
</head>
<body>
<div class="w-full bg-white ">
    <div class="w-full px-6">
        <div class="w-full flex flex-col justify-center items-center border-b-2">
            <img src="images/rcalogo.png" alt="rcalogo"/>
            <p class="text-blue-500 font-bold text-xl ">RCA INFORMATION MANAGEMENT SYSTEM</p>
        </div>
        <div class="w-full flex justify-end px-4">
            <c:if test="${authenticatedUser !=null}">
            <div class="w-2/4 flex justify-evenly py-2 ">
                <a href="listuser.php?page=profile&&id=${authenticatedUser.id}">
                    <button class="bg-blue-900 p-6 rounded text-white flex items-center justify-center">Profile
                    </button>
                </a> <img src="icons/user.png"/>
                <p class="font-semibold ">${authenticatedUser.userRole}:${authenticatedUser.fullName}</p>
                <a href="login.php?logout=logout"><button class="bg-blue-900 p-6 rounded text-white flex items-center justify-center">Logout</button></a>

            </div>
        </div>
        </c:if>
        <c:if test="${authenticatedUser ==null}">
            <div class="menu" align="left">
                | <a href="login.php?">Login</a> |
            </div>
        </c:if>
</div>

    <div>
        <%@ include file="menu.jsp" %>
    </div>
    <div class="w-full bg-white p-2">
        <c:if test="${authenticatedUser !=null}">
            <p class="text-center text-blue-500 text-xl my-4">Registered Users</p>
            <form action="listuser.php?page=statusapproval" method="post">
                    <table class="w-full bg-white ">
                        <thead class="bg-purple-900 ">
                        <tr class="border border-black">
                            <td class="border border-black">ID</td>
                            <td class="border border-black">Name</td>
                            <td class="border border-black">Email</td>
                            <td class="border border-black">Role</td>
                            <td class="border border-black">Status</td>
                        </tr>
                        </thead>
                        <tbody class="bg-white">
                        <c:forEach items="${users}" var="usr" varStatus="usrstatus">
                            <tr class="bg-white border border-black">
                                <td class="border border-black">${usr.id}</td>
                                <td class="border border-black">${usr.fullName}</td>
                                <td class="border border-black">${usr.email}</td>
                                <td class="border border-black">${usr.userRole.getRoleDescription()}</td>
                                <td class="border border-black"><input type="checkbox" name="usrIds"
                                           value="${usr.id}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

            </form>
        </c:if>
    </div>





<%@ include file="footer.jsp" %>