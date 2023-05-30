
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.FreeDDL;
import board.FreeDTO;

public class FreeOk extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		FreeDTO dto = new FreeDTO();
		FreeDDL ddl = new FreeDDL();	
		
		dto.setTitle(req.getParameter("title"));
		dto.setUsername(req.getParameter("username"));
		dto.setContent(req.getParameter("content"));

		dto.setUip();
		boolean isSuccess = ddl.insert(dto);
		if(isSuccess) {
			System.out.println("인서트 성공");
		}else {
			System.out.println("인서트 실패");
		}
		doGet(req, res);
	}
	

}
