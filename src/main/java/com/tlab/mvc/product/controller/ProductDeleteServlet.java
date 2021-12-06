package com.tlab.mvc.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.ProductAttachment;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/product/productDelete")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no = request.getParameter("no");
		System.out.println(no);
		
		try {
			//사용자 입력
			int productNo = Integer.parseInt(request.getParameter("no"));
			System.out.println(productNo);
			
			//업로드 파일 삭제 & 레코드 삭제
			List<ProductAttachment> productAttachments = productService.selectAttachmentByProductNo(productNo);
			System.out.println("[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! = ]" + productAttachments);
			if(productAttachments != null && !productAttachments.isEmpty()) {
				String saveDirectory = getServletContext().getRealPath("/upload/product");
				System.out.println(saveDirectory);
				for(ProductAttachment pAttach : productAttachments) {
					String renamedFilename = pAttach.getRenamedFilename();
					File delFile = new File(saveDirectory, renamedFilename);
					boolean deleted = delFile.delete();
					}
				}
				int result = productService.deleteProduct(productNo);
				String msg = result > 0 ? "상품 삭제 성공" : "상품 삭제 실패";
		
				// redirect
				request.getSession().setAttribute("msg", msg);
//				response.sendRedirect(request.getContextPath() + "/admin/productList");
				response.sendRedirect(request.getContextPath() + "/product/productList");
	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
