

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<title>Edit Review</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1 class="pageheading">Edit Review</h1>
	</div>

	<div align="center">
			<form action="update_review" method="post"
				id="reviewForm">
				<input type="hidden" name="reviewId"
					value="${review.reviewId}">

			<table class="form">
			<tr>
				<td align="right"><b>Book:</b></td>
				<td align="left">${review.book.title }</td>
			</tr>
			<tr>
				<td align="right"><b>Rating:</b></td>
				<td align="left">${review.rating }</td>
			</tr>
			<tr>
				<td align="right"><b>Customer</b></td>
				<td align="left">${review.customer.fullname }</b></td>
			</tr>
			<tr>
				<td align="right"><b>Headline:</b></td>
				<td align="left">
					<input type="text" size="60" name="headline" value="${review.headline }">
				</td>
			</tr>
			<tr>
				<td align="right"><b>Comment:</b></td>
				<td align="left">
					<textarea rows="5" cols="70" name="comment">${review.comment } </textarea>
				</td>
			</tr>
			

			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="javascript:history.go(-1)">Cancel</button>

				</td>
			</tr>
		</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#reviewForm").validate({
		rules:{
			headline:"required",
			comment:"required"
		},
		messages:{
			headline:"Please enter a headline",
			comment:"Please enter a comment",
		}
	})
})

</script>
</html>










