<%-- 
    Document   : add
    Created on : Jan 23, 2024, 10:09:45 AM
    Author     : congkhoa2723
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add person</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <hr>
        <!-- tittle -->
        <h1 style = "color : red ">Thêm anime</h1>

        <form action="add" method="post" > 
            Name Product: <input type="text" name="title" required />
            <br/><!-- lấy age từ age -->
            Date release : <input type="date" name="releasedate" required />
            <br/><!-- button -->
            genre : <input type="text" name="genre" required />
            <br/>

            <input type="submit" value="Add" />


        </form>

        <p>${error}</p>
    </body>
</html>
