<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
	import="java.util.*, board.FreeDTO"    
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="mem" class="board.FreeDDL" scope="page" />
<jsp:useBean id="dto" class="board.FreeDTO" scope="page" />
<%!
	int listNum = 10; // 한페이지당 보여줄 목록 수
	int pageNum = 15; // 한 블럭당 보여줄 페이지 수
%>
	
<%

	String pg = request.getParameter("page");
	int mypg = 1;
	try{
		mypg = Integer.parseInt(pg);
		if(mypg < 1) mypg = 1;
	}catch(Exception e){
		mypg = 1;
	}
	int limitNum = (mypg - 1) * listNum;

	Vector data = mem.getSelect(limitNum, listNum);
	
	int maxColumn = mem.getAllSelect();
	int size = data.size();
	
	/*
		1. 전체페이지 수 2. 전체 블럭 수 3. 현재 블럭번호 4. 블럭당 시작번호 5. 블럭당 마지막 번호
	*/
	int totalPage = (int) Math.ceil(maxColumn / (double) listNum);
	int totalBlock = (int) Math.ceil(totalPage / (double) pageNum);
	int nowBlock = (int) Math.ceil(mypg / (double) pageNum);
	int startNum = (nowBlock - 1) * pageNum + 1;
	int endNum = nowBlock * pageNum;
	if(endNum > totalPage) endNum = totalPage;
%>

<div class="container lmember">
	<h2 class="mt-3 mb-3 text-center">게시판</h2>
	<div class="text-end">
		총 게시글 : <%=maxColumn %> / <%=totalPage %>페이지.
	</div>
	<div class="row">
		<table class="table table-striped memberstbl">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < size; i++){
						FreeDTO dt = (FreeDTO) data.elementAt(i);
						int num = dt.getNum();
						String username = dt.getUsername();
						String title = dt.getTitle();
						String wdate = dt.getWdate();
				%>
					<tr>
						<td><%=num %></td>
						<td><%=username %></td>
						<td><%=title %></td>
						<td><%=wdate %></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<div class="mt-3 mb-5 row">
	    <ul class="pagination justify-content-center mb-5">
	        <%
	            // 이전 페이지
	            if(startNum > 1){
	                int prevPage = startNum - 1;
	                out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=member/memberlist&page="+prevPage+"\">이전</a></li>");
	            }else{
	                out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">이전</a></li>");
	            }
	        
	            // 페이지 출력
	            for(int i = startNum; i < endNum; i++){
	                String act = "";
	                if(mypg == i) act = "active";
	        %>
	        <li class="page-item <%=act %>"><a class="page-link" href="?fname=member/memberlist&page=<%=i%>"><%=i %></a></li>
	        <%
	            }
	            
	            // 다음 페이지
	            if(endNum < totalPage){
	                int nextPage = endNum + 1;
	                out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=member/memberlist&page="+nextPage+"\">다음</a></li>");
	            }else{
	                out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">다음</a></li>");
	            }
	        %>
	        <a href="?fname=member/free">
	        	<button type="button" class="btn btn-primary mx-3 px-4"> 작성 </button> 
	        </a>
		    
	    </ul>
	</div>
</div>

















