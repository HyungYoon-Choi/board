

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.MemberDDL;

/**
 * Servlet implementation class LevelUpdate
 */
public class LevelUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String levelParam = req.getParameter("level");
		String numParam = req.getParameter("num");

		if (levelParam == null || levelParam.isEmpty() || numParam == null || numParam.isEmpty()) {
		    // Handle missing or invalid parameters
		    return;
		}
		
		MemberDDL ddl = new MemberDDL();
		int level = Integer.parseInt(req.getParameter("level"));
		int num = Integer.parseInt(req.getParameter("num"));
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		int rs = ddl.update(level, num);
		out.print(rs);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
