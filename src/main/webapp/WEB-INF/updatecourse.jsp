<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<jsp:include page="headeradmin.jsp"><jsp:param
        name="title" value="Update Course" />
</jsp:include>
<div id="middle">
  <h2 style="text-align: left;">
    <b>Enter Course Details</b>
  </h2>
  <c:if test="${message != null}">
    <fieldset>
      <h3>
        <span style="color: red"> ${message}</span>
      </h3>
    </fieldset>
  </c:if>
  <form action="updatecourse.php?page=updatecourse&&id=${course.id}" method="post">
    <table>
      <tr>
        <td align="right"><b><t:field mandatory="yes"
                                      text="Coursename"></t:field></b></td>
        <td align="left"><input type="text" value="${course.name}" size="25" maxlength="50"
                                name="name" id="name" /></td>
      </tr>
      <tr>
        <td align="right"><b><t:field mandatory="yes"
                                      text="Code"></t:field></b></td>
        <td align="left"><input type="text" size="25"
                                maxlength="50" value="${course.code}" name="code" id="code" /></td>
      </tr>
      <tr>
        <td align="right"><b>Minimum Students</b></td>
        <td align="left"><input type="number" size="50" maxlength="50"
                                value="${course.minStudent}" name="minStudent" id="minStudent" /></td>
      </tr>
      <tr>
        <td align="right"><b>Maximum Students</b></td>
        <td align="left"><input type="number" size="50" maxlength="50"
                                value="${course.maxStudent}"   name="maxStudent" id="maxStudents" /></td>
      </tr>
      <tr>
        <td align="right"><b>Date In</b></td>
        <td align="left"><input type="date" size="50" maxlength="50"
                                value="${start}"   name="dateIn" id="dateIn" /></td>
      </tr>
      <tr>
        <td align="right"><b>Date End</b></td>
        <td align="left"><input type="date" size="50" maxlength="50"
                                value="${end}"   name="dateEnd" id="dateEnd" /></td>
      </tr>
      <tr>
        <td align="right"><b>Is Canceled</b></td>
        <c:choose>
          <c:when test="${course.isCancelled()}">

            <td>Yes <input type="radio" value="YES" name="isCanceled" id="isYes" checked></td>
            <td>Yes <input type="radio" value="NO" name="isCanceled" id="isNo"></td>
          </c:when>
          <c:otherwise>
            <td>No <input type="radio" value="NO" name="isCanceled" id="isNo" checked></td>
            <td>Yes <input type="radio" value="YES" name="isCanceled" id="isYes" ></td>
          </c:otherwise>
        </c:choose>


      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="left"><input type="submit" name="updateCourse"
                                value="Update Course" /></td>
      </tr>
    </table>
  </form>

</div>
<%@ include file="footer.jsp"%>