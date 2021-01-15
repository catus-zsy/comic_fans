package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.Useroperate;

/**
 * Servlet implementation class CollectMangaServlet
 */
@WebServlet("/CollectMangaServlet")
public class CollectMangaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectMangaServlet() {
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
		
		String MName = request.getParameter("MName");
		String UName = request.getParameter("UName");
		
		if("".equals(UName)||UName==null) {
			session.setAttribute("msg", "e_06");
			response.sendRedirect("index.jsp");
		}
		else {
			Useroperate op = new Useroperate();
			
			String result = op.Collect(UName, MName);
			if("收藏成功".equals(result)) {
				session.setAttribute("msg", "c_04");
				session.setAttribute("MName",MName);
			}
			else if("您已收藏过此漫画".equals(result)) {
				session.setAttribute("msg", "e_07");
				session.setAttribute("MName",MName);
			}
		}
		
		response.sendRedirect("MangaCoverPage.jsp");
	}

}
