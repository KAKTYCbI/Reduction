<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css"/>" />
<h1>Главная</h1>
</br>
 <div class="reviews">
    <div class = "review">
         <div class = "reviewtop"></div>
            <div class = "reviewcenter">

            <form:form method = "post" action = "addlink" commandName = "link">
    <table>
      <tr>
        <td>
          <form:label path = "domain">Имя вашего сайта:</form:label>
        </td>
        <td>
          <form:input path="domain"/>
        </td>
        
      </tr>
     
      <tr>
        <td colspan="2"><input type="SUBMIT" value="Дабавить ссылку"></td>
      </tr>
    </table>
  </form:form>
            
            </div>
          <div class = "reviewbottom"></div>
    </div>

  </div>