
<div>Debug: Rating=${book.averageRating},
	Stars=${book.ratingStars}</div>

<c:forTokens items="${book.ratingStars}" delims="," var="star">
	<c:if test="${star eq 'on'}">
		<a href=""> <img src="images/rating_on.png">
		</a>
	</c:if>
	<c:if test="${star eq 'off'}">
		<a href=""> <img src="images/rating_off.png" />
		</a>
	</c:if>
	<c:if test="${star eq 'half'}">
		<a href=""> <img src="images/rating_half.png" />
		</a>
	</c:if>
</c:forTokens>