package com.tlab.mvc.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.tlab.mvc.cart.model.service.CartService;
import com.tlab.mvc.cart.model.vo.Cart;
import com.tlab.mvc.product.model.vo.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart/cartList")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();
	private Product product = new Product();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//폼이 multipartRequest로 잡혀있어서 그냥 request 요청으론 안 넘어감 ㅠㅠ
		String saveDirectory = getServletContext().getRealPath("/upload/product");
		System.out.println("[product@directory] = " + saveDirectory);
		
		int maxPostSize = 1024 * 1024 * 10; //10mb
		String encoding = "utf-8";
		
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest multipartRequest = 
				new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		//변수 받기
		int no = Integer.parseInt(multipartRequest.getParameter("no"));
		String product_name = multipartRequest.getParameter("p_name");
		int quantity = Integer.parseInt(multipartRequest.getParameter("quantity"));
		int product_bill = Integer.parseInt(multipartRequest.getParameter("product_bill"));
		String memberId = multipartRequest.getParameter("memberId");
		
		//카트 객체 생성
		Cart cart = new Cart(0, product_name, quantity, product_bill, memberId);
		System.out.println(cart);
		
		//값 반환
		int result = cartService.insertCart(cart);
		
		
		
		//상품 상세 페이지 다시 보여줘야 함!!!!!!!!!! -> 리다이렉트
		String location = request.getContextPath() + "/product/productView?no=" + no;
		
		response.sendRedirect(location);
	}

}
