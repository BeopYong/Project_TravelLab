package com.tlab.mvc.product.controller;

import java.io.File;
import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiException;
import com.sun.jimi.core.JimiUtils;
import java.awt.Image;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.tlab.mvc.common.Attachment;
import com.tlab.mvc.common.MvcUtils;
import com.tlab.mvc.product.model.service.ProductService;
import com.tlab.mvc.product.model.vo.Product;
import com.tlab.mvc.product.model.vo.ProductAttachment;

/**
 * Servlet implementation class ProductEnrollServlet
 */
@WebServlet("/product/productEnroll")
public class ProductEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//1. product 객체
		try {
			
			// 서버 컴퓨터에 사용자가 업로드한 파일을 저장
			String saveDirectory = getServletContext().getRealPath("/upload/product");
			System.out.println("[product@directory] = " + saveDirectory);
			
			int maxPostSize = 1024 * 1024 * 10; //10mb
			String encoding = "utf-8";
			
			FileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			
			// 업로드한 파일 정보를 p_attachment 테이블에 저장
			
			//product객체
			String region = multipartRequest.getParameter("region");
			int p_category = Integer.parseInt(multipartRequest.getParameter("p_category"));
			String p_name = multipartRequest.getParameter("p_name");
			String p_content = multipartRequest.getParameter("p_content");
			int p_stock = Integer.parseInt(multipartRequest.getParameter("p_stock"));
			int unit_price = Integer.parseInt(multipartRequest.getParameter("unit_price"));
			
			Product product = new Product(0, region, p_category, p_name, p_content, p_stock, unit_price, null, null);
			System.out.println("[productEnrollServlet] = " + product);
			
			//attachment 객체
			File uploadFile1 = multipartRequest.getFile("uploadFile1");
			System.out.println(uploadFile1.getName()+"@Servlet~~~~~~");

			if(uploadFile1 != null) {
				List<ProductAttachment> productAttachments = new ArrayList<>();
				
				Attachment attach = MvcUtils.makeAttachment(multipartRequest, "uploadFile1"); 
				//Attachment로 선언된 attach는 반환 후에도 자식타입으로 참조 못 함.
				//죽어도 Attachment 객체로만 반환됨
				
				ProductAttachment pAttach = new ProductAttachment();
				//ProductAttachment 객체 생성
				
				pAttach.setNo(attach.getNo());
				pAttach.setOriginalFilename(attach.getOriginalFilename());
				pAttach.setRenamedFilename(attach.getRenamedFilename());
				//attach에서 가져온 getter를 다시 setter로 변환해서 pAttach 객체를 만들어줘야 함. 
				
				productAttachments.add(pAttach);
				
				product.setAttachments(productAttachments);
			
						
//			//썸네일 동시에 저장
//			
//			String thumbnail_path = "C:/Workspaces/web_server_workspace/tlab_beta" + request.getContextPath() + "/upload/product/";
//			String thumbImg = thumbnail_path + "thumbs";
//			System.out.println(thumbnail_path);
//			System.out.println(thumbImg);
//			System.out.println(pAttach);
//			
//			Image thumnail = 
//					JimiUtils.getThumbnail(thumbnail_path+pAttach.getRenamedFilename(), 130, 180, Jimi.IN_MEMORY);
//			
//			try {
//				Jimi.putImage(thumnail, thumbImg + pAttach.getRenamedFilename());
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			
			}			
				
			
			//값 반환
			int result = productService.insertProduct(product);
			System.out.println("[productEnrollResult] = " + result);
			
			String msg = result > 0 ? "상품 등록 성공!" : "상품 등록 실패ㅠㅠ";
			
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/product/productList";
			response.sendRedirect(location);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	//redirect
		
		
	}

}
