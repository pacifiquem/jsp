<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="cssfile.css" type="text/css"/>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

    <title>${param.title}</title>
</head>
<body>
<div class="w-full px-6">
    <div class="w-full flex flex-col justify-center items-center border-b-2">
        <img src="images/rcalogo.png" alt="rcalogo"/>
        <p class="text-blue-500 font-bold text-xl ">RCA INFORMATION MANAGEMENT SYSTEM</p>
    </div>
    <div class="w-full flex justify-end px-4">
        <c:if test="${authenticatedUser !=null}">
        <div class="w-1/4 flex justify-evenly py-2">
            <a href="listuser.php?page=profile&&id=${authenticatedUser.id}">
                <button class="bg-blue-900 p-6 rounded text-white flex items-center justify-center">Profile
                </button>
            </a> <img src="icons/user.png"/>
            <p class="font-semibold ">${authenticatedUser.fullName}</p>
            <a href="login.php?logout=logout"><button class="bg-blue-900 p-6 rounded text-white flex items-center justify-center">Logout</button></a>

        </div>
    </div>

    </c:if>
    <c:if test="${authenticatedUser ==null}">
        <div class="menu" align="left">
            | <a href="login.php?"><font color="#ffffff">Login</font></a> |
        </div>
    </c:if>


</div>

<%@ include file="menu.jsp" %>