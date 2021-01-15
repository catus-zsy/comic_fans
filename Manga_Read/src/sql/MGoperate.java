package sql;

import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import mgclass.Manga_Cover;
import mgclass.Manga_Content;

public class MGoperate {
	Connection conn=DBConn.getConn();
	PreparedStatement pstmt = null;
	

	public ArrayList<Manga_Cover> findmg(){
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from manga_cover");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Cover mg=new Manga_Cover();
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.setauthor(rs.getString("tag"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}		
	} 
	
	public void AddMg(String name, String introduce, String classify, String author, String state, String grade, String theme, String area) {
		try {
			pstmt=conn.prepareStatement("insert into manga_cover(name,introduce,classify,tag,author,state, grade, theme, area) values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, introduce);
			pstmt.setString(3, classify);
			pstmt.setString(4, null);
			pstmt.setString(5, author);
			pstmt.setString(6,state);
			pstmt.setString(7,grade);
			pstmt.setString(8,theme);
			pstmt.setString(9,area);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("插入发生异常");
		}
	}
	
	public void DeleteMg(String delnm) {
		try {
			pstmt=conn.prepareStatement("delete from manga_cover where name='"+delnm+"'");
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("删除封面发生异常");
		}
		try {
			pstmt=conn.prepareStatement("delete from manga_content where name like '"+delnm+"_%'");
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("删除内容发生异常");
		}
	}
	
	public ArrayList<Manga_Cover> AdvanceSearch(String state,String classify,String grade,String theme,String area) {
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from manga_cover where state like '%"+state+"%' and  classify like '%"+classify+"%' and grade like '%"+grade+"%' and theme like '%"+theme+"%' and area like '%"+area+"%'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Cover mg=new Manga_Cover();
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.settag(rs.getString("tag"));
				mg.setauthor(rs.getString("author"));
				mg.setstate(rs.getString("state"));
				mg.setgrade(rs.getString("grade"));
				mg.settheme(rs.getString("theme"));
				mg.setarea(rs.getString("area"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("搜索发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	
	public ArrayList<Manga_Cover> SearchMgname(String mgn) {
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from manga_cover where name like '%"+mgn+"%'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Cover mg=new Manga_Cover();
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.settag(rs.getString("tag"));
				mg.setauthor(rs.getString("author"));
				mg.setstate(rs.getString("state"));
				mg.setgrade(rs.getString("grade"));
				mg.settheme(rs.getString("theme"));
				mg.setarea(rs.getString("area"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("搜索漫画名发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	public ArrayList<Manga_Cover> SearchMgauthor(String author) {
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from manga_cover where author like '%"+author+"%'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Cover mg=new Manga_Cover();
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.settag(rs.getString("tag"));
				mg.setauthor(rs.getString("author"));
				mg.setstate(rs.getString("state"));
				mg.setgrade(rs.getString("grade"));
				mg.settheme(rs.getString("theme"));
				mg.setarea(rs.getString("area"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("搜索作者发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	public Manga_Cover PreciseSearch(String mgn) {
		try {
			Manga_Cover mg=new Manga_Cover();
			pstmt=conn.prepareStatement("select * from manga_cover where name ='"+mgn+"'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.settag(rs.getString("tag"));
				mg.setauthor(rs.getString("author"));
				mg.setstate(rs.getString("state"));
				mg.setgrade(rs.getString("grade"));
				mg.settheme(rs.getString("theme"));
				mg.setarea(rs.getString("area"));
			}
			return mg;
		}
		catch(Exception e) {
			System.out.println("精确搜索发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	public ArrayList<Manga_Cover> SearchMgclsf(String mgn) {
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from manga_cover where classify ='"+mgn+"'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Cover mg=new Manga_Cover();
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.setauthor(rs.getString("author"));
				mg.setstate(rs.getString("state"));
				mg.setgrade(rs.getString("grade"));
				mg.settheme(rs.getString("theme"));
				mg.setarea(rs.getString("area"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("搜索分类发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	public ArrayList<Manga_Cover> SearchMgtag(String tag) {
		try {
			ArrayList<Manga_Cover> al=new ArrayList<Manga_Cover>();
			pstmt=conn.prepareStatement("select * from manga_cover where tag ='"+tag+"'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Cover mg=new Manga_Cover();
				mg.setname(rs.getString("name"));
				mg.setintroduce(rs.getString("introduce"));
				mg.setclassify(rs.getString("classify"));
				mg.setauthor(rs.getString("author"));
				mg.setstate(rs.getString("state"));
				mg.setgrade(rs.getString("grade"));
				mg.settheme(rs.getString("theme"));
				mg.setarea(rs.getString("area"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("搜索发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	
	public void AlterMg(String chg, String pre, int flag) {
		if(flag==1) {
			try {
				pstmt=conn.prepareStatement("update manga_cover set name = '"+chg+"' where name = '"+pre+"';");
				pstmt.execute();//update,insert的语句，应该用execute(),而不是executeQuery()
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(flag==2) {
			try {
				pstmt=conn.prepareStatement("update manga_cover set introduce = '"+chg+"' where name = '"+pre+"';");
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(flag==3) {
			try {
				pstmt=conn.prepareStatement("update manga_cover set classify = '"+chg+"' where name = '"+pre+"';");
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("flag出现错误");
		}
	}
	
	public void RecommendMg(String rcdnm,String situation) {
		if("R".equals(situation)) {
			try {
				pstmt=conn.prepareStatement("update manga_cover set tag = '"+1+"' where name = '"+rcdnm+"';");
				pstmt.execute();//update,insert的语句，应该用execute(),而不是executeQuery()
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if("CR".equals(situation)) {
			try {
				pstmt=conn.prepareStatement("update manga_cover set tag = '"+0+"' where name = '"+rcdnm+"';");
				pstmt.execute();//update,insert的语句，应该用execute(),而不是executeQuery()
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			System.out.println("situation的值为:"+situation);
		}
	}
	
	//上面是对漫画的封面进行的数据库操作
	//下面是对漫画内容页进行的操作
	public ArrayList<Manga_Content> findmgcontent(){
		try {
			ArrayList<Manga_Content> al=new ArrayList<Manga_Content>();
			pstmt=conn.prepareStatement("select * from manga_content");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Content mgc=new Manga_Content();
				mgc.setimgid(rs.getString("imgid"));
				mgc.setpage(rs.getString("page"));
				mgc.settotal_pages(rs.getString("total_pages"));
				mgc.setchapter(rs.getString("chapter"));
				al.add(mgc);
			}
			return al;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}		
	} 
	
	public void AddMgContent(String ImgId,int page,String chapter) {
		try {
			pstmt=conn.prepareStatement("insert into manga_content(imgid,page,total_pages,chapter) values(?,?,?,?)");
			pstmt.setString(1, ImgId);
			pstmt.setString(2, page+"");//将page转String
			pstmt.setString(3, null);
			pstmt.setString(4,chapter);
			pstmt.execute();//update,insert的语句，应该用execute(),而不是executeQuery()
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void SetTotalPages(String mgname_chapter, int total_pages) {
		try {
			pstmt=conn.prepareStatement("update manga_content set total_pages = '"+total_pages+"' where imgid like '"+mgname_chapter+"%';");
			pstmt.execute();//update,insert的语句，应该用execute(),而不是executeQuery()
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Manga_Content> SearchMgcontent(String mgc) {
		try {
			ArrayList<Manga_Content> al=new ArrayList<Manga_Content>();
			pstmt=conn.prepareStatement("select * from manga_content where imgid like '"+mgc+"%'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Content mg=new Manga_Content();
				mg.setimgid(rs.getString("imgid"));
				mg.setpage(rs.getString("page"));
				mg.settotal_pages(rs.getString("total_pages"));
				mg.setchapter(rs.getString("chapter"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("搜索发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	
	public ArrayList<String> Showchapter(String mgn) {
		try {
			ArrayList<String> al=new ArrayList<String>();
			pstmt=conn.prepareStatement("select distinct chapter from manga_content where imgid like '"+mgn+"%'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				String cpt=new String();
				cpt=rs.getString("chapter");
				al.add(cpt);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("章节搜索发生异常");
			e.printStackTrace();
			return null;
		}		
	}
	
	public ArrayList<Manga_Content> SelectChpater(String mgname, String mgchpt) {
		try {
			ArrayList<Manga_Content> al=new ArrayList<Manga_Content>();
			pstmt=conn.prepareStatement("select * from manga_content where imgid like '"+mgname+"%' and chapter = '"+mgchpt+"' order by(page) asc;");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Manga_Content mg=new Manga_Content();
				mg.setimgid(rs.getString("imgid"));
				mg.setpage(rs.getString("page"));
				mg.settotal_pages(rs.getString("total_pages"));
				mg.setchapter(rs.getString("chapter"));
				al.add(mg);
			}
			return al;
		}
		catch(Exception e) {
			System.out.println("漫画页搜索发生异常");
			e.printStackTrace();
			return null;
		}	
	}
	
	public Manga_Content SelectPage(String mgname, String mgchpt, String mgpage) {
		try {
			pstmt=conn.prepareStatement("select * from manga_content where imgid like '"+mgname+"%' and chapter = '"+mgchpt+"' and page='"+mgpage+"';");
			ResultSet rs=pstmt.executeQuery();
			Manga_Content mg=new Manga_Content();
			while(rs.next()) {
				mg.setimgid(rs.getString("imgid"));
				mg.setpage(rs.getString("page"));
				mg.settotal_pages(rs.getString("total_pages"));
				mg.setchapter(rs.getString("chapter"));
			}
			return mg;
		}
		catch(Exception e) {
			System.out.println("漫画页搜索发生异常");
			e.printStackTrace();
			return null;
		}	
	}

}
