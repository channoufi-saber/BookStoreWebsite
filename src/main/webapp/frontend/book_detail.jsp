

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${book.title}-Online Books Store</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<br>
	<br>
	<div align="center">
		<table width="80%" style="border: 0">
			<tr>
				<td colspan="3" align="left">
					<h2>${book.title}</h2> by ${book.author}
				</td>
			</tr>
			<tr>
				<td rowspan="2"><img alt="image"
					src="data:image/jpg;base64,${book.base64Image}" width="240"
					height="300" /></td>
				<td valign="top" align="left"><jsp:directive.include
						file="book_rating.jsp" /> &nbsp;&nbsp; <a href="#reviews">${fn:length(book.reviews) } Reviews</a>
				</td>
				<td valign="top" rowspan="2" width="20%">
					<h2>$${book.price}</h2> <br />
					<button type="submit">Add to cart</button>
				</td>
			</tr>
			<tr>
				<td valign="top" style="text-align: justify;">
					${book.description}</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><h2>
						<a id="reviews">Customer Reviews</a>
					</h2></td>
				<td colspan="2">
					<button>Write a Customer Review</button>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="left">
					<table class="normal">
						<c:forEach items="${book.reviews }" var="review">
							<tr>
								<td><c:forTokens items="${review.stars }" delims=","
										var="star">
										<c:if test="${star eq 'on'}">
											<a href=""> <img src="images/rating_on.png">
											</a>
										</c:if>
										<c:if test="${star eq 'off'}">
											<a href=""> <img src="images/rating_off.png" />
											</a>
										</c:if>
									</c:forTokens> - <b>${review.headline }</b></td>
							</tr>
							<tr>
								<td>by ${review.customer.fullname } on ${review.reviewTime }
								</td>
							</tr>
							<tr>
								<td><i>${review.comment }</i></td>
							</tr>
							<tr>&nbsp;
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<br>

	<jsp:directive.include file="footer.jsp" />

</body>
</html>
