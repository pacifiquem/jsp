<?xml version="1.0" encoding="UTF-8" ?>
<html>
<head>
	<title>Sign Up</title>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

	<div class="flex items-center justify-center h-screen">
		<form action="createuser.php?page=createuser" method="post" class="w-1/3 mx-auto h-3/4 bg-white shadow-md shadow-indigo-200 rounded">
			<p class="text-xl font-semibold text-blue-500 text-center">Sign Up</p>
			<div class="flex flex-col space-y-8 p-4 w-2/3 mx-auto" >
				<input type="text" placeholder="Username" size="25" maxlength="50" name="username" id="username" class="block border rounded w-full outline-none p-2" />
				<input type="password" size="50" maxlength="50" placeholder="password" name="password" id="password" class="block border rounded w-full outline-none p-2" />
				<input type="email" placeholder="email" size="25" name="email" id="email" id="email" class="block border rounded w-full outline-none p-2" />
				<input type="text" placeholder="full name" name="userfullname" id="userfullname" class="block border rounded w-full outline-none p-2" />
				<select name="userRole" id="userRole" class="p-2">
					<c:forEach items="${userRoles}" var="userrole"
							   varStatus="userrolestatus">
						<option value="${userrole}">
							<c:out value="${userrole.getRoleDescription()}" />
						</option>
					</c:forEach>
				</select>
				<input type="submit" name="saveDataUser" value="Create User" class="block bg-blue-500 w-full p-4 rounded text-white text-center " />
				<p class="text-center">Already have an account?<a class="text-blue-500" href="/rcamis_war_exploded/">Log in</a></p>

			</div>

		</form>
	</div>
</html>

