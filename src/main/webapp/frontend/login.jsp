<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Customer Login</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1>Customer Login:</h1>
			<c:if test="${message != null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>
		<form action="login" method="post" id="loginForm">
			<table>
				<tr>
					<td>Email:</td>
					<td>
						<input type="text" name="email" id="email" size="20" />
					</td>
				</tr>
				<tr>
					<td>Password:</td>
					<td>
						<input type="password" name="password" id="password" size="20" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">Login</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
		<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#loginForm").validate({
		rules:{
			email:{
				required:true,
				email:true,
			},
			password:"required",
		},
		
		messages:{
			email:{
				required:"Please enter email",
				email:"Please enter a valid email address",
			},
			password:"Please enter password"
		}
	})
})
</script>
</html>