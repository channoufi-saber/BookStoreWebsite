<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results for ${Keyword } - Online Books Store</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<br>
	<div align="center">
		<c:if test="${fn:length(result) == 0 }">
			<h2>No Results for "${Keyword }".</h2>
		</c:if>
		<c:if test="${fn:length(result) > 0 }">
		<div align="center" style="width: 80%; margin: 0 auto;">
			<h2>Results for "${Keyword }":</h2>
			<c:forEach items="${result }" var="book">
				<div style="display: inline-block; margin: 20px">
					<div>
						<a href="view_book?id=${book.bookId }"> <img alt=""
							src="data:image/jpg;base64,${book.base64Image }" width="128"
							height="164" />
						</a>
					</div>
					<div>
						<a href="view_book?id=${book.bookId }"> 
						<b>${fn:substring(book.title,0,50)}...</b>
						</a>
					</div>
					<div>Rating *****</div>
					<div>
						by <i>${book.author}</i>
					</div>
					<div>
						<b>$ ${book.price}</b>
					</div>

				</div>
			</c:forEach>
		</div>
				</c:if>
		
		<div align="center" style="clear: both;">
			<h2>Best-Selling Books:</h2>
		</div>
		<div align="center" style="clear: both;">
			<h2>Most-favored Books:</h2>
		</div>
	</div>
	<br>


	<jsp:directive.include file="footer.jsp" />

</body>
</html>
