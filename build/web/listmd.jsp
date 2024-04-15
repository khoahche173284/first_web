<%-- 
    Document   : listmd
    Created on : Feb 11, 2024, 11:05:44 AM
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
        <h1 class="text-align-center" style = "color: red ">List Model</h1>
        <!-- thong bao da dang nhap -->
        <h5 class="text-align-center" style = "color : #97CBE6 ">${tbdn}</h5>
        
            <hr>   
            
            <form action="search" method="post">
                <label >Search :</label>
                <input placeholder="name" type="text" id="name" name = "name" required >
                <input type="submit" value="🔎️">
            </form>
           <!-- <form action="search" method="get">
                <label >Search by price : </label>
                <input placeholder="min" type="text" id="price" name = "pricemin" required >
                <input placeholder="max" type="text" id="price" name = "pricemax" required >
                <input type="submit" value="🔎️">
            </form>
            -->
            <p style = "color : grey" >${error}</p>
      
            <a href="addmd" style ="color : red" >Thêm </a>
            <br>
            <br>
        <!--   <button onclick="window.location.href='listmd'" class="button">sắp xếp theo ID</button>
           <button onclick="window.location.href='listtangdan'" class="button">Mức giá tăng dần</button>
           <br>-->
           <br>
           


          <!--   <button class="right-button">mức giá giảm dần</button> -->

       
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>QUANTITY</th> 
                    <th>CHARACTER</th>
                    <th>ANIME</th>
                    <th>PRICE</th>  
                    <th>DATE</th> 
                    
                  
                    <c:if test ="${admin != null}">
                    <th>Update</th>
                    <th>Delete</th>
                    </c:if>
                    <th>IMG</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="model" items="${modelList}">
                    <tr>
                        <td>${model.modelid}</td>
                        <td>${model.name}</td>
                        <td>${model.quantity}</td>
                        <td>${model.characterid}</td>
                        <td>${model.animeid}</td>
                        <td>${model.price}</td>
                        <td>${model.releasedate}</td>
                    <c:if test ="${admin != null}">
                        <td style="text-align: center">
                            <form action="updatemd" method="get">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <input type="submit" value="🖊️">
                            </form>
                        </td>
                        <td style="text-align: center">
                            <form action="deletemd" method="post">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <input type="submit" value="X">
                            </form>
                        </td>
                         </c:if>
                        <td>
                            <img width="5%"  src="${model.img}" >
                        </td>
                    </tr>
                </c:forEach>
                    <c:forEach var="model" items="${search}">
                    <tr>
                         <td>${model.modelid}</td>
                        <td>${model.name}</td>
                        <td>${model.quantity}</td>
                        <td>${model.characterid}</td>
                        <td>${model.animeid}</td>
                        <td>${model.price}</td>
                        <td>${model.releasedate}</td>
                        
                        

                    <c:if test ="${admin != null}">
                        <td style="text-align: center">
                            <form action="updatemd" method="get">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <input type="submit" value="🖊️">
                            </form>
                        </td>
                        <td style="text-align: center">
                            <form action="deletemd" method="post">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <input type="submit" value="X">
                            </form>
                        </td>
                        </c:if>
                    </tr>
                </c:forEach>
            
                    <c:forEach var="model" items="${searchprice}">
                    <tr>
                         <td>${model.modelid}</td>
                        <td>${model.name}</td>
                        <td>${model.quantity}</td>
                        <td>${model.characterid}</td>
                        <td>${model.animeid}</td>
                        <td>${model.price}</td>
                        <td>${model.releasedate}</td>
                        

                    <c:if test ="${admin != null}">
                        <td style="text-align: center">
                            <form action="updatemd" method="get">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <input type="submit" value="🖊️">
                            </form>
                        </td>
                        <td style="text-align: center">
                            <form action="deletemd" method="post">
                                <input type="hidden" name="modelid" value="${model.modelid}">
                                <input type="submit" value="X">
                            </form>
                        </td>
                        </c:if>
                    </tr>
                </c:forEach>      


              

            </tbody>
        </table>

        <p style = "color : grey" >${successMsg}</p>
        <c:set var="namel" value="${null}" scope ="session"></c:set>
        <p style="color : red">${msg}</p>
        <c:set var="msg" value="${null}" scope ="session"></c:set>
    </body>
</html>
