package com.bookstore.service.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Review;

public class ReviewService {

	private ReviewDAO reviewDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public ReviewService( HttpServletRequest request, HttpServletResponse response) {
		super();
		this.reviewDAO = new ReviewDAO();
		this.request = request;
		this.response = response;
	}
	public void listAllReview() throws ServletException, IOException {
		listAllReview(null);
	}
	public void listAllReview(String message) throws ServletException, IOException {
		List<Review> listReviews=reviewDAO.listAll();
		request.setAttribute("listReviews", listReviews);
		if (message !=null) {
			request.setAttribute("message", message);
		}
		String listPage="review_list.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(listPage);
		dispatcher.forward(request, response);
	}

	public void editReview() throws ServletException, IOException {
		Integer reviewId=Integer.parseInt(request.getParameter("id"));
		Review review=reviewDAO.get(reviewId);
		request.setAttribute("review", review);
		
		String editPage="review_form.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
		
	}

	public void updateReview() throws ServletException, IOException {
		Integer reviewId=Integer.parseInt(request.getParameter("reviewId"));
		String headline=request.getParameter("headline");
		String comment=request.getParameter("comment");
		
		Review review=reviewDAO.get(reviewId);
		review.setHeadline(headline);
		review.setComment(comment);
		reviewDAO.update(review);
		String message="The review has been updated successfully.";
		listAllReview(message);
	}
	public void deleteReview() throws ServletException, IOException {
		Integer reviewId=Integer.parseInt(request.getParameter("id"));
		reviewDAO.delete(reviewId);
		String message="The review has been deleted successfully";
		listAllReview(message);
		
	}
	
}













