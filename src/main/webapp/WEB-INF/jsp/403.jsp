<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container" style="border:1px solid #ccc;padding:5px;">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
        </form>

        <h2>Welcome ${username} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>
 <a href="${pageContext.request.contextPath}/welcome">Home</a>

  | &nbsp;
 
   <a href="${pageContext.request.contextPath}/user">User</a>
 
  | &nbsp;
 
  <a href="${pageContext.request.contextPath}/view">SinhVien</a>
 
 | &nbsp;
  

  <a href="${pageContext.request.contextPath}/customer">Customer</a>

  &nbsp;|&nbsp;  

  <a href="${pageContext.request.contextPath}/upload">Upload</a>

   &nbsp;|&nbsp;  
 
  <a href="${pageContext.request.contextPath}/addImage">Image</a>


  &nbsp;|&nbsp;  

  <a href="${pageContext.request.contextPath}/image">Image Show</a>

 

</div>


<h1>Không có quyền truy cập</h1>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
