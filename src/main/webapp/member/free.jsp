<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="container">
  
    <h1 class="text-center">자유게시판</h1><br /><br />
    <form name="freelist" action="/board/freeok" method="post">
    	<div class="mb-3 mt-3">
			<div class="row">
				<label for="title" class="col-md-2 form-label">제목 :</label>
				<div class="col-md-5">
					<input type="text" class="form-control" id="title" name="title" />
				</div>
			</div>
		</div>
		<div class="mb-3 mt-3">
			<div class="row">
				<label for="username" class="col-md-2 form-label">작성자 :</label>
				<div class="col-md-5">
					<input type="text" class="form-control" id="username" name="username" />
				</div>
			</div>
		</div>
      	<textarea id="summernote" name="message"></textarea><br />
      	<button type="button" class="btn btn-primary mx-3 px-4" onClick="boardReg();">전 송</button>
    </form>

  </div>

