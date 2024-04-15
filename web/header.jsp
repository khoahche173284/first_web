<%-- 
    Document   : header
    Created on : Feb 12, 2024, 1:50:06 AM
    Author     : congkhoa2723
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test ="${admin!=null}">
    <p> wellcome , ${admin.name}</p>
    <p><a><a href="logout" >Logout</a>
    <br>
</c:if>
<%@include file="menu.jsp" %>