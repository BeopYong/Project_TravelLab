package com.tlab.mvc.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlab.mvc.cart.model.service.CartService;
import com.tlab.mvc.cart.model.vo.Cart;
import com.tlab.mvc.member.model.vo.Member;

/**
 * Servlet implementation class CartListServlet
 */
@WebServlet("/member/cartList")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Member memberId = (Member) session.getAttribute("loginMember");
			System.out.println("[CartListServlet] = " + memberId);
			List<Cart> list = cartService.selectAllCartList(memberId);
			System.out.println("[CartListServlet] = " + list);

			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/cart/cartListTest.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
