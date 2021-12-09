package com.tlab.mvc.product.model.dao;
import static com.tlab.mvc.common.JdbcTemplate.close;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import com.tlab.mvc.member.model.exception.MemberException;
import com.tlab.mvc.product.model.exception.ProductExcpetion;
import com.tlab.mvc.product.model.vo.Product;
import com.tlab.mvc.product.model.vo.ProductAttachment;
import com.tlab.mvc.product.model.vo.ProductEntity;
public class ProductDao {
    
    private Properties prop = new Properties();
    
    //기본 생성자에서 클래스 객체로 빌드패스를 통해 properties 가져오기
    public ProductDao() {
        String filepath = ProductDao.class.getResource("/product-query.properties").getPath();
        System.out.println(filepath);
        try {
            prop.load(new FileReader(filepath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public List<Product> randomProductFoodList(Connection conn, Map<String, Integer> param) {
        
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("randomProductList");
        ResultSet rs = null;
        List<Product> foodList = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, param.get("301"));
            pstmt.setInt(2, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                foodList.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
            
        return foodList;
    }
    
    public List<Product> randomProductPlaceList(Connection conn, Map<String, Integer> param) {
        
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("randomProductList");
        ResultSet rs = null;
        List<Product> placeList = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, param.get("302"));
            pstmt.setInt(2, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                placeList.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
            
        return placeList;
    }
    public List<Product> productFoodList(Connection conn, Map<String, Integer> param) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectAllProductList");
        System.out.println(sql);
        ResultSet rs = null;
        List<Product> foodList = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, param.get("301"));
            pstmt.setInt(2, param.get("start"));
            pstmt.setInt(3, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                foodList.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        System.out.println(foodList);
            
        return foodList;
        
    }
    public int selectTotalList(Connection conn, int p_category) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectTotalListCount");
        ResultSet rs = null;
        int totalCount = 0;
        System.out.println("productDao@sql = " + sql);
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, p_category);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                totalCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return totalCount;
    }
    
    
    public List<Product> productPlaceList(Connection conn, Map<String, Integer> param) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectAllProductList");
        System.out.println(sql);
        ResultSet rs = null;
        List<Product> placeList = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, param.get("302"));
            pstmt.setInt(2, param.get("start"));
            pstmt.setInt(3, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                placeList.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        System.out.println(placeList);
            
        return placeList;
        
    }
    public int selectTotalPlaceList(Connection conn, Map<String, Integer> param) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectTotalListCount");
        ResultSet rs = null;
        int totalCount = 0;
        System.out.println("productDao@sql = " + sql);
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, param.get("302"));
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                totalCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return totalCount;
    }
    
    public List<ProductEntity> selectAllProduct(Connection conn, Map<String, Integer> param) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectAllProduct");
        ResultSet rset = null;
        List<ProductEntity> list = new ArrayList<>();
        try {
            // 1.pstmt객체생성
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, param.get("start"));
            pstmt.setInt(2, param.get("end"));
            // 2.실행
            rset = pstmt.executeQuery();
            // 3.rset처리 : 하나의 레코드 -> vo객체하나 -> list에 추가
            while (rset.next()) {
                ProductEntity product = new ProductEntity();
                product.setRegion(rset.getString("region"));
                product.setP_category(rset.getInt("p_category"));
                product.setP_name(rset.getString("p_name"));
                product.setP_stock(rset.getInt("p_stock"));
                product.setUnit_price(rset.getInt("unit_price"));
                product.setValid(rset.getString("valid"));
                product.setReg_date(rset.getDate("reg_date"));
                list.add(product);      }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    public int selectTotalProductCount(Connection conn) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectTotalProductCount");
        ResultSet rset = null;
        int totalCount = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            if (rset.next())
                totalCount = rset.getInt(1); // 컬럼 인덱스
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return totalCount;
    }
    public List<ProductEntity> searchProduct(Connection conn, Map<String, Object> searchParam) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("searchProduct");
        ResultSet rset = null;
        List<ProductEntity> list = new ArrayList<>();
        String searchType = (String) searchParam.get("searchType");
        String searchKeyword = (String) searchParam.get("searchKeyword");
        switch (searchType) {
        case "cateCode":
            sql += " region like '%" + searchKeyword + "%'";
            break;
        case "gdsName":
            sql += " p_name like '%" + searchKeyword + "%'";
            break;
        case "p_content" : 
            sql += " p_content like '%" + searchKeyword + "%' or p_name like '%" + searchKeyword +"%'";
            break;
        }
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            while (rset.next()) {
                ProductEntity product = new ProductEntity();
                product.setRegion(rset.getString("region"));
                product.setP_category(rset.getInt("p_category"));
                product.setP_name(rset.getString("p_name"));
                product.setP_stock(rset.getInt("p_stock"));
                product.setUnit_price(rset.getInt("unit_price"));
                product.setValid(rset.getString("valid"));
                product.setReg_date(rset.getDate("reg_date"));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    public int updateProductValid(Connection conn, ProductEntity product) {
        int result = 0;
        PreparedStatement pstmt = null;
        String query = prop.getProperty("updateProductValid");
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, product.getValid());
            pstmt.setString(2, product.getP_name());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    public int updateProductStock(Connection conn, ProductEntity product) {
        PreparedStatement pstmt = null;
        int result = 0;
        String query = prop.getProperty("updateProductStock");
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, product.getP_stock());
            pstmt.setString(2, product.getP_name());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int insertProduct(Connection conn, Product product) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		//insert into product (no, region, p_category, p_name, p_stock, unit_price) 
		//values (seq_product_no.nextval, ?, ?, ?, ?, ?)
		int result = 0;
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, product.getRegion());
			pstmt.setInt(2, product.getP_category());
			pstmt.setString(3, product.getP_name());
			pstmt.setString(4, product.getP_content());
			pstmt.setInt(5, product.getP_stock());
			pstmt.setInt(6, product.getUnit_price());
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			throw new ProductExcpetion("상품 등록 오류.", e);
		} finally {
			close(pstmt);
		}
		return result;

	}


	public Product selectOneProduct(Connection conn, int no) {
		PreparedStatement pstmt = null;
		Product product = null;
		String sql = prop.getProperty("selectOneProduct");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				product = new Product();
				product.setNo(no);
				product.setRegion(rset.getString("region"));
				product.setP_category(rset.getInt("p_category"));
				product.setP_name(rset.getString("p_name"));
				product.setP_content(rset.getString("p_content"));
				product.setP_stock(rset.getInt("p_stock"));
				product.setUnit_price(rset.getInt("unit_price"));
				product.setValid(rset.getString("valid"));
				product.setReg_date(rset.getDate("reg_date"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return product;
	}


	public int selectLastProductNo(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectLastProductNo");
		ResultSet rset = null;
		int productNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				productNo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			throw new ProductExcpetion("상품 번호 조회 오류", e);
		} finally {
			close(pstmt);
		}
		
		
		return productNo;
	}


	public int insertProductAttachment(Connection conn, ProductAttachment pAtt) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductAttachment");
		int result = 0;
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pAtt.getProductNo());
			pstmt.setString(2, pAtt.getOriginalFilename());
			pstmt.setString(3, pAtt.getRenamedFilename());
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			throw new ProductExcpetion("첨부파일 등록 오류.", e);
		} finally {
			close(pstmt);
		}
		return result;
	
	}

	public List<ProductAttachment> selectAttachmentByProductNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentByProductNo");
		ResultSet rset = null;
		List<ProductAttachment> pAttachs = new ArrayList<>();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ProductAttachment pAttach = new ProductAttachment();
				pAttach.setNo(rset.getInt("no"));
				pAttach.setProductNo(rset.getInt("product_no"));
				pAttach.setOriginalFilename(rset.getString("original_filename"));
				pAttach.setRenamedFilename(rset.getString("renamed_filename"));
				
				pAttachs.add(pAttach);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return pAttachs;

	}
	

	public int deleteProduct(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteProduct"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public ProductAttachment selectOneProductAttachment(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ProductAttachment pAttach = null;
		String sql = prop.getProperty("selectOneProductAttachment");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pAttach = new ProductAttachment();
				pAttach.setNo(no);
				pAttach.setProductNo(rset.getInt("product_no"));
				pAttach.setOriginalFilename(rset.getString("original_filename"));
				pAttach.setRenamedFilename(rset.getString("renamed_filename"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pAttach;
		
		
	}

	public List<Product> productTicketPassList(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectAllProductList");
        System.out.println(sql);
        ResultSet rs = null;
        List<Product> ticketList = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, param.get("101"));
            pstmt.setInt(2, param.get("start"));
            pstmt.setInt(3, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                ticketList.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        System.out.println(ticketList);
            
        return ticketList;

	}

	public int updateProduct(Connection conn, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateProduct"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, product.getP_name());
			pstmt.setString(2, product.getRegion());
			pstmt.setInt(3, product.getP_category());
			pstmt.setInt(4, product.getUnit_price());
			pstmt.setInt(5, product.getP_stock());
			pstmt.setString(6, product.getP_content());
			pstmt.setInt(7, product.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public List<Product> selectAllProductList(Connection conn, Map<String, Integer> param, int p_category) {
		PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectAllProductList");
        System.out.println(sql);
        ResultSet rs = null;
        List<Product> list = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, p_category);
            pstmt.setInt(2, param.get("start"));
            pstmt.setInt(3, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                list.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        System.out.println(list);
            
        return list;
		
		
	}

	public List<Product> randomProductTicketList(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
        String sql = prop.getProperty("randomProductList");
        ResultSet rs = null;
        List<Product> foodList = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, param.get("101"));
            pstmt.setInt(2, param.get("end"));
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Product product = new Product();
                
                product.setNo(rs.getInt("no"));
                product.setRegion(rs.getString("region"));
                product.setP_category(rs.getInt("p_category"));
                product.setP_name(rs.getString("p_name"));
                product.setP_content(rs.getString("p_content"));
                product.setP_stock(rs.getInt("p_stock"));
                product.setUnit_price(rs.getInt("unit_price"));
                product.setValid(rs.getString("valid"));
                product.setReg_date(rs.getDate("reg_date"));
                
                foodList.add(product);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
            
        return foodList;
    }

	public List<ProductAttachment> productAttachment(Connection conn) {
		PreparedStatement pstmt = null;
        String sql = prop.getProperty("productAttachment");
        ResultSet rset = null;
        List<ProductAttachment> productAttachment = new ArrayList();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()){
				ProductAttachment pAttach = new ProductAttachment();
				pAttach.setNo(rset.getInt("no"));
				pAttach.setProductNo(rset.getInt("product_no"));
				pAttach.setOriginalFilename(rset.getString("original_filename"));
				pAttach.setRenamedFilename(rset.getString("renamed_filename"));
				
				productAttachment.add(pAttach);
                
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
            
        return productAttachment;
	}
}