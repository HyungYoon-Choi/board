package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class FreeDDL {
	
    public boolean insert(FreeDTO dto) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	int flag = 0;
    	try {
    		//conn = DBConnect.initConnection();  //Connection 객체에서 conn 받아오기
    		conn = new DBConnect().getConn();
    		
    		String query = "INSERT INTO bbs (bbsnum, title, username, content) VALUES (?, ?, ?, ?)";
    		pstmt = conn.prepareStatement(query);
    		pstmt.setInt(1, dto.getBbsnum());  // Provide the appropriate bbsnum value
    		pstmt.setString(2, dto.getTitle());
    		pstmt.setString(3, dto.getUsername());
    		pstmt.setString(4, dto.getContent());

    		flag = pstmt.executeUpdate();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try { 
    			if(pstmt != null) pstmt.close(); 
    		    if(conn != null) conn.close();
    		}catch(SQLException e) {}
    	}
    	if(flag > 0) { //성공
    		return true;
    	}else {  //실패
    		return false;
    	}
    }
    
    //멤버 수정하는 메소드
    public int update(int level, int num) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	int flag = 0;
    	try {
    		conn = new DBConnect().getConn();
    		String query = "";

    			query = "update bss set level=? where num=?";	  		  
    			pstmt = conn.prepareStatement(query);
        		pstmt.setInt(1, level);
        		pstmt.setInt(2, num);
        		flag = pstmt.executeUpdate();
        	}catch(Exception e) {
        		e.printStackTrace();
        	}finally {
        		try { 
        			if(pstmt != null) pstmt.close(); 
        		    if(conn != null) conn.close();
        		}catch(SQLException e) {}
        	}

        	return flag;

    }
    
    public boolean update(FreeDTO dto, String user) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	int flag = 0;
    	try {
    		conn = new DBConnect().getConn();
    		String query = "";
    		String userpass = (String) dto.getUserpass();
    		if(userpass==null || userpass.isEmpty() ) {
    			query = "update bbs set title=?, content=?";	  		  
    			pstmt = conn.prepareStatement(query);
        		pstmt.setString(1, dto.getTitle());
        		pstmt.setString(2, dto.getContent());
    		}else {
    			query = "update bbs set title=?, content=?";
    			pstmt = conn.prepareStatement(query);
    			pstmt.setString(1, dto.getTitle());
        		pstmt.setString(2, dto.getContent());
    		}
    		flag = pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try { 
    			if(pstmt != null) pstmt.close(); 
    		    if(conn != null) conn.close();
    		}catch(SQLException e) {}
    	}
    	if(flag > 0) { //성공
    		return true;
    	}else {  //실패
    		return false;
    	}
    }
    
    //AllSelect
    public static int getAllSelect() {
    	Connection conn = null;
    	Statement st = null;
    	ResultSet rs = null;
    	String sql = null;
    	int allCount = 0;
    	sql = "select count(*) from bbs";
    	try {
    	  
    	  conn = new DBConnect().getConn();	
    	  st = conn.createStatement();
    	  rs = st.executeQuery(sql);
    	  while(rs.next()) {
            allCount = rs.getInt(1);
    	  }
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}finally {
     	   try { 
   	    	if(rs != null) rs.close();
   		    if(st != null) st.close(); 
   	        if(conn != null) conn.close();
   	       }catch(SQLException e) {}    		
    	}
    	
    	return allCount;
    }
    
    //select
    public static Vector<FreeDTO> getSelect(String str) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String sql = null;
    	sql = "select * from bbs where userid=?";
    	Vector<FreeDTO> data = new Vector<>();
    	conn = new DBConnect().getConn();
    	try {
    	  ps = conn.prepareStatement(sql);
    	  ps.setString(1, str);
   
    	  //System.out.println(ps);
    	  rs = ps.executeQuery();

     	  while(rs.next()) {
    			FreeDTO fr = new FreeDTO();
    			fr.setNum(rs.getInt("num"));
    			fr.setBbsnum(rs.getInt("bbsnum"));
    			fr.setUserid(rs.getString("userpass"));
    			fr.setUserpass(rs.getString("username"));
    			fr.setUsername(rs.getString("useremail"));
    			fr.setWdate(rs.getString("wdate"));
    			fr.setUip(rs.getString("uip"));
    			fr.setCount(rs.getInt("count"));
    			fr.setTitle(rs.getString("title"));
    			fr.setContent(rs.getString("content"));
    			data.add(fr);
    	 }

    	}catch(SQLException e) {}
    	finally {
    	   try { 
    	    	if(rs != null) rs.close();
    		    if(ps != null) ps.close(); 
    	        if(conn != null) conn.close();
    	    }catch(SQLException e) {}
    	}
    	return data;
    }
    
     
    //select overload
    public static Vector<FreeDTO> getSelect(String str1, String str2, int opt) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String sql = null;
    	if(opt == 1) {
    	   sql = "select userid, userpass from bbs where username=? and useremail=?";
    	}else {
    	   sql = "select userid, userpass from bbs where userid=? and useremail=?";	
    	}   
    	Vector<FreeDTO> data = new Vector<>();
    	conn = new DBConnect().getConn();
    	try {
    	  ps = conn.prepareStatement(sql);
    	  ps.setString(1, str1);
    	  ps.setString(2, str2);
   
    	  //System.out.println(ps);
    	  rs = ps.executeQuery();

     	  while(rs.next()) {
    			FreeDTO fr = new FreeDTO();
    			fr.setUserid(rs.getString("userid"));
    			fr.setUserpass(rs.getString("userpass"));
    			data.add(fr);
    	 }

    	}catch(SQLException e) {}
    	finally {
    	   try { 
    	    	if(rs != null) rs.close();
    		    if(ps != null) ps.close(); 
    	        if(conn != null) conn.close();
    	    }catch(SQLException e) {}
    	}
    	return data;
    }
    
    //목록 select overload
    public static Vector<FreeDTO> getSelect(int limitNum, int listNum) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String sql = null;
    	sql = "select * from bbs order by num desc limit ? , ?";	
 
    	Vector<FreeDTO> data = new Vector<>();
    	conn = new DBConnect().getConn();
    	try {
    	  ps = conn.prepareStatement(sql);
    	  ps.setInt(1, limitNum);
    	  ps.setInt(2, listNum);
   
    	  System.out.println(ps);
    	  rs = ps.executeQuery();

     	  while(rs.next()) {
    			FreeDTO fr = new FreeDTO();
    			fr.setNum(rs.getInt("num"));
    			fr.setBbsnum(rs.getInt("bbsnum"));
    			fr.setUserid(rs.getString("userpass"));
    			fr.setUserpass(rs.getString("username"));
    			fr.setUsername(rs.getString("useremail"));
    			fr.setWdate(rs.getString("wdate"));
    			fr.setUip(rs.getString("uip"));
    			fr.setCount(rs.getInt("count"));
    			fr.setTitle(rs.getString("title"));
    			fr.setContent(rs.getString("content"));
    			data.add(fr);
    	 }

    	}catch(SQLException e) {}
    	finally {
    	   try { 
    	    	if(rs != null) rs.close();
    		    if(ps != null) ps.close(); 
    	        if(conn != null) conn.close();
    	    }catch(SQLException e) {}
    	}
    	return data;
    }
       
}
