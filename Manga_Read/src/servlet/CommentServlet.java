package servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.Useroperate;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		Cookie[] cookies=request.getCookies();
		String user = "";
		String Admin = null;
		if(cookies!=null){
			int i;
			for(i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("AdminCookie")){
					String cookieValue=cookies[i].getValue();
					String Admininfo[]=cookieValue.split("#");//拆分字符串
					Admin=URLDecoder.decode(Admininfo[0],"UTF-8");
					System.out.println("index的Admin是:"+Admin);
				}
				else if(cookies[i].getName().equals("UserCookie")){//deal界面设置的cookie名为acCookie
					String cookieValue=cookies[i].getValue();
					String userinfo[]=cookieValue.split("#");//拆分字符串
					user=URLDecoder.decode(userinfo[0],"UTF-8");
				}
			}
		}
		SimpleDateFormat TIME = new SimpleDateFormat();
		String time = TIME.format(new Date());
		String UName = user;
		if("".equals(UName)&&Admin!=null) {
			UName = "管理员"+Admin;
		}
		String comment = request.getParameter("comment");
		String MName = request.getParameter("MName");
		
		if(UName.equals("")) {
			session.setAttribute("msg", "e_09");
			response.sendRedirect("index.jsp");
		}
		else {
			Useroperate uop = new Useroperate();
			
			if(comment.length() <= 80) {
				uop.MakeComment(MName, UName, comment, time);
				session.setAttribute("MName", MName);
			}
			else {
				session.setAttribute("msg", "e_08");
			}
		}
		
		response.sendRedirect("MangaCoverPage.jsp");
	}

}
