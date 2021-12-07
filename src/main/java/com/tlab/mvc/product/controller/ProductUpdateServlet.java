package com.tlab.mvc.product.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.ImageIO;
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
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/product/productUpdate")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		Product product = productService.selectOneProduct(no);
		
		request.setAttribute("product", product);
		request
		.getRequestDispatcher("/WEB-INF/views/product/productUpdate.jsp")
		.forward(request, response);
		
	}
	
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
				int no = Integer.parseInt(multipartRequest.getParameter("no"));
				String region = multipartRequest.getParameter("region");
				int p_category = Integer.parseInt(multipartRequest.getParameter("p_category"));
				String p_name = multipartRequest.getParameter("p_name");
				String p_content = multipartRequest.getParameter("p_content");
				int p_stock = Integer.parseInt(multipartRequest.getParameter("p_stock"));
				int unit_price = Integer.parseInt(multipartRequest.getParameter("unit_price"));
				
				Product product = new Product(no, region, p_category, p_name, p_content, p_stock, unit_price, null, null);
				System.out.println("[productUpdateServlet] = " + product);
				
				//attachment 객체
				
				Enumeration fileNames = multipartRequest.getFileNames();
				List<ProductAttachment> productAttachments = new ArrayList<>();

				if(!productAttachments.isEmpty()) 
					product.setAttachments(productAttachments);
				
				while(fileNames.hasMoreElements()) {
					String fileName = (String) fileNames.nextElement();
					
					File upFile =multipartRequest.getFile(fileName);
					if(upFile != null) {
						
					Attachment attach = MvcUtils.makeAttachment(multipartRequest, fileName);
					attach.setNo(no);
					
					ProductAttachment pAttach = new ProductAttachment();
					pAttach.setNo(attach.getNo());
					pAttach.setOriginalFilename(attach.getOriginalFilename());
					pAttach.setRenamedFilename(attach.getRenamedFilename());
					product.setAttachments(productAttachments);
					productAttachments.add(pAttach);
					
					//썸네일 생성
					try {
						//썸네일 가로사이즈
						int thumbnail_width = 130;
						//썸네일 세로사이즈
						int thumbnail_height = 180;
						//원본이미지파일의 경로+파일명
						File origin_file_name 
						= new File(saveDirectory+File.separator+pAttach.getRenamedFilename());
						//생성할 썸네일파일의 경로+썸네일파일명
						File thumb_file_name = new File(saveDirectory+"/thumbs"+File.separator+pAttach.getRenamedFilename()+"_thumb.jpg");
						
						BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
						BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
						Graphics2D graphic = buffer_thumbnail_image.createGraphics();
						graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
						ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
						System.out.println("썸네일 생성완료");
					
			        } catch (Exception e) {
			            e.printStackTrace();
			        	}
					}
				}
				
				//값 반환
				int result = productService.updateProduct(product);
				System.out.println("[productUpdateResult] = " + result);
				
				String msg = result > 0 ? "상품 수정 성공!" : "상품 수정 실패ㅠㅠ";
				
				request.getSession().setAttribute("msg", msg);
				String location = request.getContextPath() + "/product/productView?no="+product.getNo();
				response.sendRedirect(location);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
		//redirect
			
			
		}

}
