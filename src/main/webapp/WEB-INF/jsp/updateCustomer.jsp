<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">--%>
<title>Insert title here</title>
</head>
<body>
<div class="container">

   	    <jsp:include page="welcome.jsp"/>

 

		<h1>Edit Customer Form</h1>
		<form action="updateCustomer" method="POST" modelAttribute="customer">
			<table class="table table-striped table-bordered">
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="id">Id</label> <input type="text"
							value="${customer.id}" class="form-control" id="id"
							name="id">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="firstname">firstname</label> <input class="form-control"
							id="firstname" name="firstname" placeholder="Enter firstname">
						${customer.firstname } </input>
					</div>
				</div>
			</div>
					<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="lastname">lastname</label> <input class="form-control"
							id="lastname" name="lastname" placeholder="Enter lastname">
						${customer.lastname } </input>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="email">Email</label> <input class="form-control"
							id="email" name="email" placeholder="Enter Email">
						${customer.email } </input>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="address">Address</label> <input class="form-control"
							id="address" name="address" placeholder="Enter Address">
						${customer.address } </input>
					</div>
				</div>
			</div>
			
				
</table>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
</div>
</body>

</html>