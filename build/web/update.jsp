<%-- 
    Document   : update.jsp
    Created on : Jan 25, 2024, 3:33:01 PM
    Author     : congkhoa2723
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title >Update Nghệ Sĩ</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <hr>
        <h1 style = "color : red">Update Sản Phẩm</h1>
      
        <form action="update" method="post">
            <input type="hidden" name="animeid" value="${anime.animeid}">
            Name: <input type="text" name="title" value= "${anime.title}" />
            <br/><!-- comment -->
            Date release: <input type="text" name="releasedate" value= "${anime.releasedate}"/>
            <br/>
            The Loai :  <input type="text" name="genre" value= "${anime.genre}" />

            <br/>
            <input type="submit" value="update" />
        </form>
    </body>
</html>
