<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
<%
	//isErrorPage="true" 작성시 던져진 예외객체에 선언없이 접근가능.
	String msg = exception.getMessage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
				* {
		  -webkit-box-sizing: border-box;
		          box-sizing: border-box;
		}
		
		body {
		  padding: 0;
		  margin: 0;
		}
		
		#notfound {
		  position: relative;
		  height: 100vh;
		}
		
		#notfound .notfound {
		  position: absolute;
		  left: 50%;
		  top: 50%;
		  -webkit-transform: translate(-50%, -50%);
		      -ms-transform: translate(-50%, -50%);
		          transform: translate(-50%, -50%);
		}
		
		.notfound {
		  max-width: 767px;
		  width: 100%;
		  line-height: 1.4;
		  text-align: center;
		  padding: 15px;
		}
		
		.notfound .notfound-404 {
		  position: relative;
		  height: 220px;
		}
		
		.notfound .notfound-404 h1 {
		  font-family: 'Kanit', sans-serif;
		  position: absolute;
		  left: 50%;
		  top: 50%;
		  -webkit-transform: translate(-50%, -50%);
		      -ms-transform: translate(-50%, -50%);
		          transform: translate(-50%, -50%);
		  font-size: 186px;
		  font-weight: 200;
		  margin: 0px;
		  background: linear-gradient(130deg, #ffa34f, #ff6f68);
		  color:transparent;
		  -webkit-background-clip: text;
		  background-clip: text;
		  text-transform: uppercase;
		}
		
		.notfound h2 {
		  font-family: 'Kanit', sans-serif;
		  font-size: 33px;
		  font-weight: 200;
		  text-transform: uppercase;
		  margin-top: 0px;
		  margin-bottom: 25px;
		  letter-spacing: 3px;
		}
		
		
		.notfound p {
		  font-family: 'Kanit', sans-serif;
		  font-size: 16px;
		  font-weight: 200;
		  margin-top: 0px;
		  margin-bottom: 25px;
		}
		
		
		.notfound a {
		  font-family: 'Kanit', sans-serif;
		  color: #ff6f68;
		  font-weight: 200;
		  text-decoration: none;
		  border-bottom: 1px dashed #ff6f68;
		  border-radius: 2px;
		}
		
		.notfound-social>a {
		  display: inline-block;
		  height: 40px;
		  line-height: 40px;
		  width: 40px;
		  font-size: 14px;
		  color: #ff6f68;
		  border: 1px solid #efefef;
		  border-radius: 50%;
		  margin: 3px;
		  -webkit-transition: 0.2s all;
		  transition: 0.2s all;
		}
		.notfound-social>a:hover {
		  color: #fff;
		  background-color: #ff6f68;
		  border-color: #ff6f68;
		}
		
		@media only screen and (max-width: 480px) {
		  .notfound .notfound-404 {
		    position: relative;
		    height: 168px;
		  }
		
		  .notfound .notfound-404 h1 {
		    font-size: 142px;
		  }
		
		  .notfound h2 {
		    font-size: 22px;
		  }
		}
	</style>
<div id="notfound">
		<div class="notfound">
			<img src="https://item.kakaocdn.net/do/1c2f8f22f203dba838023f9275cd9cec8f324a0b9c48f77dbce3a43bd11ce785" alt="" />  
			<div class="notfound-404">
				<h1>ERROR</h1>
			</div>
			<h2>페이지 오류 발생</h2>
			
			<p>잠시후 다시 접속해주세요
              
            </p>
			<div>
                <p><a href="<%=request.getContextPath()%>/">홈으로 돌아가기</a></p>
            </div>
		</div>
	</div>
</html>