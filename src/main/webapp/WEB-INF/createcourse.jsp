<?xml version="1.0" encoding="UTF-8" ?>
<html>
<head>
    <title>Create Course</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<body>
<div class="w-full px-6">
    <div class="w-full flex flex-col justify-center items-center border-b-2">
        <img src="images/rcalogo.png" alt="rcalogo"/>
        <p class="text-blue-500 font-bold text-xl ">RCA INFORMATION MANAGEMENT SYSTEM</p>
    </div>
    <div class="w-full flex justify-end  px-4">
        <c:if test="${authenticatedUser !=null}">
        <div class="w-1/4 flex justify-evenly items-center py-2">
            <a href="listuser.php?page=profile&&id=${authenticatedUser.id}">
                <button class="bg-blue-900 py-2 px-6 rounded text-white flex items-center justify-center">Profile
                </button>
            </a>
            <p class="font-semibold ">${authenticatedUser.fullName}</p>
            <a href="login.php?logout=logout"><button class="bg-blue-900 py-2 px-6 rounded text-white flex items-center justify-center">Logout</button></a>

        </div>
    </div>

    </c:if>
    <c:if test="${authenticatedUser ==null}">
        <div class="menu" align="left">
            | <a href="login.php?"><font color="#ffffff">Login</font></a> |
        </div>
    </c:if>


</div>
<div class="bg-white w-full">

    <div class="flex items-center justify-center w-full">
        <form action="createcourse.php?page=createcourse" method="post" class="w-1/2 mx-auto h-2/3 bg-white shadow-md shadow-indigo-200 border border-blue-500 rounded" >
<div class="w-full flex justify-center">
    <div class="w-20 h-20 flex items-center justify-center rounded-full bg-white shadow-md">
        <img src="images/rcalogo.png" alt="rcalog" class="object-fit" width="50" height="60" />
    </div>

</div>


            <div class="flex flex-col space-y-4 p-4 w-2/3 mx-auto" >
                <p class="text-center text-xl text-blue-500">
                    <b>Enter Course Details</b>
                </p>

                <c:if test="${error != null}">

                    <p class="text-red-500 text-center">
                            ${error}
                    </p>

                </c:if>
                <input type="text" placeholder="Course name" size="25" maxlength="50" name="coursename" id="coursename" class="block border rounded w-full outline-none p-2" />
                <input type="text" size="25" maxlength="50" name="code" id="code" placeholder="Course Code" class="block border rounded w-full outline-none p-2" />
                <input type="text" placeholder="Course Teacher" size="25" maxlength="50" name="courseTeacher" id="courseTeacher" class="block border rounded w-full outline-none p-2" />
                <input type="text" placeholder="max Student" size="25" maxlength="50" name="maxStudent" id="maxStudent" class="block border rounded w-full outline-none p-2"  />
                <input type="text" placeholder="minStudent" size="25" maxlength="50" name="minStudent" id="minStudent" class="block border rounded w-full outline-none p-2" >
                <input type="date" placeholder="Start Date" size="25" maxlength="50" name="startDate" id="startDate" class="block border rounded w-full outline-none p-2" >
                <input type="date" placeholder="End Date" size="25" maxlength="50" name="endDate" id="endDate" class="block border rounded w-full outline-none p-2" >
                <p>Is Cancelled</p>
                <div class="w-full flex gap-12">
                    <div class="flex gap-8">
                        <p>No</p>
                        <input type="radio" value="NO" name="isCancelled" id="isNo" >
                    </div>
                    <div class="flex gap-8">
                        <p>Yes</p>
                        <input type="radio" value="YES" name="isCancelled" id="isYes">
                    </div>
                </div>
                <input type="submit" name="saveDataCourse" value="Create Course" class="block bg-blue-500 w-full p-4 rounded text-white text-center "/>

            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>