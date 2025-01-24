

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1 class="pageheading">Administrative Dashboard</h1>
	</div>
	
	<div align="center">
	<hr width="60%">
		<h1 class="pageheading">Quick Actions:</h1>
		<b>
			<a href="create_book">New Book</a> &nbsp;
			<a href="create_user">New User</a> &nbsp;
			<a href="create_category">New Category</a> &nbsp;
			<a href="create_customer">New Customer</a> &nbsp;
		</b>
	</div>

	<jsp:directive.include file="footer.jsp" />

</body>
</html>










