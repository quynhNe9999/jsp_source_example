<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>PixelTrice</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
</head>
<body>
<br>
		<jsp:include page="welcome.jsp" />

<h3 class="text-center">Spring Boot Image Gallery Application
    <a href="/addImage" class="btn btn-primary">Add</a>
</h3>
<br><br>

<table id="example" class="table table-striped table-bordered text-center">
    <thead>
        <tr>
            <th>SR. No.</th>
            <th>Name</th>
            <th>Image</th>
            <th>Description</th>
            <th>Price</th>
            <th>Created date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="count" value="0" />
        <c:forEach var="imageGallery" items="${images}">
            <tr>
                <td><c:set var="count" value="${count + 1}" /><c:out value="${count}" /></td>
                <td><c:out value="${imageGallery.name}" /></td>
                <td><img src="<c:url value='/image/display/'/>${imageGallery.id}" class="card img-fluid" style="width:100px" alt=""/></td>
                <td><c:out value="${imageGallery.description}" /></td>
                <td><c:out value="${imageGallery.price}" /></td>
                <td><fmt:formatDate value="${imageGallery.createDate}" pattern="dd-MM-yyyy" /></td>
                <td><a href="<c:url value='/image/imageDetails'/>?id=${imageGallery.id}" class="btn btn-info text-right" target="_blank">View</a>
                     <a href="/editImage/${imageGallery.id}" class="btn btn-warning">Edit</a>
                    <a href="/deleteImage/${imageGallery.id}" class="btn btn-danger">Delete</a> 
                
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
/*     $(document).ready(function() {
        $('#example').DataTable();
        
    }); */
    
    $(document).ready(function() {
        // Khởi tạo DataTables
        var table = $('#example').DataTable();

        // Thay đổi số lượng bản ghi trên mỗi trang
        table.page.len(5).draw();

        // Ẩn hiện các điều hướng phân trang
        table.on('page.dt', function () {
            var info = table.page.info();
            console.log('Showing page ' + (info.page + 1) + ' of ' + info.pages);
        });
    });
    
</script>
</body>
</html>
