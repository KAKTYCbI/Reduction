<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css"/>" />
<h1>Главная</h1>
</br>
 <div class="reviews">
   <c:forEach items="${links}" var="links" >
      <div class = "review">
         <div class = "reviewtop"></div>
            <div class = "reviewcenter">

             <a href="${links.nameLink }">reduction/${links.nameLink }</a>
            </div>
          <div class = "reviewbottom"></div>
          </div>
    </c:forEach>
  </div>