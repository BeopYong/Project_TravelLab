<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section>

<form name="productEnrollFrm" method="POST">

	<div class="inputArea"> 
		 <label>카테고리</label>
		 <select class="category1">
	 		 <option value="">101</option>
	 		 <option value="">102</option>
	 		 <option value="">103</option>
	 		 <option value="">201</option>
	 		 <option value="">301</option>
	 		 <option value="">302</option>
	 	</select>
		 <label>지역 코드</label>
		 <select class="category2" name="cateCode">
 			 <option value="">33</option>
 			 <option value="">51</option>
 			 <option value="">64</option>
		 </select>
	</div>

<div class="inputArea">
 <label for="gdsName">상품명</label>
 <input type="text" id="gdsName" name="gdsName" />
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <input type="text" id="gdsPrice" name="gdsPrice" />
</div>

<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <input type="text" id="gdsStock" name="gdsStock" />
</div>

<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
</div>

<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>

</form>



</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>