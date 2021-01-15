package sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mgclass.Comment;

public class Commentoperate {
	
	Connection conn=DBConn.getConn();
	PreparedStatement pstmt = null;
	
	public ArrayList<Comment> FindMgComments(String MName){
		try {
			ArrayList<Comment> al = new ArrayList<Comment>();
			pstmt=conn.prepareStatement("select * from comments where MName = '"+MName+"';");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment cmt = new Comment();
				cmt.setMName(rs.getString("MName"));
				cmt.setUName(rs.getString("UName"));
				cmt.setcomment(rs.getString("comment"));
				cmt.settime(rs.getString("time"));
				al.add(cmt);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("按漫画查找评论出错");
			return null;
		}
	}
	
	public void DelComment(String MName, String UName, String time, String comment) {
		try {
			pstmt=conn.prepareStatement("delete from comments where MName='"+MName+"' and UName='"+UName+"' and time='"+time+"' and comment='"+comment+"';");
			pstmt.execute();
		}
		catch(Exception e) {
			System.out.println("删除评论出现异常");
		}
	}
}
