package sql;
import java.sql.*;

public class DBConn {
	public static Connection Conn;
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("���ݿ���������ʧ��");
		}
		try {
			Conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/MGread?serverTimezone=UTC","root","HYC123456");
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("���ݿ�����ʧ��");
		}
		return Conn;
	}
	public static void main(String[] args) {
		DBConn Conn = new DBConn();
		Conn.getConn();
	}
}