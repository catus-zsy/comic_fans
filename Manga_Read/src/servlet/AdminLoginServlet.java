package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
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
		String ac=request.getParameter("adminaccount");
		String pw=request.getParameter("adminpassword");
		HttpSession session =request.getSession();
		
		Useroperate uop = new Useroperate();
		String Admin = uop.AdminLogin(ac, pw);
		
		if(Admin!=null) {		
			Cookie[] cookies=request.getCookies();
			int i;
			if(cookies!=null){
				for(i=0;i<cookies.length;i++){
					if(cookies[i].getName().equals("UserCookie")){//deal界面设置的cookie名为acCookie
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);//保存cookie
					}
				}
			}
			
			SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");	//这句可有可无，因为这里 					
			Cookie cookie = new Cookie("AdminCookie",Admin+"#"+time.format(new Date()));//#是用来分割字符串的标记
			cookie.setMaxAge(60*60);//设置cookie保存时间，单位是秒
			response.addCookie(cookie);//保存cookie
			session.setAttribute("msg", "c_05");
		}
		response.sendRedirect("index.jsp");
		
	}

}
