<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>PixelTrice</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<br>
<div class="banner-bootom-w3-agileits py-5">
    <div class="container py-xl-4 py-lg-2">
        <!-- title heading -->
        <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
            <span>I</span>mage
            <span>D</span>etails
        </h3><br>
        <!-- //title heading -->
        <div class="row">
            <div class="col-lg-5 col-md-8 single-right-left ">
                <div class="grid images_3_of_2">
                    <!-- Replace Thymeleaf syntax with standard HTML -->
                    <div class="flexslider">
                        <div class="thumb-image">                        
                                <img src="<%= request.getContextPath() %>/image/display/<%= request.getParameter("id") %>"
                                     class="img img-responsive img-fluid" alt="">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-7 single-right-left simpleCart_shelfItem">
                Name: <span class="mb-3"><c:out value="${name}" /></span>
                <p class="mb-3">
                    Price: &#36;<span class="item_price"><c:out value="${price}" /></span>
                </p>
                <div class="product-single-w3l">
                    Description: <span class="my-sm-4 my-3"><c:out value="${description}" /></span>
                </div><br>
                <a href="/image">Go Back</a>
                &emsp;<a href="/">Go Home</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
