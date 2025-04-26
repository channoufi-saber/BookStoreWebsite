

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New Customer</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">

<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script src="../js/jquery.richtext.min.js"></script>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1 class="pageheading">
			<c:if test="${customer != null }">
				Edit Customer
			</c:if>
			<c:if test="${customer == null }">
				Create New Customer
			</c:if>
		</h1>
	</div>

	<div class="center">
		<c:if test="${customer != null}">
			<form action="update_customer" method="post" id="customerForm">
				<input type="hidden" name="customerId"
					value="${customer.customerId}">
		</c:if>
		<c:if test="${customer == null}">
			<form action="create_customer" method="post" id="customerForm">
		</c:if>
		<table class="form" style="width: 80%; border: 0; margin: 0 auto;">

			<tr>
				<td align="right">E-mail:</td>
				<td align="left"><input type="text" id="email" name="email"
					size="20" value="${customer.email }"></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" id="fullname"
					name="fullname" size="20" value="${customer.fullname }"></td>
			</tr>

			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password"
					name="password" size="20" value="${customer.password }"></td>
			</tr>

			<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" id="confirmPassword"
					name="confirmPassword" size="20" value="${customer.password }"></td>
			</tr>

			<tr>
				<td align="right">Phone Number:</td>
				<td align="left"><input type="text" id="phone" name="phone"
					size="20" value="${customer.phone }"></td>
			</tr>

			<tr>
				<td align="right">Address:</td>
				<td align="left"><input type="text" id="address" name="address"
					size="20" value="${customer.address }"></td>
			</tr>

			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city"
					size="20" value="${customer.city }"></td>
			</tr>

			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipcode" name="zipcode"
					size="20" value="${customer.zipcode }"></td>
			</tr>

			<tr>
				<td align="right">Country:</td>
				<td align="left"><input type="text" id="country" name="country"
					size="20" value="${customer.country }"></td>
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

		$("#customerForm").validate({
			rules : {
				email : {
					required:true,
					email:true
					},
				fullname : "required",
				password : "required",
				confirmPassword : {
					required:true,
					equalTo:"#password"
				},
				phone : "required",
				address : "required",
				city : "required",
				zipcode : "required",
				country : "required"
			},
			messages : {
				email : {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address",
				},
				fullname : "Please enter a customer name",
				password : "Please enter a password",
				confirmPassword : {
					required:"Please confirm password",
					equalTo:"Confirm password does not match password"
				},
					
				phone : "Please enter a phone number",
				address : "Please enter an address",
				city : "Please enter a city",
				zipcode : "Please enter a zip code",
				country : "Please enter a country",


			}
		})
	})
	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		}
		reader.readAsDataURL(file);
	}
</script>
</html>










