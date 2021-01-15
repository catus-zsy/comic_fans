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
			System.out.println("�����û������");
			return null;
		}	
	}
	
	public String Regist(String mail, String password, String name) {
		int current_id = -1;
		
		try {
			pstmt=conn.prepareStatement("select * from user where mail = '"+mail+"' or name = '"+name+"';");
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return "��������û����Ѵ���";//���жϷ�����Сд�����У�����Ҳû��������mysql5.7������
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
					System.out.println("��ѯ���uid�����쳣");
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
					System.out.println("ע���û������쳣");
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("��ѯ�����û�������");
		}
		
		return "ע��ɹ�";
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
			System.out.println("Check�û��������쳣");
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
			System.out.println("Check��������쳣");
			return null;
		}
	}
	
	public String Collect(String UName, String MName) {
		try {
			pstmt=conn.prepareStatement("select * from collections where UName = '"+UName+"' and MName = '"+MName+"';");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				return "�����ղع�������";		
			}
			try {
				pstmt=conn.prepareStatement("insert into collections(UName,MName) values('"+UName+"','"+MName+"');");
				pstmt.execute();//update,insert����䣬Ӧ����execute(),������executeQuery()
				return "�ղسɹ�";
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
			System.out.println("�����ղس���");
			return null;
		}
	}
	
	public void MakeComment(String MName,String UName,String comment,String time) {
		try {
			pstmt=conn.prepareStatement("insert into comments(MName,UName,comment,time) values('"+MName+"','"+UName+"','"+comment+"','"+time+"');");
			pstmt.execute();
		}
		catch(Exception e) {
			System.out.println("����ʱ����");
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
			System.out.println("��ѯ����Ա�����");
			return null;
		}
	}
}
