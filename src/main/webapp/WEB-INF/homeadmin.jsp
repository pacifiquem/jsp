<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="headeradmin.jsp">
	<jsp:param value="Home Admin" name="title" /></jsp:include>
<div class="w-full space-y-4 bg-white">
	<p class="text-center text-xl text-blue-500">Welcome to Rwanda Coding Academy</p>
	<div class="w-full flex px-4 gap-6">
		<div class="grid w-full gap-4 xl:grid-cols-4 md:grid-cols-3 sm:grid-cols-2 justify-self-end">
			<img src="https://www.rca.ac.rw/images/Amb-Israel-Ron-Adam.JPG" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="https://www.rca.ac.rw/images/05.jpg" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="https://www.rca.ac.rw/images/09.jpg" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="https://www.rca.ac.rw/images/visit-to-DMM-Hehe2.jpg" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="images/im1.JPG" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="images/im2.JPG" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="images/im3.JPG" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>
			<img src="images/im4.JPG" class="w-full h-full object-cover rounded-md aspect-[3/2]"/>

		</div>
		<div class="w-1/4 bg-white space-y-4 ">
			<p class="text-center text-blue-500">Quick Links</p>
			<div class="bg-white shadow-md sahdow-purple-900 rounded">
				<a  href="createcourse.php?page=createcourse&action=list"><p class="p-6 rounded text-blue-500 flex items-center justify-center">View Courses</p></a>
			</div>
			<div class="bg-white shadow-md sahdow-purple-900 rounded">
				<a href="createcourse.php?page=createcourse"><p class="p-6 rounded text-blue-500 flex items-center justify-center">View Marks</p></a>
			</div>

		</div>
	</div>




</div>
