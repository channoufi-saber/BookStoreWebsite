<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Internal Server Error</title>
</head>
<body>
	
	<div align="center">
	<div>
		<img src="${pageContext.request.contextPath }/images/BookstoreLogo.png">
	</div>
		<h2>Sorry, the server has encountered an erro while fulfilling your request.</h2>
		<h3>Please check back later or contact our administrators</h3>
	<div>
		<a href="javascript:history.go(-1)">Go Back</a>
	</div>
	</div>
</body>
</html>