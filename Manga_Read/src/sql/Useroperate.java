package sql;

import mgclass.Manga_Cover;
import mgclass.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sql.MGoperate;

public class Useroperate {
	Connection conn=DBConn.getConn();
	PreparedStatement pstmt = null;
	
	ArrayList<User> findmb(){
		try {
			ArrayList<User> al=new ArrayList<User>();
			pstmt=conn.prepareStatement("select * from user");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				User usr=new User();
				usr.setuid(rs.getInt("uid"));
				usr.setmail(rs.getString("mail"));
				usr.setpassword(rs.getString("password"));
				usr.setname(rs.getString("name"));
				usr.setcollect(rs.getString("collect"));
				usr.setforbidden(rs.getString("forbidden"));
				al.add(usr);
			}
			return al;
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("搜索用户表出错");
			return null;
		}	
	}
	
	public String Regist(String mail, String password, String name) {
		int current_id = -1;
		
		try {
			pstmt=conn.prepareStatement("select * from user where mail = '"+mail+"' or name = '"+name+"';");
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return "该邮箱或用户名已存在";//该判断方法大小写不敏感，但我也没法，这是mysql5.7的问题
			}
			else {
				try {
					pstmt=conn.prepareStatement("select max(uid) from user");
					rs = pstmt.executeQuery();
					while(rs.next()) {
						current_id = rs.getInt("max(uid)");
					}
				}
				catch(Exception e) {
					e.printStackTrace();
					System.out.println("查询最大uid发生异常");
				}
				
				current_id++;
				
				try {
					pstmt=conn.prepareStatement("insert into user(uid,mail,password,name) values(?,?,?,?)");
					pstmt.setInt(1, current_id);
					pstmt.setString(2, mail);
					pstmt.setString(3, password);
					pstmt.setString(4, name);
					pstmt.executeUpdate();
				}
				catch(Exception e) {
					System.out.println("注册用户发生异常");
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("查询邮箱用户名出错");
		}
		
		return "注册成功";
	}
	
	public String CheckUser(String name) {
		try {
			pstmt=conn.prepareStatement("select * from user where name = '"+name+"';");
			ResultSet rs = pstmt.executeQuery();
			String usr = null;
			while(rs.next()) {
				usr = rs.getString("name");
			}
			return usr;
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Check用户名出现异常");
			return null;
		}
	}
	
	public String CheckPassword(String name, String password) {
		try {
			pstmt=conn.prepareStatement("select * from user where name = '"+name+"' and password = '"+password+"';");
			ResultSet rs = pstmt.executeQuery();
			String usr = null;
			while(rs.next()) {
				usr = rs.getString("name");
			}
			return usr;
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Check密码出现异常");
			return null;
		}
	}
	
	public String Collect(String UName, String MName) {
		try {
			pstmt=conn.prepareStatement("select * from collections where UName = '"+UName+"' and MName = '"+MName+"';");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				return "您已收藏过此漫画";		
			}
			try {
				pstmt=conn.prepareStatement("insert into collections(UName,MName) values('"+UName+"','"+MName+"');");
				pstmt.execute();//update,insert的语句，应该用execute(),而不是executeQuery()
				return "收藏成功";
			}
			catch(Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void CancelCollect(String MName,String UName) {
		try {
			pstmt=conn.prepareStatement("delete from collections where UName = '"+UName+"' and MName = '"+MName+"';");
			pstmt.execute();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Manga_Cover> SearchCollections(String UName){
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from collections where UName = '"+UName+"';");
			ResultSet rs=pstmt.executeQuery();
			MGoperate mop = new MGoperate();
			while(rs.next()) {
				Manga_Cover mg = new Manga_Cover();
				String mgname = rs.getString("MName");
				mg = mop.PreciseSearch(mgname);
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("搜索收藏出错");
			return null;
		}
	}
	
	public void MakeComment(String MName,String UName,String comment,String time) {
		try {
			pstmt=conn.prepareStatement("insert into comments(MName,UName,comment,time) values('"+MName+"','"+UName+"','"+comment+"','"+time+"');");
			pstmt.execute();
		}
		catch(Exception e) {
			System.out.println("评论时出错");
		}
	}
	
	public String AdminLogin(String ac,String pw) {
		try {
			pstmt=conn.prepareStatement("select * from Admins where account = '"+ac+"' and password = '"+pw+"';");
			ResultSet rs = pstmt.executeQuery();
			String Admin = null;
			while(rs.next()) {
				Admin = rs.getString("account");
			}
			return Admin;
		}
		catch(Exception e) {
			System.out.println("查询管理员表出错");
			return null;
		}
	}
}
