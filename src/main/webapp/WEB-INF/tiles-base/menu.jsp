<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/menu.css"/>" />


<div class="vert_menu">
<h1>Меню</h1>
<div class="verch"></div>
<div class="center">
<ul>

 <security:authorize access="hasRole('ROLE_CLIENT')" >
 <li><a href="<c:url value='/home' />">Главная</a></li>
<li><a href="<c:url value='/client/addlink' />">Дабавить ссылку</a></li>

 </security:authorize> 
</ul>
</div>
<div class="niz"></div>
</div>
