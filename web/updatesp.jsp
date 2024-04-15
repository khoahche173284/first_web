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
      
        <form action="updatesp" method="post" >
            <input type="hidden" name="characterid" value="${nhanvat.characterid}">
            Name: <input type="text" name="name" value= "${nhanvat.name}" required/>
            <br/><!-- comment -->
            the loai : <select name="title">
                <c:forEach var="anime" items="${animeList}">
                    <option value="${anime.animeid}">${anime.title}</option>
                </c:forEach>
            </select>

            <br/>
            <input type="submit" value="update" />
        </form>
    </body>
</html>
