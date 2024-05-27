<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>

	<div class="container">
		<jsp:include page="welcome.jsp" />
		<%-- 		<%="welcome to jsp"%>
 --%>

		<h1>Add Customer Form</h1>
		<a href="/addCustomer" class="btn btn-primary"> Add Customer </a> <br>
		<br>
		<div>
			<!-- tÃ¬m kiáº¿m -->
			<form>
				<tr>
					<td>Search: <input name="keyword" type="text" /></td>
					<td><input type="submit" value=" Search" /></td>
				</tr>
			</form>
		</div>
		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Email</th>
					<th>Address</th>
					<th>Funtion</th>
				</tr>

			</thead>

			<tbody>
				<%--<c:out value="${data.content}" /> --%>

				<c:forEach var="customer" items="${data.content}">
					<tr>
						<td>${customer.id}</td>
						<td>${customer.firstname}</td>
						<td>${customer.lastname}</td>
						<td>${customer.email}</td>
						<td>${customer.address}</td>
					

						<td><a href="/editCustomer/${customer.id}"
							class="btn btn-warning"> Edit </a> <a
							href="/deleteCustomer/${customer.id}" class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- Display Pagination Controls -->
		<div>

			<ul>
				<!-- Display Previous Page link if applicable -->
				<c:if test="${not data.first}">
					<li><a
						href="<c:url value='/customer'>
                        <c:param name='page' value='${data.number - 1}'/>
                        <c:param name='size' value='${data.size}'/>
                        <c:param name='keyword' value='${param.keyword}'/>
                    </c:url>">Previous</a>
					</li>
				</c:if>

				<!-- Display Page numbers -->
				<c:forEach var="i" begin="0" end="${data.totalPages - 1}">
					<li><a
						href="<c:url value='/customer'>
                        <c:param name='page' value='${i}'/>
                        <c:param name='size' value='${data.size}'/>
                        <c:param name='keyword' value='${param.keyword}'/>
                    </c:url>">${i + 1}</a>
					</li>
				</c:forEach>

				<!-- Display Next Page link if applicable -->
				<c:if test="${not data.last}">
					<li><a
						href="<c:url value='/customer'>
                        <c:param name='page' value='${data.number + 1}'/>
                        <c:param name='size' value='${data.size}'/>
                        <c:param name='keyword' value='${param.keyword}'/>
                    </c:url>">Next</a>
					</li>
				</c:if>

				<span>Page ${data.number + 1} of ${data.totalPages}</span>
				<span>Total customer: ${data.totalElements}</span>
			</ul>
		</div>

	</div>
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