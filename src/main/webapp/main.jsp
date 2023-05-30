<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기에 제목을 입력하십시오</title>
</head>
<body>
	<div class="container">
	   <div class="row">
	      <div class="col-md-6 col-6 mb-3 p-5">
	           <h2 class="text-center mb-4">공지사항</h2>
	           <ol class="list-group list-group-numbered">
	           <%
	             for(int i=0; i< 5; i++){
	           %>
	             <li class="list-group-item list-group-item-action">
	                 <a href="#"> 공지사항 1입니다. </a>
	             </li>    
	           <%
	             }
	           %>  
	          </ol>     
	          <h2 class="text-center mb-4 mt-4">자유게시판</h2>
	          <ol class="list-group list-group-numbered">
	          <%
	            for(int i=0; i< 5; i++){
	          %>
	             <li class="list-group-item list-group-item-action">
	                 <a href="#"> 자유게시판 1입니다. </a>
	             </li>    
	          <%
	             }
	          %>  
	          </ol>
	      </div>   
	      <div class="col-md-6 col-6 my-5">
	          <h2 class="text-center mb-4">갤러리</h2>
	          <div class="row">
	              <div class="col-md-4 col-4">
			  		<figure class="card card-product">
	      				<div class="img-wrap"><img src="images/002.jpg" class="img-thumbnail"></div>
	      				<figcaption class="info-wrap p-3">
	            			<h5 class="title">Another name of item</h5>
	            			<p class="desc">Some small description goes here</p>
	      				</figcaption>
	   				</figure>                 
	              </div>
	              <div class="col-md-4 col-4">
				  	<figure class="card card-product">
	      				<div class="img-wrap"><img src="images/003.jpg"  class="img-thumbnail"></div>
	      				<figcaption class="info-wrap p-3">
	           			 	<h5 class="title">Another name of item</h5>
	            			<p class="desc">Some small description goes here</p>
	     				</figcaption>
	   				</figure>                  
	              </div>
	              <div class="col-md-4 col-4">
				  	<figure class="card card-product">
	      				<div class="img-wrap"><img src="images/001.jpg"  class="img-thumbnail"></div>
	     				<figcaption class="info-wrap p-3">
	            			<h5 class="title">Another name of item</h5>
	            			<p class="desc">Some small description goes here</p>
	      				</figcaption>
	   				</figure>                  
	              </div>
	          </div>
	      </div>
	   </div>
	</div>
</body>
</html>