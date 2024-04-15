<%-- 
    Document   : list
    Created on : Jan 23, 2024, 10:09:53 AM
    Author     : congkhoa2723
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <h1 class="text-align-center" style = "color: red ">List Nhân Vật</h1>
        <!-- thong bao da dang nhap -->
        <h5 class="text-align-center" style = "color : #97CBE6 ">${tbdn}</h5>
      
            <hr>   

            <p style = "color : grey" >${error}</p>
            <c:if test ="${admin!=null}">
            <a href="addsp" style ="color : black" >Thêm </a>
            </c:if>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>ANIME</th>  
                  <!-- comment   <c:if test ="${admin != null}">
                    <th>Update</th>
                    <th>Delete</th>
                    </c:if> -->
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="nhanvat" items="${nhanvatList}">
                    <tr>
                        <td>${nhanvat.characterid}</td>
                        <td>${nhanvat.name}</td>
                        <td>${nhanvat.title}</td>
                  <!--    <c:if test ="${admin != null}">
                        <td style="text-align: center">
                            <form action="updatesp" method="get">
                                <input type="hidden" name="characterid" value="${nhanvat.characterid}">
                                <input type="submit" value="🖊️">
                            </form>
                        </td>
                        <td style="text-align: center">
                            <form action="deletesp" method="post">
                                <input type="hidden" name="characterid" value="${nhanvat.characterid}">
                                <input type="submit" value="X">
                            </form>
                        </td>
                                            </c:if>-->

                    </tr>
                </c:forEach>


              

            </tbody>
        </table>   
            <br> 
            số lượng nhân vật: ${characterCount}
            
        <p style = "color : grey" >${successMsg}</p>
        <c:set var="namel" value="${null}" scope ="session"></c:set>
        <p style="color : red">${msg}</p>
        <c:set var="msg" value="${null}" scope ="session"></c:set>
    </body>
</html>
