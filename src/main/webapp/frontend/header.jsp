<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<div>
		<img src="images/BookstoreLogo.png">
	</div>
	<div>
		<form action="search" method="get">
			<input type="text" name="Keyword" size="50" /> 
			<input type="submit" value="Search" />
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Login">Sign In</a> | <a
			href="register">Register</a> | <a href="view_cart">Cart</a>
		</form>


		
	</div>
	<div>&nbsp;</div>
	<div>
		<c:forEach var="category" items="${listCategory }" varStatus="status">
			<a href="view_category?id=${category.categoryId }"> <font
				size="+1"><b><c:out value="${category.name }"></c:out></b></font>
			</a>
			<c:if test="${not status.last }">
				&nbsp; | &nbsp;
			</c:if>
		</c:forEach>
	</div>
</div>









