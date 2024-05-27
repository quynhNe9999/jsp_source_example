<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head> --%>
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

	<div class="container">
		<jsp:include page="welcome.jsp" />
		<%-- 		<%="welcome to jsp"%>
 --%>

		<h1>Add Sinh vien Form</h1>
		<a href="/addSinhVien" class="btn btn-primary"> Add Sinh Vien </a> <br>
		<br>
		<div>
			<!-- tìm kiếm -->
			<form>
				<tr>
					<td>Search: <input name="keyword" type="text" /></td>
					<td><input type="submit" value=" Search" /></td>
				</tr>
			</form>
		</div>
		<table id="example" class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Address</th>
					<th>Image</th>
					<th>Funtion</th>
				</tr>

			</thead>

			<tbody>
				<%--<c:out value="${data.content}" /> --%>

				<c:forEach var="sinhVien" items="${data.content}">
					<tr>
						<td>${sinhVien.id}</td>
						<td>${sinhVien.name}</td>
						<td>${sinhVien.email}</td>
						<td>${sinhVien.address}</td>
                <td><img src="<c:url value='/image/display/'/>${sinhVien.id}" class="card img-fluid" style="width:100px" alt=""/></td>
						<%-- <td><c:if test="${not empty sinhVien.image}">
								<img src="<c:url value='/view/${sinhVien.id}'/>" width="70"
									height="70">
							</c:if></td> --%>
						<%-- <td>${sinhVien.image}</td> --%>


						<td><a href="/editSinhVien/${sinhVien.id}"
							class="btn btn-warning"> Edit </a> <a
							href="/deleteSinhVien/${sinhVien.id}" class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- Display Pagination Controls -->
 		<%-- <div>

			<ul>
				<!-- Display Previous Page link if applicable -->
				<c:if test="${not data.first}">
					<li><a
						href="<c:url value='/view'>
                        <c:param name='page' value='${data.number - 1}'/>
                        <c:param name='size' value='${data.size}'/>
                        <c:param name='keyword' value='${param.keyword}'/>
                    </c:url>">Previous</a>
					</li>
				</c:if>

				<!-- Display Page numbers -->
				<c:forEach var="i" begin="0" end="${data.totalPages - 1}">
					<li><a
						href="<c:url value='/view'>
                        <c:param name='page' value='${i}'/>
                        <c:param name='size' value='${data.size}'/>
                        <c:param name='keyword' value='${param.keyword}'/>
                    </c:url>">${i + 1}</a>
					</li>
				</c:forEach>

				<!-- Display Next Page link if applicable -->
				<c:if test="${not data.last}">
					<li><a
						href="<c:url value='/view'>
                        <c:param name='page' value='${data.number + 1}'/>
                        <c:param name='size' value='${data.size}'/>
                        <c:param name='keyword' value='${param.keyword}'/>
                    </c:url>">Next</a>
					</li>
				</c:if>

				<span>Page ${data.number + 1} of ${data.totalPages}</span>
				<span>Total SinhVien: ${data.totalElements}</span>
			</ul>
		</div>

	</div> --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // Khởi tạo DataTables
    var table = $('#example').DataTable();

    // Thay đổi số lượng bản ghi trên mỗi trang
    table.page.len(5).draw();

    // Ẩn hiện các điều hướng phân trang
    table.on('page.dt', function () {
        var info = table.page.info();
        console.log('Showing page ' + (info.page + 1) + (info.page + 2) + (info.page + 3) +  ' of ' + info.pages);
    });
});
</script>
	
    <script src="/js/product.js"></script>

</body>

</html>