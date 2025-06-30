<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Write Review - Online Book Store</title>
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center" width="60%">
		<form id="reviewForm">
			<table class="normal">
				<tr>
					<td><h2>You already wrote a review for this book</h2></td>
					<td>&nbsp;</td>
					<td><h2>${loggedCustomer.fullname } </h2></td>
				</tr>
				<tr>
					<td colspan="3"><hr /></td>
				</tr>
				<tr>
					<td >
					<span id="book-title">${book.title }</span>
					<br /> 
					<img alt="image"
					src="data:image/jpg;base64,${book.base64Image}" class="book-large" /></td>
					<td>
						<div id="rateYo"></div>
						<input type="text" name="headline" size="60" readonly="readonly" style="margin-top: 10px;" value="${review.headline}" /><br /><br />
						<textarea rows="10" cols="70" name="comment" readonly="readonly">${review.comment }</textarea>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
		<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function(){

    $("#rateYo").rateYo({
	    starWidth: "40px",
	    fullStar: true,
	    rating:${review.rating},
	    readOnly:true
    });

});
</script>
</html>