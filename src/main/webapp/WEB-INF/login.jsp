<?xml version="1.0" encoding="UTF-8" ?>

<html>
<head>
	<title>Login</title>

	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

</head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div  class="flex items-center justify-center h-screen">

	<form action="login.php" method="post" class="w-1/3 mx-auto h-2/4 bg-white shadow-md shadow-indigo-200 rounded" >
		<p class="text-xl font-semibold text-blue-500 text-center">Login </p>
		<c:if test="${error !=null}">
			<p class="text-center text-red-900">${error}</p>
		</c:if>
		<div class="flex flex-col space-y-12 p-4 w-2/3 mx-auto" >
				<input type="text" maxlength="50" name="username" id="username" class="block border rounded w-full outline-none p-2" placeholder="Username"/>
				<input type="password" name="password" id="password" maxlength="50" size="25" class="block border rounded w-full outline-none p-2" placeholder="Password"/>
				<input type="submit" value="Login" class="block bg-blue-500 w-full p-4 rounded text-white text-center " />
		</div>
		<p class="text-center">Don't have an account?<a class="text-blue-500" href="createuser.php?page=createuser">Sign Up</a></p>

	</form>

</div>
<%@ include file="footerlogin.jsp"%>
</html>

