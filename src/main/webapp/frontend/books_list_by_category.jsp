<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Books in ${category.name} - Online Books Store</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<br>
	<br>
	<div align="center">
		<h2>${category.name}</h2>
	</div>

	<div align="center" style="width: 80%; margin: 0 auto;">
		<c:forEach items="${listBooks }" var="book">
			<div style="float: left; display: inline-block; margin: 20px">
				<div>
					<a href="view_book?id=${book.bookId }"> <img alt=""
						src="data:image/jpg;base64,${book.base64Image }" width="128"
						height="164" />
					</a>
				</div>
				<div>
					<a href="view_book?id=${book.bookId }"> <b>${book.title}</b>
					</a>
				</div>
				<div>
					<jsp:directive.include file="book_rating.jsp" />
				</div>
				<div>
					by <i>${book.author}</i>
				</div>
				<div>
					<b>$ ${book.price}</b>
				</div>

			</div>
		</c:forEach>
	</div>
	<br>
	<br><jsp:directive.include file="footer.jsp" />

</body>
</html>
