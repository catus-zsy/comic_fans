package servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutServlet
 */
@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogOutServlet() {
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
		HttpSession session = request.getSession();
		
		Cookie[] cookies=request.getCookies();
		if(cookies!=null){
			int i;
			for(i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("UserCookie")){//deal界面设置的cookie名为acCookie
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);//保存cookie
					session.setAttribute("LorRmsg", "c_03");
				}
				else if(cookies[i].getName().equals("AdminCookie")) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);//保存cookie
					session.setAttribute("LorRmsg", "c_06");
				}
			}
		}
		
		response.sendRedirect("index.jsp");
	}

}
